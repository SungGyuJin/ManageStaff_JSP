<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="DBPKG.DBcon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../includes/header.jsp" %>
<%@ include file="../includes/footer.jsp" %>
<%
	String sql = "Select * From emp_tbl_01 order by empno asc";
	Connection con = DBcon.getConnection();
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery(sql);
%>
<!DOCTYPE html>\
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
td{
	width: 10%;
	font-size: large;
}
#btn_del{
	width: 100%;
}
#delChk{
	margin-top: 5px;
	width: 25px;
	height: 25px;
}

#modal {
	display: none;
	position: relative;
	width: 100%;
	height: 100%;
	z-index: 1;
	
}

#modal h2 {
	margin: 0;
}

#modal button {
	display: inline-block;
	background: #D3D3D3;
	width: 100px;
	background: #white;
	font-weight: bold;
	border-radius: 20px;
	margin-left: 37%;
	margin-top: 10px;
}

#modal .modal_content {
	width: 400px;
	margin: 75px auto;
	padding: 10px 10px;
	background: white;
	border: 2px solid #666;
	border-radius: 10px;
	position: fixed;
  	top: 0%;
  	left: 50%;
  	transform: translate(-50%, -50%);
}

#modal .modal_layer {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.5);
	z-index: -1;
}
#listFm{
	width: 80%;
	height: 50%;
}

</style>
</head>
<body>
	<br>
	<h3>직원목록 조회/수정</h3>
	<br>
		<table id="listFm" style="text-align: center;">
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
				String staffNum = request.getParameter("staffNum");
				String functionNum = request.getParameter("functionNum");
				
				/* if(staffNum == null){
					out.print("비었음");
				}else{
					out.print(staffNum);					
				} */
				
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
					<td><h5><a href="staffModify.jsp?empno=<%= rs.getString("empno")%>"><%= rs.getString("empno") %></a></h5></td>
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
	
	<div id="modal">
		<input type="hidden" value="<%= staffNum %>" id="paramStaff" readonly="readonly">
		
			<div class="modal_content">
				
				<%
					if(functionNum != null){
						if(functionNum.equals("1")){
				%>
							<h3 style="font-style: italic;">등록완료</h3>
							<h3 style="font-size: 20px;"><%= staffNum %>번의 직원정보가 등록되었습니다.</h3>
				<%
						}else if(functionNum.equals("2")){
				%>
							<h3 style="font-style: italic;">수정완료</h3>
							<h3 style="font-size: 20px;"><%= staffNum %>번의 직원정보가 수정되었습니다.</h3>
				<%
						}else if(functionNum.equals("3")){
				%>
							<h3 style="font-style: italic;">삭제완료</h3>
							<h3 style="font-size: 20px;"><%= staffNum %>번의 직원정보가 삭제되었습니다.</h3>
				<%
						}
					}
				
				%>
								
				<button id="modal_close_btn">확인</button>
				
			</div>
			
			<div class="modal_layer"></div>
	</div>
	
	
	
<script>

	/* 체크여부  */
	/* var staffChk = false;
	var chkBox = document.getElementsByName("delChk");
	
	function delBtn(){
		for(var i = 0; i < chkBox.length; i++){
			
			if(chkBox[i].checked == true){
				staffChk = true;
				alert("삭제완료.");
				break;
			}
		}
		
		if(!staffChk){
			alert("삭제할 직원리스트를 선택해주세요.");
			return false;
		}
		
	} */
	var type = "1";
	var paramStaff = document.querySelector("#paramStaff");
	
	if(paramStaff.value != "null"){
		
		document.getElementById("modal").style.display = "block";
	}
		
		
	document.getElementById("modal_close_btn").onclick = function() {
		document.getElementById("modal").style.display = "none";
		location.href = "staffList.jsp";
	}
			








</script>
</body>
</html>