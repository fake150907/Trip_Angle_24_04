from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import JSONResponse
from selenium.webdriver.common.by import By
import urllib.request

import sys
import io
import os

from langchain.llms import OpenAI
from langchain.prompts import PromptTemplate
from dotenv import load_dotenv
from langchain_openai import ChatOpenAI
from langchain_core.output_parsers import JsonOutputParser
from langchain_core.pydantic_v1 import BaseModel, Field
from selenium.webdriver.common.keys import Keys
import urllib.request



from bs4 import BeautifulSoup
from langchain.cache import SQLiteCache
from langchain.globals import set_llm_cache







app = FastAPI()

origins = [
    "http://localhost",
    "http://localhost:8080",
    "http://localhost:8081",
    "http://127.0.0.1:5500",
]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)
set_llm_cache(SQLiteCache(database_path="my_llm_cache.db"))


##http://127.0.0.1:8000/fashion/recommendation?minTemp=20.5&maxTemp=21.5
@app.get("/fashion/recommendation")
async def fashionRecommendation(
    minTemp: float, 
    maxTemp: float
):
    # sys.stdout = io.TextIOWrapper(sys.stdout.detach(), encoding = 'utf-8')
    # sys.stderr = io.TextIOWrapper(sys.stderr.detach(), encoding = 'utf-8')


    load_dotenv()

    client = OpenAI(
        # This is the default and can be omitted
        api_key=os.environ.get("OPENAI_API_KEY"),
    )


    template = """
    너는 베테랑 스타일리스트야.
    여행지의 최저, 최고온도를 기반으로 쾌적한 여행을 할 수 있는 옷을 추천해주고,
    여행 기간 중 최저온도는 {minTemp}도 이고 최고 온도는 {maxTemp}도 야.
    옷을 머리부터 발끝까지 스타일링해줘. 옷은 한국에서 구매할 수 있어야되고 한국의 일반적인 중상층들이 구매할 가격이어야해.
    또한 옷은 한국에서 대중적이고 많이 팔리고있는 옷 중에서 골라줘. 네이버 쇼핑에 이름과 브랜드를 검색할 때 검색 결과가 나오는 옷으로 해줘.
    먼저 남성이 입을 옷에 대한 옷 이름과 브랜드명을 최소 6개 이상 적어줘. 그리고 gender에 남성이라고 적어줘.
    그 다음에 여성이 입을 옷에 대한 옷 이름과 브랜드명을 최소 6개 이상 적어줘. 그리고 gender에 여성이라고 적어줘.
    무슨 일이 있어도 반드시 남자 6개, 여자 6개로 총 12개의 옷 이름과 브랜드명이 나와야되.
    꼭 총 데이터 개수가 12개가 되게 해줘.
    복장명은 정확하고 자세하게 적어줘.
    그리고 왜 그 복장을 골랐는지 복장에 대한 50자 이하의 설명을 적어줘.
    답변은 한국어로만 해야해. 
    아래 포맷에 맞춰서 답변해줘.

    FORMAT:
    {format_instructions}
    """


    class Fashion(BaseModel):
        name: str = Field(description="추천하는 옷의 이름")
        brand: str = Field(description="추천하는 옷의 메이커")
        gender: str=Field(description="옷을 입을 사람의 성별, 남성 또는 여성으로 답해줘.")
        description: str=Field(description="해당 옷을 선정한 이유")
        # imageUrl: str = Field(description="해당 옷의 이미지. 구글 등에서 크롤링 해 올 것")
        
    class FashionItems(BaseModel):
        fashionItems: Fashion = Field(description="추천하는 복장의 이름과 메이커")


    # 문자열 출력 파서를 초기화합니다.
    parser = JsonOutputParser(pydantic_object=FashionItems)

    prompt = PromptTemplate.from_template(template=template,
                                        partial_variables={
            "format_instructions": parser.get_format_instructions()},)

    # OpenAI 챗모델을 초기화합니다.
    model = ChatOpenAI(model="gpt-4-turbo",
                       temperature=0.5,)


    # 프롬프트, 모델, 출력 파서를 연결하여 처리 체인을 구성합니다.
    chain = prompt | model | parser
    
    

    
    resultGpt = chain.invoke({"minTemp": minTemp, "maxTemp": maxTemp})
    
    resultData={}
    

    client_id =  os.environ.get("CLIENT_ID")
    client_secret = os.environ.get("CLIENT_SECRET")
    
    for fashionItem in resultGpt['fashionItems']:

        
        encText = urllib.parse.quote(", ".join((fashionItem['gender']+"용 "+fashionItem['name'], fashionItem['brand'])))
        #url = "https://openapi.naver.com/v1/search/blog?query=" + encText # JSON 결과
        url = "https://openapi.naver.com/v1/search/shop.xml?query=" + encText # XML 결과
        request = urllib.request.Request(url)
        request.add_header("X-Naver-Client-Id",client_id)
        request.add_header("X-Naver-Client-Secret",client_secret)
        response = urllib.request.urlopen(request)
        rescode = response.getcode()
        if(rescode==200):
            response_body = response.read()
            body = response_body.decode('utf-8')
            soup = BeautifulSoup(body, "xml")
            item=soup.find("item")
            imageUrl = ""
            if item:
                image = item.find("image")
                imageUrl = image.text
                
            fashionItem['imageUrl'] = imageUrl



        else:
            fashionItem['imageUrl'] = ""
    

    resultData['data1'] = resultGpt['fashionItems']

    resultData['resultCode'] = 'S-1'
    resultData['message'] = 'Success'
    
    return JSONResponse(content=resultData)


##http://127.0.0.1:8000/shopingList/recommendation?countryName=일본&regionName=도쿄
@app.get("/shopingList/recommendation")
async def shopingListRecommendation(
    countryName: str, 
    regionName: str
):
    # sys.stdout = io.TextIOWrapper(sys.stdout.detach(), encoding = 'utf-8')
    # sys.stderr = io.TextIOWrapper(sys.stderr.detach(), encoding = 'utf-8')


    load_dotenv()

    client = OpenAI(
        # This is the default and can be omitted
        api_key=os.environ.get("OPENAI_API_KEY"),
    )


    template = """
    너의 친구가 {countryName} {regionName}에 여행을 가려고 하고 있어.
    너의 친구는 한국인이야.
    친구가 해당 여행지에서 한국돌아올 때 꼭 사와야 하는 쇼핑리스트나 기념품을 총 10개 추천해줘. 
    반드시 총 10개의 브랜드+상품명과 상품 설명이 나와야돼.
    해당 상품은 해당 나라에서 일반적으로 여행객들이 많이 사는 상품이어야해.
    상품명은 영어로, 상품 설명은 한국어로 적어줘.

    FORMAT:
    {format_instructions}
    """


    class shopingItem(BaseModel):
        name: str = Field(description="상품의 브랜드 + 이름")
        description: str=Field(description="상품에 대한 설명")
        # imageUrl: str = Field(description="해당 옷의 이미지. 구글 등에서 크롤링 해 올 것")
        
    class shopingList(BaseModel):
        shopingItems: shopingItem = Field(description="상품의 브랜드, 이름, 설명")


    # 문자열 출력 파서를 초기화합니다.
    parser = JsonOutputParser(pydantic_object=shopingList)

    prompt = PromptTemplate.from_template(template=template,
                                        partial_variables={
            "format_instructions": parser.get_format_instructions()},)

    # OpenAI 챗모델을 초기화합니다.
    model = ChatOpenAI(model="gpt-3.5-turbo",
                       temperature=0.5,)


    # 프롬프트, 모델, 출력 파서를 연결하여 처리 체인을 구성합니다.
    chain = prompt | model | parser
    
    

    
    resultGpt = chain.invoke({"countryName": countryName, "regionName": regionName})
    
    resultData={}
    
    ##"https://openapi.naver.com/v1/search/image.xml?query="
    client_id =  os.environ.get("CLIENT_ID")
    client_secret = os.environ.get("CLIENT_SECRET")
    
    for shopingItem in resultGpt['shopingItems']:

        
        encText = urllib.parse.quote(shopingItem['name'])
        #url = "https://openapi.naver.com/v1/search/blog?query=" + encText # JSON 결과
        url = "https://openapi.naver.com/v1/search/image.xml?query=" + encText # XML 결과
        request = urllib.request.Request(url)
        request.add_header("X-Naver-Client-Id",client_id)
        request.add_header("X-Naver-Client-Secret",client_secret)
        response = urllib.request.urlopen(request)
        rescode = response.getcode()
        if(rescode==200):
            response_body = response.read()
            body = response_body.decode('utf-8')
            soup = BeautifulSoup(body, "xml")
            item=soup.find("item")
            imageUrl = ""
            if item:
                foundLink = item.find("link")
                imageUrl=foundLink.text

                # thumbnail = item.find("thumbnail")
                
            shopingItem['imageUrl'] = imageUrl

        else:
            shopingItem['imageUrl'] = ""
    

    resultData['data1'] = resultGpt['shopingItems']

    resultData['resultCode'] = 'S-1'
    resultData['message'] = 'Success'
    
    return JSONResponse(content=resultData)