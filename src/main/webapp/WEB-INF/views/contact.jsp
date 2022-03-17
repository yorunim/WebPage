<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>   
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix ="sec" uri = "http://www.springframework.org/security/tags" %>
<%@ page session="false" %>              
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<!--RWD first-->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>contact</title>
<style>
/* Optional: Makes the sample page fill the window. */
html, body {
  width : 100%;
  height: 100%;
  margin: 0;
  padding: 0;
}
#main {  
  height: auto;    
}

#google-map {
  width : 100%;
  height: 600px; 
  margin: 0;
  padding: 0;   
}

#search-panel {
	width :65%;
    position: relative;
    top: 60px;   
    z-index: 5;
    background-color: #FFFFFF;
    padding: 5px;    
    margin : auto;    
}

#address {
	padding : 10px;
}

h3 {
  color: white;
  text-shadow: 1px 1px 2px black, 0 0 25px blue, 0 0 5px darkblue;
}
</style>
</head>
<body>

<%@ include file="nav.jsp" %>
<%@ include file="carousel.jsp" %>

<div id = "main" class="container mt-5">
	<h3 class="text-center">Geocoding</h3>
	<div id="search-panel" >
   		<input id="address" type="text" placeholder="주소를 입력하세요" size="70px"/>
   		<button id="submit" type="button" class="btn btn-primary" value="Geocode">지도 검색</button>
	</div>	
	<div id="google-map" class="mx-auto mb-5">		
	</div>
	<div class="row">
		<div class="col-4 d-flex flex-column">
			<div class="d-flex flex-row">
				<div>
					<i class="fa fa-home" aria-hidden="true"></i>										
				</div>
				<div>
					<h5>Binghamton, New York</h5>
					<p>
						4343 Hinkle Deegan Lake Road
					</p>						
				</div>	
			</div>
			<div class="d-flex flex-row">
				<div>
					<i class="fa fa-headphones" aria-hidden="true"></i>					
				</div>
				<div>
					<h5>00 (958) 9865 562</h5>
					<p>Mon to Fri 9am to 6 pm</p>												
				</div>
			</div>
			<div class="d-flex flex-row">
				<div>
					<i class="fa fa-envelope" aria-hidden="true"></i>
				</div>
				<div>
					<h5>support@colorlib.com</h5>
					<p>Send us your query anytime!</p>						
				</div>
			</div>
		</div> <!-- flex-column -->
		<div class="col-8">
			<form class="text-right" id="myForm" action="" method="post">
				<div class="row">
					<div class="col-6 form-group">
						<input name="name" placeholder="Enter your name" onfocus="this.placeholder = ''" 
							onblur="this.placeholder = 'Enter your name'" class="mb-20 form-control" type="text">
						<input name="email" placeholder="Enter email address" pattern="[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{1,63}$"
							 onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter email address'" class="mb-20 form-control"
							 type="email">
						<input name="subject" placeholder="Enter subject" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter subject'"
							 class="mb-20 form-control" type="text">							
					</div>
					<div class="col-6 form-group">
						<textarea class="form-control" name="message" placeholder="Enter Messege" onfocus="this.placeholder = ''"
							 onblur="this.placeholder = 'Enter Messege'" rows="5"></textarea>							
					</div>
					<div class="col-12">
						<div style="text-align: left;"></div>
						<button class="btn btn-primary" style="float: right;">Send Message</button>														
					</div>
				</div>	
			</form> 
		</div>			
	</div>	
</div>

<%@ include file="footer.jsp" %>

<script>
/**
 * Google Map API 주소의 callback 파라미터와 동일한 이름의 함수이다.
 * Google Map API에서 콜백으로 실행시킨다.
 */
function initMap() {
	  console.log('Map is initialized.');
	  
	  /**
       * 맵을 설정한다.
       * 1번째 파라미터 : 구글 맵을 표시할 위치. 여기서는 #google-map
       * 2번째 파라미터 : 맵 옵션.
       *      ㄴ zoom : 맵 확대 정도
       *      ㄴ center : 맵 중심 좌표 설정
       *              ㄴ lat : 위도 (latitude)
       *              ㄴ lng : 경도 (longitude)
       */
       /*
       var map = new google.maps.Map(document.getElementById('google-map'),{
    	   zoom: 12.5,
    	   center: {
               lat: 37.587,
               lng: 126.976
           }
       } );
       */
       var map;
       getLocation();
       function getLocation() {
    		if (navigator.geolocation) {
    			navigator.geolocation.watchPosition(showPosition);
    			//watchPosition(showPosition)은 이동시 사용자의 위치를 계속하여 업데이트 하며 반환
    			//getCurrentPosition(showPosition)는 이용자의 위치반환
    			//리턴값은 파라메터인 showPosition()함수에 좌표를 반환해 준다
    			//clearWatch()는 중단
    		}
    		else {
    			map = $("#google-map");
    			map.text("Geolocation is not supported by this browser.");
    		}
    	} 
       
       function showPosition(position) { //position객체는 사용자의 위치 정보 객체
    		lati = position.coords.latitude; //위도		
    		longi = position.coords.longitude;	//경도
    		
    		
    		 map = new google.maps.Map(document.getElementById('google-map'), {
    		      zoom: 16,
    		      center: new google.maps.LatLng(lati,longi)
    		 });
    		 
    		 var marker = new google.maps.Marker({
    		      position: new google.maps.LatLng(lati,longi) ,
    		      map: map,
    		      title: 'Hello World!'
    		 });
    	}
       
       /**
        * Google Geocoding. Google Map API에 포함되어 있다.
        */
        
       var geocoder = new google.maps.Geocoder();
       
    // submit 버튼 클릭 이벤트 실행
       document.getElementById('submit').addEventListener('click', function() {
           console.log('submit 버튼 클릭 이벤트 실행');

           // 여기서 실행
           geocodeAddress(geocoder, map);
       });
    	
       /**
        * geocodeAddress
        * 
        * 입력한 주소로 맵의 좌표를 바꾼다.
        */
        
        function geocodeAddress(geocoder, resultMap) {
            console.log('geocodeAddress 함수 실행');

            // 주소 설정
            var address = document.getElementById('address').value;

            /**
             * 입력받은 주소로 좌표에 맵 마커를 찍는다.
             * 1번째 파라미터 : 주소 등 여러가지. 
             *      ㄴ 참고 : https://developers.google.com/maps/documentation/javascript/geocoding#GeocodingRequests
             * 
             * 2번째 파라미터의 함수
             *      ㄴ result : 결과값
             *      ㄴ status : 상태. OK가 나오면 정상.
             */
            geocoder.geocode({'address': address}, function(result, status) {
                console.log(result);
                console.log(status);

                if (status === 'OK') {
                    // 맵의 중심 좌표를 설정한다.
                    resultMap.setCenter(result[0].geometry.location);
                    // 맵의 확대 정도를 설정한다.
                    resultMap.setZoom(18);
                    // 맵 마커
                    var marker = new google.maps.Marker({
                        map: resultMap,
                        position: result[0].geometry.location
                    });

                    // 위도
                    console.log('위도(latitude) : ' + marker.position.lat());
                    // 경도
                    console.log('경도(longitude) : ' + marker.position.lng());
                } else {
                    alert('지오코드가 다음의 이유로 성공하지 못했습니다 : ' + status);
                }
            });
        }
}
</script>

<script async defer
 src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCl3troictldoLX7-RsH7NiFiGVzUWGgv8&callback=initMap&v=weekly&channel=2" >
</script> 
</body>
</html>