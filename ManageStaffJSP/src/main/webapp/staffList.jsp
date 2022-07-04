<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="DBPKG.DBcon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
<%@ include file="../includes/footer.jsp" %>
<%
	String sql = "Select * From emp_tbl_01";
	Connection con = DBcon.getConnection();
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
td{
	width: 10%;
}
</style>
</head>
<body>
	<br>
	<h3>직원목록 조회/수정</h3>
	<br>
	<table style="text-align: center;">
		<thead>
			<tr>
				<th class="table-primary">직원번호</th>
				<th class="table-primary">직원성명</th>
				<th class="table-primary">전화번호</th>
				<th class="table-primary">주소</th>
				<th class="table-primary">입사일자</th>
				<th class="table-primary">판매등급</th>
				<th class="table-primary">근무지역</th>
			</tr>
		</thead>
		<tbody>
		
		<%
			while(rs.next()){
				
				String grade = rs.getString("grade");
				
				if(grade.equals("A")){
					grade = "BEST";
				}else if(grade.equals("B")){
					grade = "GOOD";
				}else{
					grade = "NORMAL";
				}
		%>
			<tr>
				<td><a href="staffModify.jsp?empno=<%= rs.getString("empno")%>"><%= rs.getString("empno") %></a></td>
				<td><%= rs.getString("empname") %></td>
				<td><%= rs.getString("phone") %></td>
				<td><%= rs.getString("address") %></td>
				<td><%= rs.getDate("startdate") %></td>
				<td><%= grade %></td>
				<td><%= rs.getString("city") %></td>
			</tr>
		<%
			}
		%>
		</tbody>
	</table>
</body>
</html>