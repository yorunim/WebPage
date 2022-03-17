<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>   
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" 
 integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" 
 crossorigin="anonymous">
<!--  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
-->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<title>캐러셀</title>
<style>
/*브라우저별 다른 값을 통일 */
html, body {
	height : 100%;
	margin : 0;	
	padding : 0;
}
#demo {
	margin-top : 0px;
}
/* 캐러셀의 이미지가 충분히  RWD되도록 설정*/
.carousel-inner img{
	width : 100%;
	height : 400px; /*캐러셀 이미지의 원본 크기 */
}
</style>
</head>
<body>

<!-- carousel //div콘테이너로 사용하고 carousel slide클래스를 사용 
	 data-ride과 data-interval은 반복 주기// 주 콘테이너로 캐러셀 마크와 캐러셀 항목들을 수용하는 내부 콘테이너를 가짐-->
<div id="demo" class="carousel slide" data-ride="carousel" data-interval="6000">
	<ul class="carousel-indicators"> <!-- 사진 위치 표시 -->
	<!-- data-target 마크가 표시될 콘테이너// data-slide-to 사진 번호// class="active" 활성화 -->
		<li data-target="#demo" data-slide-to="0" class="active"/>
		<li data-target="#demo" data-slide-to="1"/>
		<li data-target="#demo" data-slide-to="2"/>
	</ul>
	<div class="carousel-inner"> <!-- 각각의 캐러셀 항목을 수용하는 콘테이너 -->
		<div class="carousel-item active"> <!-- 항목 -->
			<img src="images/la.jpg" alt="LosAngeles" width="1100" height"500"/>
			<div class="carousel-caption"> <!-- 사진 설명 -->
				<h3>Los Angeles</h3>
				<p>We had such a great time in LA!</p>
			</div>
 		</div>
		
		<div class="carousel-item active"> <!-- 항목 -->
			<img src="images/chicago.jpg" alt="LosAngeles" width="1100" height"500"/>
			<div class="carousel-caption"> <!-- 사진 설명 -->
				<h3>Chicago</h3>
				<p>Thank you, Chicago!</p>
			</div>
 		</div>
		
		<div class="carousel-item active"> <!-- 항목 -->
			<img src="images/ny.jpg" alt="LosAngeles" width="1100" height"500"/>
			<div class="carousel-caption"> <!-- 사진 설명 -->
				<h3>New York</h3>
				<p>We had such a great time in LA!</p>
			</div>
 		</div>
	</div>
	<!-- 캐러셀 이동 버튼 -->
	<a class="carousel-control-prev" href="#demo" data-slide="prev">
		<span class="carousel-control-prev-icon"></span>
	</a>
	<a class="carousel-control-next" href="#demo" data-slide="next">
		<span class="carousel-control-next-icon"></span>
	</a>
</div>

</body>
</html>