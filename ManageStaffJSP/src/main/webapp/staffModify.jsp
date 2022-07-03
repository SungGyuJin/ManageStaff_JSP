<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="DBPKG.DBcon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
<%@ include file="../includes/footer.jsp" %>
<%
	String param = request.getParameter("empno");
	String sql = "Select * From emp_tbl_01 Where empno =" + param + "";
	Connection con = DBcon.getConnection();
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	rs.next();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>Low-Mart 직원조회/수정</h3>
	<br>
	<form action="staffModify" method="post">
	<table border="1">
		<tr>
			<td>직원번호(자율발생)</td>
			<td><input type="text" id="empno" name="empno" value="<%= rs.getString("empno") %>" readonly="readonly" /></td>
		</tr>
		<tr>
			<td>직원성명</td>
			<td><input type="text" id="empname" name="empname" value="<%= rs.getString("empname") %>" /></td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td><input type="text" id="phone" name="phone" value="<%= rs.getString("phone") %>" /></td>
		</tr>
		<tr>
			<td>주소</td>
			<td><input type="text" id="address" name="address" value="<%= rs.getString("address") %>" /></td>
		</tr>
		<tr>
			<td>입사일자</td>
			<td><input type="text" id="startdate" name="startdate" value="<%= rs.getDate("startdate") %>" /></td>
		</tr>
		<tr>
			<td>판매등급[A:BEST, B:GOOD, C:NORMAL]</td>
			<td><input type="text" id="grade" name="grade" value="<%= rs.getString("grade") %>" /></td>
		</tr>
		<tr>
			<td>근무지역</td>
			<td><input type="text" id="city" name="city" value="<%= rs.getString("city") %>" /></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="수정"	 onClick="return regChk()" />
				<input type="button" value="조회" onClick="location.href='staffList.jsp'"/>
			</td>
		</tr>
	</table>
	</form>
<script>
	
	var empname = document.querySelector("#empname");
	var phone = document.querySelector("#phone");
	var address = document.querySelector("#address");
	var startdate = document.querySelector("#startdate");
	var grade = document.querySelector("#grade");
	var city = document.querySelector("#city");
	
	function regChk(){
		
		if(empname.value == ""){
			alert("직원성명을 입력해주세요.");
			empname.focus();
			return false;
		}
		if(phone.value == ""){
			alert("전화번호를 입력해주세요.");
			phone.focus();
			return false;
		}
		if(address.value == ""){
			alert("주소를 입력해주세요.");
			address.focus();
			return false;
		}
		if(startdate.value == ""){
			alert("입사일자를 입력해주세요.");
			startdate.focus();
			return false;
		}
		if(grade.value == ""){
			alert("판매등급 입력해주세요.");
			grade.focus();
			return false;
		}
		if(city.value == ""){
			alert("근무지역을 입력해주세요.");
			city.focus();
			return false;
		}
		
		if(grade.value != "A" && grade.value != "B" && grade.value != "C"){
			
			alert("판매등급은 A, B, C 셋 중 하나만 입력해주세요.");
			grade.value = "";
			grade.focus();
			return false;
		}
		
		alert("수정완료.");
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
</script>
</body>
</html>