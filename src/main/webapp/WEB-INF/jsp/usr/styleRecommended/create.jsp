<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="pageTitle" value="TIPINFORMATION PAGE"></c:set>
<%@ include file="../common/head.jspf"%>
<script src="/resource/keys.js" ></script>
<style>
    .weather-widget {
        display: flex;
        flex-direction: column;
        margin: 0 auto;
        padding: 41px 20px;
        width: 25%;
        overflow: auto;
        height: 640px;
        -ms-overflow-style: none;
        /* IE and Edge */
        scrollbar-width: none;
        /* Firefox */
    }

    .weather-widget ::-webkit-scrollbar {
        display: none;
    }

    .weather-header {
        display: flex;
        flex-direction: column;
    }

    .weather-title {
        display: flex;
        font-size: 15px;
        color: #3b3d40;
    }

    .weather-icon {
        font-family: SF Pro Display, sans-serif;
        font-weight: 500;
    }

    .weather-text {
        font-family: Inter, sans-serif;
        font-weight: 400;
    }



    .forecast-item {
        display: flex;
        padding-top: 3px;
        padding-bottom: 3px;
        white-space: nowrap;
        justify-items: end;
        align-items: baseline;

        gap: 30px;

        border-bottom: #c8c8c8 1px solid;

    }

    @media (max-width: 991px) {
        .forecast-item {
            white-space: initial;
        }
    }

    .forecast-day {
        color: #3b3d40;
        margin: auto 0;
        font-size: 22px;
        font-weight: 500;
    }

    .forecast-temps {
        display: flex;
        flex-direction: column;
        align-items: center;
        font-size: 15px;
        font-weight: 0;
        color: #3b3d40;
        justify-content: baseline;

    }

    @media (max-width: 991px) {
        .forecast-temps {
            white-space: initial;
        }
    }

    .forecast-icon {
        object-fit: auto;
        width: 40px;
        margin-bottom: -10px;
    }

    .forecast-low {
        margin-top: 12px;
        color: #1279C2;
        font-size: 22px;
        font-weight: 500;
        display: block;
        width: 40px;
    }

    .forecast-high {
        margin-top: 12px;
        color: #DC2B89;
        font-size: 22px;
        font-weight: 500;

    }

    .forecast-precipitation {
        color: rgb(92, 165, 204);
        font-size: 18px;
    }

    .forecast-item-alt {
        display: flex;
        margin-top: 15px;
        gap: 15px;
    }

    .forecast-temps-alt {
        display: flex;
        align-items: start;
        gap: 17px;
        font-size: 22px;
        color: #3b3d40;
        font-weight: 500;
        white-space: nowrap;
        justify-content: space-between;
        flex: 1;
    }

    @media (max-width: 991px) {
        .forecast-temps-alt {
            white-space: initial;
        }
    }

    .forecast-day-alt {
        margin-top: 12px;
    }

    .forecast-icon-alt {
        object-fit: auto;
        object-position: center;
        width: 25px;
        fill: #fff;
    }

    .forecast-low-alt {
        margin-top: 12px;
    }

    .forecast-high-container-alt {
        align-self: start;
        display: flex;
        margin-top: 12px;
        gap: 7px;
        flex: 1;
    }

    .forecast-high-alt {
        color: #3b3d40;
    }

    .forecast-precipitation-alt {
        color: #81cffa;
        align-self: start;
        margin-left: 69px;
    }

    @media (max-width: 991px) {
        .forecast-precipitation-alt {
            margin-left: 10px;
        }
    }


    .top-section {
        display: flex;
        width: 1280px;
        border-radius: 10px;
        overflow: hidden;
        border: solid #c8c8c8 1px;


    }

    .section-container {
        display: flex;
        justify-content: center;
    }

    .mt-100 {
        margin-top: 100px;
    }



    .region-widget {
        display: flex;
        flex-direction: column;
        overflow: hidden;
        position: relative;
        min-height: 640px;
        flex-grow: 1;
        font-size: 48px;
        color: #fff;
        font-weight: 400;
        white-space: nowrap;
        justify-content: center;
    }

    @media (max-width: 991px) {
        .region-widget {
            max-width: 100%;
            font-size: 40px;
            white-space: initial;
        }
    }



    .region-img {
        position: absolute;
        inset: 0;
        height: 100%;
        width: 100%;
        object-fit: cover;
        object-position: center;
    }

    .country-name-box {
        position: relative;
        text-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
        height: 100%;
        background-color: rgba(32, 33, 36, 0.4);
        align-items: center;
        justify-content: center;

    }

    .country-region-name {
        width: 100%;
        height: 100%;
        display: flex;
        flex-direction: column;
        gap: 10px;
        align-items: center;
        justify-content: center;
        line-height: 1;
    }



    .region-name {
        font-size: 24px;
        color: #fff;
        font-weight: 100;
    }

    /* 옷 추천 탭 */
    .recommendation-section {
        display: flex;
        flex-direction: column;
        width: 1280px;
    }

    .recommendation-header {
        align-self: start;
        display: flex;
        gap: 20px;
        padding: 0 20px;
    }

    .recommendation-title {
        flex: 1;
        font: 400 24px/28px Inter, sans-serif;
    }

    .recommendation-accent {
        color: #81c8a2;
    }

    .recommendation-tabs {
        display: none;
        gap: 14px;
        font-size: 16px;
        color: #3b3d40;
        font-weight: 600;
        line-height: 175%;
        align-items: center;
    }

    @media (max-width: 991px) {
        .recommendation-tabs {
            white-space: initial;
        }
    }

    .recommendation-tab {
        border-bottom: solid #D5F1E2;
        border-bottom-width: 0px;
        transition-duration: 0.1s;
        cursor: pointer;

    }


    .recommendation-tab:hover {
        border-bottom-width: 3px;

    }

    .active-recommendation-tab {
        border-bottom-width: 3px;
    }


    .recommendation-divider {
        border-bottom: 1px solid rgba(206, 206, 206, 1);
        margin-top: 11px;
        width: 100%;
    }

    @media (max-width: 991px) {
        .recommendation-divider {
            max-width: 100%;
        }
    }




    .ta-item-container {
        /*perspective: 1000px;*/

        display: none;
        overflow: auto;

        gap: 30px;
        width: 1280px;
        -ms-overflow-style: none;
        scroll-snap-type: x mandatory;
        padding-top: 10px;
        ;
        position: relative;

    }


    .ta-item-container::-webkit-scrollbar {
        display: none;
    }



    .ta-item-card {
        display: flex;
        flex-direction: column;
        max-width: 270px;
        border: 1px solid rgba(224, 219, 210, 1);
        border-radius: 8px;
        background-color: #fff;
        padding-bottom: 18px;
        font-weight: 400;
        position: relative;
        scroll-snap-align: start;
        min-width: 250px;
/*         padding: 2px; */
    }

    .ta-item-image {
        width: 100%;
        border-radius: 8px; 
        aspect-ratio: 1;
        object-fit: cover;
        object-position: center;
    }



    .ta-item-details {
        display: flex;
        flex-direction: column;
        margin: 36px 0 0 20px;
    }

    .ta-item-name {
        font: 20px;
        color: #383230;
        letter-spacing: -0.4px;
        font-weight: 500px;
    }

    .ta-item-info {
        font: 12px;
        color: #8c8c8c;
        margin-top: 5px;
    }



    .ta-item-details-info {
        display: flex;
        gap: 50px;

    }

    .ta-item-description {

        position: absolute;
        top: 0;
        /* Align top edge with the parent container */
        left: 0;
        /* Align left edge with the parent container */
        width: 100%;
        /* Match the width of the parent container */
        aspect-ratio: 1;
        height: 0px;
        /* Auto height to maintain aspect ratio, or set a fixed height */
        overflow: hidden;
        background-color: #474747;
        /* Solid white background */
        opacity: 80%;
        z-index: 2;
        /* Ensures it covers the image beneath it */
        transition-duration: 500ms;
        display: flex;
        justify-content: center;
        align-items: center;
        word-wrap: break-word;
        color: white;


    }



    .ta-item-image-container:hover .ta-item-description {
        height: 250px;
    }

    /* .shopping-list .ta-item-image-container:hover .ta-item-description {
    height: 250px;
  } */

    .play-button-container {
        background-color: #81c8a2;
        display: flex;
        gap: 30px;
        font-size: 20px;
        color: #fff;
        font-weight: 700;
        justify-content: space-between;

        height: 35px;
        align-items: center;
        padding: 0px 5px;
        cursor: pointer;

        transition-duration: 200ms;

    }

    @media (max-width: 991px) {
        .play-button-container {
            white-space: initial;
        }
    }

    .play-button-container:hover {
        background-color: #5e9d7a
    }


    .play-button-icon {
        width: 14px;
        fill: #fff;
    }

    .next-step-container {
        display: flex;
        flex-direction: column;
        text-align: center;
        padding: 0 20px;
    }

    /* .next-step-button {
    display: flex;
    gap: 8px;
    font-size: 16px;
    color: #505967;
    font-weight: 600;
    padding: 0 1px;
  }

  @media (max-width: 991px) {
    .next-step-button {
      white-space: initial;
    }
  }*/

    .next-step-text {
        text-decoration: none;
        color: #383230;
        transition-duration: 200ms;
    }

    .next-step-text:hover {
        text-shadow: 0px -1px 1px #8c8c8c
    }

    .next-step-text:active {
        color: #383230;
    }

    .next-step-icon {
        width: 12px;
        fill: #575757;
        align-self: start;
    }

    .detail-page-link {
        color: #81c8a2;
        margin-top: 9px;
        font: 400 11px Inter, sans-serif;
    }


    /* 옷 추천 탭 */
    .bottom-buttons-section {
        display: flex;
        width: 1280px;
        justify-content: space-between;
    }






    .loading-container {
        height: 300px;
        display: flex;
        align-items: center;
        justify-content: center;
        flex-direction: column;
    }

    .spinner {
        animation: rotator 1.4s linear infinite;
    }

    @keyframes rotator {
        0% {
            transform: rotate(0deg);
        }

        100% {
            transform: rotate(270deg);
        }
    }

    .path {
        stroke-dasharray: 187;
        stroke-dashoffset: 0;
        transform-origin: center;
        animation: dash 1.4s ease-in-out infinite, colors 5.6s ease-in-out infinite;
    }

    @keyframes colors {

        0%,
        100% {
            stroke: #81c8a2;
        }
    }

    @keyframes dash {
        0% {
            stroke-dashoffset: 187;
        }

        50% {
            stroke-dashoffset: 46.75;
            transform: rotate(135deg);
        }

        100% {
            stroke-dashoffset: 187;
            transform: rotate(450deg);
        }
    }
    .wall{
    height:90px;}
</style>
    <div class="wall"></div> 
    <div class="section-container">
        <section class="top-section">
            <div class="region-widget">
                <img loading="lazy"
                    srcset="${travelSchedule.extra__regionImageUrl }"
                    class="region-img" />
                <div class="country-name-box">

                    <span class="country-region-name"> ${travelSchedule.extra__contryName}<br>
                        <span class="region-name">${travelSchedule.extra__regionName}</span>
                    </span>

                </div>

            </div>

            <div class="weather-widget">
                <header class="weather-header">
                    <h2 class="weather-title">
                        <span class="weather-icon"><i class="fa-solid fa-calendar"></i>&nbsp;&nbsp;&nbsp;&nbsp;</span>
                        <span class="weather-text">일정 기준 날씨</span>
                    </h2>
                </header>
                <!--
                <div class="forecast-item">
                    <time class="forecast-day">24/04/26</time>


                    <div class="forecast-temps">
                        <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/35ed6434b95693cbc42d4973dbeac4aae780143560c7efba8090b9541627b937?apiKey=54ecc9e8d5c2403588119db4a1abe99e&"
                            alt="Low temperature icon" class="forecast-icon" />
                        <div class="forecast-precipitation">60%</div>
                    </div>

                    <span class="forecast-low">18°</span>
                    <span class="forecast-high">27°</span>
                </div>

                <div class="forecast-item">
                    <time class="forecast-day">24/04/26</time>

                    <div class="forecast-temps">
                        <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/35ed6434b95693cbc42d4973dbeac4aae780143560c7efba8090b9541627b937?apiKey=54ecc9e8d5c2403588119db4a1abe99e&"
                            alt="Low temperature icon" class="forecast-icon" />
                        <div class="forecast-precipitation">60%</div>
                    </div>

                    <span class="forecast-low">18°</span>
                    <span class="forecast-high">27°</span>
                </div>
            -->

        </section>
    </div>

    <main class="fashion-recommendation-main">

        <div class="section-container mt-100">
            <section class="recommendation-section">
                <header class="recommendation-header">
                    <h2 class="recommendation-title">
                        <span>날씨에 알맞는</span>
                        <span class="recommendation-accent">옷 추천</span>
                    </h2>
                    <nav class="recommendation-tabs">
                        <div class="recommendation-tab fashion-all">전체</div>
                        <div class="recommendation-tab fashion-women">여성</div>
                        <div class="recommendation-tab fashion-man">남성</div>
                    </nav>
                </header>
                <div class="recommendation-divider"></div>
            </section>




        </div>
        <div class="section-container">
            <div class="loading-container">
                <svg class="spinner" width="65px" height="65px" viewBox="0 0 66 66" xmlns="http://www.w3.org/2000/svg">
                    <circle class="path" fill="none" stroke-width="6" stroke-linecap="round" cx="33" cy="33" r="30">
                    </circle>
                </svg>
                <p>지금 ai가 날씨에 맞는 옷을 찾아주는 중입니다.</p>
            </div>


            <section class="ta-item-container fashion-all"></section>
            <section class="ta-item-container fashion-women"></section>
            <section class="ta-item-container fashion-man"></section>


        </div>


    </main>


    <main class="shoppinglist-recommendation-main mt-100">

        <div class="section-container ">
            <section class="recommendation-section ">
                <header class="recommendation-header">
                    <h2 class="recommendation-title">
                        <span>쇼핑 추천 </span>
                        <span class="recommendation-accent">리스트</span>
                    </h2>
                </header>
                <div class="recommendation-divider"></div>
            </section>




        </div>

        <div class="section-container">

            <div class="loading-container">
                <svg class="spinner" width="65px" height="65px" viewBox="0 0 66 66" xmlns="http://www.w3.org/2000/svg">
                    <circle class="path" fill="none" stroke-width="6" stroke-linecap="round" cx="33" cy="33" r="30">
                    </circle>
                </svg>
                <p>지금 ai가 해당 도시의 쇼핑리스트를 찾고 있습니다.</p>
            </div>



            <section class="ta-item-container shopping-list">

                <!-- <article class="ta-item-card">
                    <div class="ta-item-image-container">
                        <img src="https://cdn.builder.io/api/v1/image/assets/TEMP/38d76435c2a51d38ef2a5a261e37f9c408d0757e5903b27e3802d58ffc484113?apiKey=54ecc9e8d5c2403588119db4a1abe99e&" alt="Fashion Image" class="ta-item-image" loading="lazy" />
                        <div class="ta-item-description">Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam non aliquet metus. Suspendisse potenti. Suspendisse potenti. Donec accumsan eros et rhoncus imperdiet. Duis laoreet lobortis pulvinar. Ut efficitur at ipsum ac porttitor. Vestibulum a porttitor lectus. Nulla facilisi. Mauris a tortor in sapien luctus aliquet. Cras ultricies velit non nunc.</div>
                    </div>

                    <div class="ta-item-details">
                        
                    <h3 class="ta-item-name">상품명</h3>
                    <div class="ta-item-details-info">
                        <p class="ta-item-info">브랜드명</p>
                    </div>
                    </div>
                </article> -->




            </section>


        </div>


    </main>


    <div class="section-container mt-100">
        <section class="bottom-buttons-section">
            <section class="play-button-container">
                <span class="play-button-text">PLAY</span>
                <span class="play-button-text">▶</span>

            </section>
            <section class="next-step-container">
                <a href="#" class="next-step-text"
                 onclick='doCreateFormSubmit(event)'>다음단계 &gt;&gt;</a>
                <p class="detail-page-link">상세 페이지로 이동</p>
            </section>
        </section>
    </div>
    

    <form id="doCreateForm" action="/usr/styleRecommended/doCreate" method="post">
        <input type="hidden" id="travelScheduleId" name="travelScheduleId" value="${travelScheduleId}">
	    <input type="hidden" id="weatherDatas" name="weatherDatas">
	    <input type="hidden" id="fashionDatas" name="fashionDatas">
	    <input type="hidden" id="shoppingListDatas" name="shoppingListDatas">
    </form>

<script>


    let regionEnglishName = "${travelSchedule.extra__regionEnglishName}";
    let regionName = "${travelSchedule.extra__regionName }";
    let countryName = "${travelSchedule.extra__contryName }";



    let startDate = "${travelSchedule.startDate }";
    let endDate = "${travelSchedule.endDate }";
    let minTemp = Number.MAX_SAFE_INTEGER;
    let maxTemp = Number.MIN_SAFE_INTEGER;

    let weathers = [];
    let fashions = [];
    let shopingLists = [];
    
    
    let weatherDataComplite = false;
    let fashionDataComplite = false;
    let shoppingListDataComplite = false;
    
    let weatherDataError = false;
    let fashionDataError = false;
    let shoppingListDataError = false;
    
    fetchWeatherProcess(regionEnglishName);
    fetchShoppingListProcess(regionName, countryName);
    
    function doCreateFormSubmit(e){
    	e.preventDefault();
    	
    	if(weatherDataError || fashionDataError || shoppingListDataError){
    		alert("데이터 습득 도중 에러가 발생했습니다. 잠시 후 다시 시도해 주세요.")
    		return;
    	}
    	
    	
    	if(!weatherDataComplite){
    		alert("아직 날씨 데이터를 불러오고 있습니다.")
    		return;
    	}
    	
    	if(!fashionDataComplite){
    		alert("아직 옷 추천 데이터를 불러오고 있습니다.")
    		return;
    	}
    	
    	if(!shoppingListDataComplite){
    		alert("아직 패션아이템 추천 데이터를 불러오고 있습니다.")
    		return;
    	}
    	
    	document.getElementById('weatherDatas').value = JSON.stringify(weathers);
    	document.getElementById('fashionDatas').value = JSON.stringify(fashions);
    	document.getElementById('shoppingListDatas').value = JSON.stringify(shopingLists);
    	document.getElementById('doCreateForm').submit();
    }



    document.addEventListener('DOMContentLoaded', function () {
        // Select all elements with the class 'recommendation-tab'
        var tabs = document.querySelectorAll('.recommendation-tab');

        // Loop through each tab and add a click event listener
        tabs.forEach(function (tab) {
            tab.addEventListener('click', function () {
                // Remove 'active-recommendation-tab' class from all tabs
                document.querySelectorAll('.active-recommendation-tab').forEach(function (activeTab) {
                    activeTab.classList.remove('active-recommendation-tab');
                });

                // Hide all item containers
                document.querySelectorAll('.ta-item-container:not(.shopping-list)').forEach(function (container) {
                    container.style.display = 'none';
                });

                // Display the corresponding item container if tab has specific classes
                if (tab.classList.contains('fashion-all')) {
                    document.querySelectorAll('.ta-item-container.fashion-all').forEach(function (container) {
                        container.style.display = 'flex';
                    });
                } else if (tab.classList.contains('fashion-man')) {
                    document.querySelectorAll('.ta-item-container.fashion-man').forEach(function (container) {
                        container.style.display = 'flex';
                    });
                } else if (tab.classList.contains('fashion-women')) {
                    document.querySelectorAll('.ta-item-container.fashion-women').forEach(function (container) {
                        container.style.display = 'flex';
                    });
                }

                // Add 'active-recommendation-tab' class to the clicked tab
                tab.classList.add('active-recommendation-tab');

            });
        });
    });

    async function fetchGeoCode(regionEnglishName) {
        let apiKey = openWeatherApiKey();
        console.log("apiKey "+ apiKey)
        const url = `http://api.openweathermap.org/geo/1.0/direct?q=\${regionEnglishName}&appid=\${apiKey}&limit=1`;
        console.log("url "+url)

        try {
            const response = await fetch(url);
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            const data = await response.json();
            return data;
        } catch (error) {
            console.error('There was a problem with the fetch operation:', error);
            return null;
        }
    }
    async function fetchDailyWeather(lat, lon, startDate, endDate) {
        //참고 https://open-meteo.com/en/docs#hourly=&daily=weather_code,temperature_2m_max,temperature_2m_min,precipitation_probability_max&forecast_days=16&start_date=2024-05-01&end_date=2024-05-16

        //precipitation_probability_max 강수량
        //temperature_2m_max 최고온도
        //temperature_2m_min 최저온도
        //weather_code 날씨코드 https://openweathermap.org/img/wn/01d@2x.png

        const url = `https://api.open-meteo.com/v1/forecast?latitude=\${lat}&longitude=\${lon}&daily=weather_code,temperature_2m_max,temperature_2m_min,precipitation_probability_max&start_date=\${startDate}&end_date=\${endDate}`

        try {
            const response = await fetch(url);
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            const data = await response.json();
            return data;
        } catch (error) {
            console.error('There was a problem with the fetch operation:', error);
            return null;
        }
    }


    async function fetchWeatherProcess(regionEnglishName) {
        const weatherData = await fetchGeoCode(regionEnglishName);
        if (weatherData) {
            let lat = weatherData[0].lat;
            let lon = weatherData[0].lon;
            const dailyWeatherData = await fetchDailyWeather(lat, lon, startDate, endDate);
            const daily = dailyWeatherData.daily;

            for (let i = 0; i < daily.time.length; i++) {
                let newDailyWeather = {};

                newDailyWeather.day = daily.time[i];
                newDailyWeather.minTemp = Math.floor(daily.temperature_2m_min[i]);
                if (newDailyWeather.minTemp < minTemp) {
                    minTemp = newDailyWeather.minTemp;
                }
                newDailyWeather.maxTemp = Math.floor(daily.temperature_2m_max[i]);
                if (newDailyWeather.maxTemp > maxTemp) {
                    maxTemp = newDailyWeather.maxTemp;
                }
                newDailyWeather.humidity = daily.precipitation_probability_max[i];

                //참조 https://gist.github.com/stellasphere/9490c195ed2b53c707087c8c2db4ec0c

                newDailyWeather.icon = getIconCode(daily.weather_code[i]);

                weathers.push(newDailyWeather);
                
                
                
            }
            weatherDataComplite = true;
            weatherDataError = false;
            printWeathers();




            let fashionDatas = await fetchFashionRecommendation();

            if ("data1" in fashionDatas) {
                fashionDatas.data1.forEach((fashionData) => {
                    let newFashion = {};
                    newFashion.name = fashionData.name;
                    newFashion.brand = fashionData.brand;
                    if (fashionData.gender == "남성") {
                        newFashion.gender = 0;

                    } else {
                        newFashion.gender = 1;
                    }

                    newFashion.description = fashionData.description;
                    newFashion.imageUrl = fashionData.imageUrl;

                    fashions.push(newFashion);
                });
                

                fashionDataComplite = true;
                fashionDataError = false;
                

                printFashions();
                

            } else {
                alert("통신에 실패하여 옷 정보를 받아오지 못했습니다.");
                fashionDataError = true;
            }


        }else{
        	
        	alert("통신에 실패하여 날씨 정보를 받아오지 못했습니다.");
        }
    }

    async function printFashions() {

        const fashionAll = document.querySelector('.ta-item-container.fashion-all');
        const fashionMan = document.querySelector('.ta-item-container.fashion-man');
        const fashionWomen = document.querySelector('.ta-item-container.fashion-women');

        fashions.forEach((fashion) => {
            // Create the article element
            const article = document.createElement('article');
            article.className = 'ta-item-card';

            // Create the image container div
            const imageContainer = document.createElement('div');
            imageContainer.className = 'ta-item-image-container';

            // Create the image element
            const image = document.createElement('img');
            if (fashion.imageUrl == "") {
                image.src = "/resource/image/FashionNoimage.webp";
            } else {
                image.src = fashion.imageUrl;

            }

            image.alt = 'Fashion Image';
            image.className = 'ta-item-image';
            image.loading = 'lazy';

            // Append the image to the image container
            imageContainer.appendChild(image);

            // Create the description div
            const description = document.createElement('div');
            description.className = 'ta-item-description';
            description.textContent = fashion.description;

            // Append the description to the image container
            imageContainer.appendChild(description);

            // Append the image container to the article
            article.appendChild(imageContainer);

            // Create the details div
            const details = document.createElement('div');
            details.className = 'ta-item-details';

            // Create the item name h3
            const itemName = document.createElement('h3');
            itemName.className = 'ta-item-name';
            itemName.textContent = fashion.name;

            // Append the item name to the details div
            details.appendChild(itemName);

            // Create the details info div
            const detailsInfo = document.createElement('div');
            detailsInfo.className = 'ta-item-details-info';

            // Create and append brand name paragraph
            const brandName = document.createElement('p');
            brandName.className = 'ta-item-info';
            brandName.textContent = fashion.brand;
            detailsInfo.appendChild(brandName);

            // Create and append gender paragraph
            const gender = document.createElement('p');
            gender.className = 'ta-item-info';
            if (fashion.gender == 0) {
                gender.textContent = '남성';

            } else {
                gender.textContent = '여성';

            }

            detailsInfo.appendChild(gender);

            // Append the details info to the details div
            details.appendChild(detailsInfo);

            // Append the details div to the article
            article.appendChild(details);
            fashionAll.appendChild(article);
            const articleClone = article.cloneNode(true);
            if (fashion.gender == 0) {
                fashionMan.appendChild(articleClone);

            } else {
                fashionWomen.appendChild(articleClone);
            }

        });


        // Append the article to the document body or any other container
        fashionAll.style.display = "flex";
        document.querySelector(".recommendation-tabs").style.display = "flex";
        document.querySelector(".fashion-recommendation-main .loading-container").style.display = "none";
        document.querySelector(".recommendation-tab.fashion-all").classList.add("active-recommendation-tab");

    }






    async function fetchFashionRecommendation() {
        const url = `http://127.0.0.1:8000/fashion/recommendation?minTemp=\${minTemp}&maxTemp=\${maxTemp}`;



        try {
            const response = await fetch(url);
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            const data = await response.json();




            console.log(data);
            return data;
        } catch (error) {
            console.error('There was a problem with the fetch operation:', error);
            return null;
        }
    }




    function printWeathers() {
        var weatherWidget = document.querySelector(".weather-widget");

        weathers.forEach(function (weather) {
            var forecastItem = document.createElement("div");
            forecastItem.classList.add("forecast-item");

            var timeElement = document.createElement("time");
            timeElement.classList.add("forecast-day");
            var originalDate = "2024-04-26";

            // Split the date string by "-"
            var parts = weather.day.split("-");

            // Rearrange the parts to desired format
            var rearrangedDate = parts[0].slice(2) + "/" + parts[1] + "/" + parts[2];


            timeElement.textContent = rearrangedDate;


            var forecastTempsDiv = document.createElement("div");
            forecastTempsDiv.classList.add("forecast-temps");


            var lowTempIcon = document.createElement("img");
            lowTempIcon.classList.add("forecast-icon");
            lowTempIcon.setAttribute("src", `https://openweathermap.org/img/wn/\${weather.icon}@2x.png`);
            lowTempIcon.setAttribute("alt", weather.icon);
            forecastTempsDiv.appendChild(lowTempIcon);


            var forecastPrecipitation = document.createElement("div");
            forecastPrecipitation.classList.add("forecast-precipitation");

            forecastPrecipitation.textContent = weather.humidity + "%";
            forecastTempsDiv.appendChild(forecastPrecipitation);






            var forecastLow = document.createElement("span");
            forecastLow.classList.add("forecast-low");
            forecastLow.textContent = weather.minTemp + "°";


            var forecastHigh = document.createElement("span");
            forecastHigh.classList.add("forecast-high");
            forecastHigh.textContent = weather.maxTemp + "°";


            forecastItem.appendChild(timeElement);
            forecastItem.appendChild(forecastTempsDiv);
            forecastItem.appendChild(forecastLow);
            forecastItem.appendChild(forecastHigh);




            weatherWidget.appendChild(forecastItem);
        });
    }


    function getIconCode(weatherCode) {
        switch (weatherCode) {
            case 0:
                return "01d";

            case 1:
                return "01d";

            case 2:
                return "02d";

            case 3:
                return "03d";

            case 45:
                return "50d";

            case 48:
                return "50d";

            case 51:
                return "09d";

            case 53:
                return "09d";

            case 55:
                return "09d";

            case 56:
                return "09d";

            case 57:
                return "09d";

            case 61:
                return "10d";

            case 63:
                return "10d";

            case 65:
                return "10d";

            case 66:
                return "10d";

            case 67:
                return "10d";

            case 71:
                return "13d";

            case 73:
                return "13d";

            case 75:
                return "13d";

            case 77:
                return "13d";

            case 80:
                return "09d";

            case 81:
                return "09d";

            case 82:
                return "09d";

            case 85:
                return "13d";

            case 86:
                return "13d";

            case 95:
                return "11d";

            case 96:
                return "11d";

            case 99:
                return "11d";

            default:
                // 기본 동작
                break;
        }
    }


    async function fetchShoppingListProcess(regionName, countryName) {
        const shoppingListDatas = await fetchShoppingListRecommendation();

        console.log(shoppingListDatas);

        if ("data1" in shoppingListDatas) {
            shoppingListDatas.data1.forEach((shoppingItemData) => {
                let newShopping = {};
                newShopping.name = shoppingItemData.name;
                newShopping.description = shoppingItemData.description;
                newShopping.imageUrl = shoppingItemData.imageUrl;

                shopingLists.push(newShopping);
            });

            shoppingListDataComplite = true;
            shoppingListDataError = false;
            printShoppings();

        } else {
        	shoppingListDataError = true;
            alert("통신에 실패하여 쇼핑리스트 정보를 받아오지 못했습니다.");
        }

    }


    async function fetchShoppingListRecommendation() {
        const url = `http://127.0.0.1:8000/shopingList/recommendation?countryName=\${countryName}&regionName=\${regionName}`;

        try {
            const response = await fetch(url);
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            const data = await response.json();




            console.log(data);
            return data;
        } catch (error) {
            console.error('There was a problem with the fetch operation:', error);
            return null;
        }
    }

    async function printShoppings() {
        let shoppingListContainer = document.querySelector(".ta-item-container.shopping-list");
        shopingLists.forEach((shopingItem) => {
            // Create the main container for the item card
            const article = document.createElement('article');
            article.classList.add('ta-item-card');

            // Create the image container
            const imageContainer = document.createElement('div');
            imageContainer.classList.add('ta-item-image-container');
            article.appendChild(imageContainer);

            // Create the image element
            const img = document.createElement('img');
            if (shopingItem.imageUrl == "") {
                img.src = "/resource/image/ShppingListNoimage.webp";
            } else {
                img.src = shopingItem.imageUrl;

            }
            img.alt = 'Shpping List image';
            img.classList.add('ta-item-image');
            img.loading = 'lazy';
            imageContainer.appendChild(img);
            
            

            // Create the description div
            const descriptionDiv = document.createElement('div');
            descriptionDiv.classList.add('ta-item-description');
            descriptionDiv.textContent = shopingItem.description;
            imageContainer.appendChild(descriptionDiv);

            // Create the details container
            const detailsContainer = document.createElement('div');
            detailsContainer.classList.add('ta-item-details');
            article.appendChild(detailsContainer);

            // Create the heading for the item name
            const itemName = document.createElement('h3');
            itemName.classList.add('ta-item-name');
            itemName.textContent = shopingItem.name;
            detailsContainer.appendChild(itemName);

            // Create the details info container
            const detailsInfo = document.createElement('div');
            detailsInfo.classList.add('ta-item-details-info');
            detailsContainer.appendChild(detailsInfo);

            // Create the paragraph for item info
            const itemInfo = document.createElement('p');
            itemInfo.classList.add('ta-item-info');
            itemInfo.textContent = '브랜드명';
            detailsInfo.appendChild(itemInfo);

            // Append the article to the body or specific container

            shoppingListContainer.appendChild(article);
        })

        shoppingListContainer.style.display = "flex";
        document.querySelector(".shoppinglist-recommendation-main .loading-container").style.display = "none";

    }





</script>

<%@ include file="../common/foot.jspf"%>