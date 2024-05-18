## 🛫 TripAngle : GPT 기반의 여행, 패션, 날씨 통합 추천 서비스
___

![](https://velog.velcdn.com/images/insamju300/post/829f1d9e-b53a-4d35-b945-9288fcf07ff9/image.png)


# 📌 프로젝트 소개
___
* TripAngle은 여행을 준비하는 사람들을 위한 정보 제공과 스타일링 서비스를 병합하여 제공합니다.
*  유저는 여행 장소 및 여행 일정을 지정하여, 해당 여행지에 대한 상세 정보, 여행지에 적합한 스타일링 정보, 추천할만한 여행 장소 정보 등을 제공받을 수 있습니다.

# 📅 개발 기간
___
- 2024.04.08 ~ 2024.05.09

# 👥 팀원 구성
___
|서명원|장윤린|윤가연|신규섭|
|:---:|:---:|:---:|:---:|
|<img src="https://velog.velcdn.com/images/yunlinit/post/03484ed2-c09c-415c-b78c-bd098012aa8b/image.jpg" height="350"/> |<img src="https://velog.velcdn.com/images/yunlinit/post/50a14c38-d5e7-4e5e-9e5f-aeca410a3e40/image.jpg" height="350"/>|<img src="https://velog.velcdn.com/images/yunlinit/post/1ee12c41-2fee-4f8c-991d-0f05538a93df/image.jpg" height="350"/>|<img src="https://velog.velcdn.com/images/yunlinit/post/e11db386-253c-4de1-94cd-908cd7c5ab74/image.jpg" height="350"/>|
|insamjoo300@gmail.com|yunlinit@gmail.com|yungayeon223@gmail.com|tlstlsrbrb11@gmail.com|



# 🛠 기술스택
___
* Front: HTML, CSS, Javascript, Jquery3, Tailwind, DaisyUI
* Front-API: Open Weather API, Open Meteo API
* 웹-프레임워크: 구글 앱 스크립트
* Back-개발언어: Java, Python
* Back-프레임워크: SpringBoot 3, FastAPI, Selenium
* Back-라이브러리: Langchain, BeautifulSoup, Lombok, Tomcat
* 템플릿 엔진: JSP
* ORM: Mybatis 3
* DB: MySQL 10
* 쿼리 브라우저: SQLYog
* 형성 관리: Git, GitHub
* 협업툴: Discord, Google 스프레드시트, Google 문서, 클로바노트
* 디자인: Figma
* 개발환경: Jdk 1.7, MAVEN, Spring Tool Suit 4, Visual Studio Code, Window 10


# 🙋‍♂️ 역할 분담
---
### 🐱‍💻서명원

◆프론트엔드
  - 스타일링 추천 페이지 : 날씨 정보, 옷차림 정보, 쇼핑리스트

◆ 백엔드
  - 메인: 국가 입력 및 검색 기능
  - 스타일링 추천: 날씨 정보, 옷차림 정보, 쇼핑 리스트
  - 마이 일정 상세: 날씨 정보, 옷차림 정보, 쇼핑 리스트
  - 로그인

◆ ERD
  - 메인페이지
  - 캘린더 페이지
  - 스타일링 추천 페이지
  - 공지사항 상세 보기
  - 공지사항 댓글
  - 여행후기 게시판 상세보기 페이지


◆ 크롤링 
- 국가 및 도시 정보 크롤링
- 전체 크롤링 기능 취합

### 🐱‍👓장윤린

◆ 피그마 디자인
  - 메인
  - 캘린더
  - 항공권/숙소예매 
  - 마이일정 목록 
  - 마이일정 상세
  - 회원가입
  - 로그인
  - 회원정보 상세 및 수정
  - 게시글 상세보기 
  - 게시글 작성
  - 공지사항 목록 

◆ 프론트엔드
  - 헤더
  - 메인페이지
  - 나의일정 목록 
  - 나의일정 상세보기
  - 회원가입
  - 로그인 
  - 회원정보 상세 및 수정
  - 공지사항 게시글 목록 
  - 게시글 상세보기 

◆ 백엔드
  - 나의일정 목록 
  - 나의 일정 상세 페이지: 기본정보 섹션
  - 나의 일정 상세 페이지: 삭제 
  - 나의 일정 상세 페이지: 꿀팁
  - 여행후기 작성 및 수정/삭제 
  - 회원가입 / 수정 / 탈퇴 

◆ 크롤링
  - 도시별 추천장소(맛집, 관광, 쇼핑) 크롤링

### 🐱‍🚀 신규섭

◆ 디자인
  - 헤더 디자인
  - 여행지 정보 페이지 : 여행지 설명세션, 꿀팁 세션
  - 스타일링 추천 페이지 : 날씨 리스트, 옷 추천 리스트, 쇼핑 추천 리스트

◆ 프론트엔드
- 캘린더 페이지 : 캘린더, 여행 기간 시작~종료 날짜 표시, 일정 입력 모달창(일정명, 일정 내용)

◆ 백엔드
- 여행지 정보 페이지 : 여행지 설명 세션
- 여행지 정보 페이지 : 꿀팁 세션
- 캘린더 페이지 : 일정 시작 ~ 종료 처리
- 캘린더 페이지 : 일정 입력 폼
- 여행 후기 게시판 상세보기 페이지
- 여행 후기 게시판 수정 페이지

◆ 크롤링
- 여행지 정보 페이지 : 여행지 정보 크롤링

### 🐱‍🐉 윤가연
◆ 디자인
  - 여행후기 게시판 목록 페이지
  - 여행후기 게시판 상세보기 페이지

◆ 프론트엔드
- 마이 일정 페이지 일정관리 페이지
- 여행지 설명 및 꿀팁 섹션
- 항공권 / 숙소 예매 페이지
- 여행후기 게시판 목록 페이지
- 여행후기 게시판 상세보기 페이지

◆ 백엔드
- 여행후기 게시판 목록 기능
- 마이 일정 페이지 일정관리(캘린더) 기능
- 테마별 추천장소 섹션 Tab
- 테마별 추천장소 섹션 List
- 테마별 추천장소 세부정보
- 항공권 / 숙소 예매 페이지

◆ ERD
- 여행지 설명 및 꿀팁 섹션
- 마이 일정 상세페이지 기본정보 섹션
- 마이 일정 상세페이지 꿀팁 섹션
- 테마별 추천장소 섹션 Tab
- 테마별 추천장소 섹션 List
- 추천 장소 세부정보 섹션
- 추천 장소 세부정보 리뷰목록
- 회원 테이블

◆ 크롤링
- 테마별 추천 장소 페이지(이름, 시설정보, 주소, 리뷰갯수, 이미지5개) 크롤링


# 💡 페이지별 기능
#### [메인화면]
![](https://velog.velcdn.com/images/insamju300/post/617afc64-567d-4b39-bf81-442ae648de61/image.png)
- 처음 시작화면은 여행테마에 맞는 4개의 영상이 재생되는 페이지 입니다.
- 메인페이지는 마우스 휠을 한번만 내려도 바로 다음섹션으로 내려가게 기능구현이 되어 있습니다.

![](https://velog.velcdn.com/images/insamju300/post/e702b42c-2dd7-45f6-bd6d-0784186a3ca3/image.png)
- 저희 TripAngle의 핵심 기능중 하나인 여행일정 만들기 기능을 사용하기 위해서는 검색창에서 가고 싶은 해외 여행지를 검색하여 선택 후 일정만들기를 하면 됩니다.

![](https://velog.velcdn.com/images/insamju300/post/f982ed58-9b17-4213-9237-999bbcd4db72/image.png)
- About TripAngle은 저희가 만든 TripAngle의 정체성인 trip, style, weather에 대한 설명을 적어놓은 섹션입니다.

![](https://velog.velcdn.com/images/insamju300/post/e09edb4d-b2b8-4d08-bbae-c8d5594f5479/image.png)
- TripAngle 프로젝트를 함께 만든 팀원들의 정보와 contact 할 수단을 작성해놓은 섹션입니다.

![](https://velog.velcdn.com/images/insamju300/post/4e91f583-9857-4034-842c-3f9cbba23d43/image.png)
- TripAngle 프로젝트를 함께 만든 팀원 전원이 함께 찍은 단체사진섹션입니다.

### [회원가입]
![](https://velog.velcdn.com/images/insamju300/post/b711c011-bdc6-473a-9f81-01ec2de997fc/image.png)
- 기본 정보 입력 후 회원가입을 합니다.

### [로그인 페이지]
![](https://velog.velcdn.com/images/insamju300/post/48da80aa-f584-4135-a53a-16a8c15cc2d6/image.png)
- 아이디와 비밀번호로 로그인을 합니다.

### [회원정보 수정]
![](https://velog.velcdn.com/images/insamju300/post/5b29c75e-9059-4daa-ab19-eb1598fff8e8/image.png)
- 회원정보 페이지에서 개인정보를 수정 할 수 있습니다.

### [티케팅 페이지]
![](https://velog.velcdn.com/images/insamju300/post/614a8e77-ce5a-4a79-9a98-e78e3f029a4c/image.png)
- 항공권 예매 섹션 클릭 시 Skyscanner 홈페이지로 연결됩니다.
- 숙소 예약 섹션 클릭 시 Booking.com 홈페이지로 연결됩니다.

### [여행지 기본정보]
![](https://velog.velcdn.com/images/insamju300/post/51f50584-b8bb-478a-813c-a15382faffa2/image.png)
- 기본정보 섹션은 선택한 여행지의 기본 정보, 기후를 확인 할 수 있습니다.

### [여행지 꿀팁]
![](https://velog.velcdn.com/images/insamju300/post/d5cbfd77-6b3c-4d4a-9ac0-e0f6e0298254/image.png)
- 꿀팁 섹션은 선택한 여행지의 사용 언어, 팁, 환율, 시차, 전압을 확인 할 수 있습니다.

### [일정 달력]
![](https://velog.velcdn.com/images/insamju300/post/eded322e-2f85-4bf6-9588-03e4ab9fc191/image.png)
- 일정 기간을 선택 할 수 있습니다.

### [일정 달력 - 기간 선택]
![](https://velog.velcdn.com/images/insamju300/post/0bdccf4d-12d9-4f14-bded-af3d303b5a48/image.png)
- 일정 기간은 오늘 날짜로부터 15일 이하로 선택 가능하며 2일 이상 선택해야 합니다.

### [일정 달력 - 일정 생성 입력창]
![](https://velog.velcdn.com/images/insamju300/post/e473406c-ddb7-4e79-8887-5ff61c89479c/image.png)
- 일정 제목과 내용을 입력하고 일정을 생성합니다.

### [스타일링 추천페이지 - 날씨]
![](https://velog.velcdn.com/images/insamju300/post/0785b172-6601-4e34-a5bd-3edd2acaf6e7/image.png)
- 일정 달력에서 선택한 기간의 날씨를 확인 할 수 있습니다.

### [스타일링 추천페이지 - 쇼핑리스트]
![](https://velog.velcdn.com/images/insamju300/post/a1e56db5-38c7-4030-8505-f99a5bd0dc54/image.png)
여행 지역에 맞는 쇼핑 리스트를 추천 받을 수 있습니다.

### [스타일링 추천페이지 - 옷추천]
![](https://velog.velcdn.com/images/insamju300/post/4ad5fd09-aaec-47f7-be35-44cf0d596702/image.png)
- 여행지 날씨에 맞는 의상을 추천 받을 수 있습니다.

### [나의 일정 상세- 기본정보 및 꿀팁]
![](https://velog.velcdn.com/images/insamju300/post/ae93ce31-86ea-48a0-b7d4-9bbcb02bbc4d/image.png)
- 여행지의 정보와 나의 일정명, 내용을 확인 할 수 있습니다.

### [나의 일정 상세-캘린더]
![](https://velog.velcdn.com/images/insamju300/post/5247ee72-9640-43c2-a153-50c8f2b59c91/image.png)
- 캘린더 보기 버튼 클릭시 날짜마다 일정 내용을 작성 할 수 있는 캘린더를 사용 가능합니다.

### [나의 일정 상세 - 옷추천 ]
![](https://velog.velcdn.com/images/insamju300/post/de37012e-994f-48df-958c-ce7265a0ff8c/image.png)
- 스타일링 추천페이지에서 추천받은 의상을 확인 할 수 있습니다.

### [나의 일정 상세-쇼핑리스트 및 장소추천]
![](https://velog.velcdn.com/images/insamju300/post/908dbd54-aa22-4307-afc0-a478aeb56ad6/image.png)
- 스타일링 추천페이지에서 추천받은 의상을 확인 할 수 있습니다.

### [장소 상세보기]
![](https://velog.velcdn.com/images/insamju300/post/8f040a76-f42b-4ba5-be7e-1b689ff48d35/image.png)
- 장소 탭에서 각 장소 섹션 클릭시 장소 상세보기로 이동하며, 각 장소의 정보를 확인 할 수 있습니다.

### [나의 일정]
![](https://velog.velcdn.com/images/insamju300/post/6d28b5cf-0422-43a0-89f4-8cb01ca9c142/image.png)
- 헤더의 나의 일정 부분을 클릭하고 내가 만든 일정을 카드 형식으로 확인이 가능합니다.

### [여행후기 리스트 ]
![](https://velog.velcdn.com/images/insamju300/post/b625f6d4-16db-4a51-bc26-a4a77b0c00ce/image.png)
- 헤더의 여행 후기 부분을 클릭하고 트립앵글을 이용하는 회원들의 게시글을 확인 할 수 있습니다.

### [여행후기 상세]
![](https://velog.velcdn.com/images/insamju300/post/b763dc5f-0120-4451-913a-4b7c6603da24/image.png)
- 트립앵글의 회원이 작성한 여행 후기의 상세 내용을 확인 할 수 있습니다.


# 📑 TripAngle 환경설정 가이드 북

### I. 프로젝트 실행에 필요한 프로그램  
[STS4](https://cdn.spring.io/spring-tools/release/STS4/4.22.0.RELEASE/dist/e4.31/spring-tool-suite-4-4.22.0.RELEASE-e4.31.0-win32.win32.x86_64.self-extracting.jar)  
[VSCode](https://code.visualstudio.com)  
[Xampp](https://www.apachefriends.org/)  
[SQLyog](https://s3.amazonaws.com/SQLyog_Community/SQLyog+13.2.1/SQLyog-13.2.1-0.x64Community.exe)  
[파이썬](https://www.python.org/ftp/python/3.12.3/python-3.12.3-amd64.exe)  

### 2. DB(DataBase) 세팅  
1. TripAngle 파일 내부의 DB.sql 파일을 메모장으로 실행 후 텍스트 전체 복사(ctrl+A)해주세요.  
![](https://velog.velcdn.com/images/insamju300/post/f79e7b36-4482-422e-8bbf-955ab08b973e/image.png)  
2. 텍스트 붙여넣기 후 전체 쿼리 실행(F9)해주세요.  
![](https://velog.velcdn.com/images/insamju300/post/f0044e4c-c134-492d-bf7f-315065c8e966/image.png)  

### 3. API KEY 세팅 및 FASTAPI 구동 방법  
구동시 필요한 프로그램  
 - VSCode  
 - Python 3.12.3  
 
1. OPEN WEATHER API KEY 적용을 위한 js 파일 생성  
keys.js란 파일 명으로 아래 내용을 담아 파일을 생성해 주세요.  
OPEN WEATHER API KEY는 아래 사이트에서 얻을 수 있습니다.  
https://openweathermap.org/  

파일에 담을 내용:  
``` javascript
const openWeatherApiKey= ()=>"yourkey";
```

2. keys.js파일의 배치 클론한 Trip_Angle_24_04\src\main\resources\static\resource 경로 아래 keys.js파일을 배치해 주세요.  
![](https://velog.velcdn.com/images/insamju300/post/159f4be7-339b-4f06-8a00-6ba4975d1d29/image.png)

3. OPEN AI API KEY와  네이버 API의 클라이언트ID와 시크릿 키 적용을 위한 .env 파일 생성 .env라는 파일 명으로 아래 내용을 담아 파일을 생성해 주세요.   
openai의 api키는 아래 사이트에서 얻을 수 있습니다.  
https://openai.com/index/openai-api  
네이버 클라이언트 id와 네이버 시크릿키는 아래 사이트에서 얻을 수 있습니다.  
https://developers.naver.com/main/  

파일에 담을 내용:
```python
OPENAI_API_KEY=your open_ai_api key
CLIENT_ID='your_naver_clientIdr'
CLIENT_SECRET = 'your_naver_secretKey'
```


4. .env파일의 배치
클론한 Trip_Angle_24_04\python 경로 아래 .env파일을 배치해 주세요.
![](https://velog.velcdn.com/images/insamju300/post/b1b43ade-149f-4f03-9c4d-8bc82c12903e/image.png)

5. VS code에서 FIle -> OpenFolder을 눌러주세요.![](https://velog.velcdn.com/images/insamju300/post/012aa05d-c29e-46fd-a718-458dfde72511/image.png)

6. 클론한 Trip_Angle_24_04\python 폴더를 선택해 주세요.

![](https://velog.velcdn.com/images/insamju300/post/5c9993fb-2074-4fa5-bb54-1b4926143888/image.png)

7.  Terminal -> New Terminal을 선택해 주세요.  
![](https://velog.velcdn.com/images/insamju300/post/461927a7-69dc-4668-94d0-af79bd1ca386/image.png)  

8. 프로그램에 필요한 라이브 러리 파일들을 받아오기 위해 터미널에 다음 명령어 들을 입력해주세요. (Python이 설치되어 경로설정도 되어있는 걸 전제로 합니다.)  
pip install fastapi  
pip install selenium  
pip install langchain  
pip install python-dotenv  
pip install langchain_openai  
pip install bs4  
pip install lxml
pip install unicorn

![](https://velog.velcdn.com/images/insamju300/post/815e117b-a67c-4e52-9a2a-76616b7b811b/image.png)  

9. 다음 명령어를 통해 fast api를 실행해 주세요.  
uvicorn main:app --reload  
![](https://velog.velcdn.com/images/insamju300/post/13ee38b0-8cd3-4ac2-8be0-ce6ee84e0f0b/image.png)  

### 4. ChromeDriver 설치 및 크롤링 작업  
 - 저희 프로젝트는 DB에 테스트 데이터를 미리 세팅해놨으므로 크롤링 작업은 필수가 아니지만, 추가적으로 더 많은 지역 데이터를 사용하려면 크롤링을 추가로 진행해야 합니다. (크롤링 방법은 6번부터 참고하세요.)  

#### ChromeDriver 115 버전 이후 드라이버 다운로드  
1. ChromeDriver - WebDriver for Chrome 접속  
[크롬 드라이버 다운로드](https://chromedriver.chromium.org/downloads)  


2. 노란색 형광펜으로 표시된 부분을 클릭해 들어갑니다.  
![](https://velog.velcdn.com/images/insamju300/post/fc2277ee-a1f6-46be-aa3b-af2f0a759e6e/image.png)  

3. table한 버전들이 나오는데 chromedriver 중 각자 OS에 맞는 버전의 URL을 복사해 주소창에 입력하면 웹 드라이버가 다운로드됩니다.![](https://velog.velcdn.com/images/insamju300/post/6e06fe03-83a5-4685-bf1e-c972e09e2dc9/image.png)  

4. 다운로드된 zip 파일의 압축을 해제합니다.  
![](https://velog.velcdn.com/images/insamju300/post/8bda1637-26e4-47ba-820e-a4b1434fce6d/image.png)  

5. chromedriver.exe(응용프로그램)을 현재 사용하고 있는 디렉토리에 추가해 주세요.  
- 저희 프로젝트를 구동 하기 위해선 c://work에 추가해주시면 됩니다.  
![](https://velog.velcdn.com/images/insamju300/post/10483837-46e8-4e47-b3da-1673c42a8615/image.png)  



#### STS4에서 크롤링 작업  
6. 기본값으로 20개의 지역만 크롤링하게 세팅되어있습니다. 추가적으로 더 많은 지역 크롤링을 희망하시면 노란색으로 표시된 숫자를 수정해주세요.  
- 전체 지역 크롤링은 숫자대신 null을 적으시면 됩니다.  

![](https://velog.velcdn.com/images/insamju300/post/c3d23db9-307a-4f71-8f24-4f0f8bfed5f2/image.png)  



7. com.example.demo.crawling 패키지에서 AllInitCrawler.java를 Run As Java Application으로 실행합니다.   

8. 크롤링이 시작되자마자 마우스 커서를 약 3초정도 건드리지 말아주세요. 크롤링 과정중 마우스 커서를 직접 이동시켜 클릭하는 이벤트가 추가되어있어, 사용자가 임의적으로 마우스 커서를 이동하면 크롤링중 에러가 발생할 수 있습니다.  


