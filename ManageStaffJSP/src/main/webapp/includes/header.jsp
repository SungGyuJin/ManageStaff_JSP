<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
*{
	margin: 0;
	padding: 0;
}
table{
	margin: auto;
}
h1, h2, h3{
	text-align: center;
}
header{
	background-color: pink;
}
#btn_modify{
	width: 100%;
}
#a_tag{
	font-style: italic;
	font-size: 20px;
}
h3{
	font-style: italic;
}
</style>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
<header>
	<h1>Manage Staff ver 2.0</h1>

	<nav class="table-primary" style="text-align: center;">
		<a href="staffReg.jsp" id="a_tag">직원등록</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="staffList.jsp" id="a_tag">직원목록조회/수정</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="index.jsp" id="a_tag">홈으로</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	</nav>
</header>
</body>
</html>