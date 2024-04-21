from typing import Union
from fastapi import FastAPI, Query
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import JSONResponse

import sys
import io
import os

from langchain.llms import OpenAI
from langchain.prompts import PromptTemplate
from dotenv import load_dotenv
from langchain_openai import ChatOpenAI
from langchain_core.output_parsers import JsonOutputParser
from langchain_core.pydantic_v1 import BaseModel, Field

from typing import List




app = FastAPI()

origins = [
    "http://localhost.tiangolo.com",
    "https://localhost.tiangolo.com",
    "http://localhost",
    "http://localhost:8080",
]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


    
@app.get("/fashion/recommendation")
async def createPlan(
    minTemp: str, 
    maxTemp: str
):
    sys.stdout = io.TextIOWrapper(sys.stdout.detach(), encoding = 'utf-8')
    sys.stderr = io.TextIOWrapper(sys.stderr.detach(), encoding = 'utf-8')


    load_dotenv()

    client = OpenAI(
        # This is the default and can be omitted
        api_key=os.environ.get("OPENAI_API_KEY"),
    )


    template = """
    너는 베테랑 스타일리스트야.
    여행지의 최저, 최고온도를 기반으로 쾌적한 여행을 할 수 있는 옷을 추천해주고,
    여행 기간 중 최저온도는 {minTemp} 이고 최고 온도는 {maxTemp} 야.
    옷을 머리부터 발끝까지 스타일링해줘. 옷은 한국에서 구매할 수 있어야돼.
    각 옷의 이름과 브랜드명을 최소 5개 이상 적어줘.
    답변은 한국어로만 해야해.
    아래 포맷에 맞춰서 답변해줘.

    FORMAT:
    {format_instructions}
    """


    class Fashion(BaseModel):
        name: str = Field(description="추천하는 옷의 이름")
        brand: str = Field(description="추천하는 옷의 메이커")
        # imageUrl: str = Field(description="해당 옷의 이미지를 볼 수 있는 url")
        
    class FashionItems(BaseModel):
        FashionItem: Fashion = Field(description="추천하는 복장의 이름과 메이커")


    # 문자열 출력 파서를 초기화합니다.
    parser = JsonOutputParser(pydantic_object=FashionItems)

    prompt = PromptTemplate.from_template(template=template,
                                        partial_variables={
            "format_instructions": parser.get_format_instructions()},)

    # OpenAI 챗모델을 초기화합니다.
    model = ChatOpenAI(model="gpt-3.5-turbo",)




    # 프롬프트, 모델, 출력 파서를 연결하여 처리 체인을 구성합니다.
    chain = prompt | model | parser
    
    
    
    resultData = chain.invoke({"minTemp": minTemp, "maxTemp": maxTemp, "countryName": countryName, 
                        "regionName": regionName})

    resultData['resultCode'] = 'S-1'
    resultData['message'] = 'Success'
    
    return JSONResponse(content=resultData)
