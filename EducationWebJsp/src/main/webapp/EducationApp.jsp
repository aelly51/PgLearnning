<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="pack.EducationDao"%>
<%@ page import="pack.EducationDto"%>

<%
EducationDao dao = new EducationDao();
EducationDto dto = new EducationDto();
List<EducationDto> allList = new ArrayList<>();
List<EducationDto> dataList = new ArrayList<>();
/* String update = request.getParameter("updateId");
out.print("aaa"+update); */
String delete = request.getParameter("deleteId");
out.print("aaa"+delete);
boolean isSuccess = dao.delect(delete);
String str = request.getParameter("list");
out.print(str);


if (str.equals("all")){
	allList = dao.selectAll();
}else if(str.equals("id")){
	dto = dao.selectOne("S000000111");
}else if(str.equals("districtName")){
	dataList = dao.selectData("DISTRICT_NAME", "동부");	
}else if(str.equals("officeName")){
	dataList = dao.selectData("OFFICE_NAME", "서울특별시");
}

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function delete_page(value) {
	dto.setDistrictId(value);
	boolean isSuccess = dao.delete(dto)
	
}
</script>
</head>
<body>
	<table border="1">
		<tr>
			<th>교육행정구역ID</th>
			<th>교육행정구역명</th>
			<th>교육행정구역분류</th>
			<th>시도교육청코드</th>
			<th>시도교육청명</th>
			<th>교육지원청코드</th>
			<th>교육지원청명</th>
			<th>수정</th>
			<th>삭제</th>
		</tr>
		<%
    for( EducationDto edu : allList ){
		%>
		<tr>
			<td><%= edu.getDistrictId() %></td>
			<td><%= edu.getDistrictName() %></td>
			<td><%= edu.getDistrictClassification() %></td>
			<td><%= edu.getOfficeCode() %></td>
			<td><%= edu.getOfficeName() %></td>
			<td><%= edu.getSupportCode() %></td>
			<td><%= edu.getSupportName() %></td>
			<td><a href ='EducationApp.jsp?updateId=<%=edu.getDistrictId() %>'> 수정 </a></td>
			<td><a href ='EducationApp.jsp?deleteId=<%=edu.getDistrictId() %>&list=all'> 삭제 </a></td>
		</tr>

		<% } %>
		<%
    for( EducationDto edudata : dataList ){
		%>
		<tr>
			<td><%= edudata.getDistrictId() %></td>
			<td><%= edudata.getDistrictName() %></td>
			<td><%= edudata.getDistrictClassification() %></td>
			<td><%= edudata.getOfficeCode() %></td>
			<td><%= edudata.getOfficeName() %></td>
			<td><%= edudata.getSupportCode() %></td>
			<td><%= edudata.getSupportName() %></td>
		</tr>
		<% } %>
		<%if(str.equals("id")){ %>
		<tr>
			<td><%= dto.getDistrictId() %></td>
			<td><%= dto.getDistrictName() %></td>
			<td><%= dto.getDistrictClassification() %></td>
			<td><%= dto.getOfficeCode() %></td>
			<td><%= dto.getOfficeName() %></td>
			<td><%= dto.getSupportCode() %></td>
			<td><%= dto.getSupportName() %></td>
		</tr>
		<%} %>
	</table>
</body>
</html>