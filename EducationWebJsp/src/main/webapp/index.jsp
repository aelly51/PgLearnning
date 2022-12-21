<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@ page import="pack.EducationDao"%>
<%@ page import="pack.EducationDto"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전국교육행정구역표준데이터</title>
</head>
<body>
	<%
//EducationDao dao = new EducationDao();
//EducationDto dto = new EducationDto();
//String id = "S000000001";
//dto = dao.selectOne(id);
//out.print("llll:"+dto.getOfficeName());


%>
	<form action="/EducationApp.jsp">
		<label for="list">자료검색:</label> 
		<select id="list" name="list">
			<option value="all">전체</option>
			<option value="id">아이디</option>
			<option value="districtName">교육행정구역명</option>
			<option value="officeName">시도교육청명</option>
		</select> <input type="submit" value="검색">
	</form>



</body>
</html>