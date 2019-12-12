<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initian-scale=1">
	<title>Insert title here</title>
</head>
<body>
	<c:set var="m" value="${MONEY_DTO}" />
	<p>시/도:${m.city}
	<p>시/군/구:${m.district}
	<p>내국인/외국인 여부: ${m.foreigner}
	<p>가구주/가구원 여부: ${m.gagu}
	<p>주택 보유 여부: ${m.house}
	<p>(주택 보유 선택시) 주거 유형 여부: ${m.house_a}
	<br/>
	<br/>
	<br/>
	<p><a href="#">지원금 링크1</a>
	<p><a href="#">지원금 링크2</a>
	<p><a href="#">지원금 링크3</a>
	<p><a href="#">서비스 링크4</a>
	<p><a href="#">서비스 링크5</a>
</body>
</html>