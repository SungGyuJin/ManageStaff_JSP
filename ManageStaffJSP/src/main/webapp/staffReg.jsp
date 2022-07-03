<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="DBPKG.DBcon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
<%@ include file="../includes/footer.jsp" %>
<%
	String sql = "Select Max(empno)+1 empno From emp_tbl_01";
	Connection con = DBcon.getConnection();
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
	rs.next();
	
	String empno = rs.getString("empno");
	
	if(empno == null){
		empno = "100001";
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>Low-Mart 직원 등록</h3>
	<br>
	<form action="staffReg" method="post">
	<table border="1">
		<tr>
			<td>직원번호(자율발생)</td>
			<td><input type="text" id="empno" name="empno" value="<%= empno %>" readonly="readonly" /></td>
		</tr>
		<tr>
			<td>직원성명</td>
			<td><input type="text" id="empname" name="empname" /></td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td><input type="text" id="phone" name="phone" /></td>
		</tr>
		<tr>
			<td>주소</td>
			<td><input type="text" id="address" name="address" /></td>
		</tr>
		<tr>
			<td>입사일자</td>
			<td><input type="text" id="startdate" name="startdate" /></td>
		</tr>
		<tr>
			<td>판매등급[A:BEST, B:GOOD, C:NORMAL]</td>
			<td><input type="text" id="grade" name="grade" /></td>
		</tr>
		<tr>
			<td>근무지역</td>
			<td><input type="text" id="city" name="city" /></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="등록"	 onClick="return regChk()" />
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
		
		alert("등록완료.")
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
</script>
</body>
</html>