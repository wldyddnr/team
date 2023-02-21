<%@page import="java.io.PrintWriter"%>
<%@page import="member.Member"%>
<%@page import="member.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<%
request.setCharacterEncoding("euc-kr");
String id = request.getParameter("id");
String name = request.getParameter("name");
String password = "";
MemberDao memberDao = new MemberDao();
password = memberDao.selectPassword(id, name);

if (password.equals("")) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('입력정보와 일치하는 아이디가 없습니다.');");
	script.println("history.back();");
	script.println("</script>");
	script.close();
	return;
}
%>
<body>
	<jsp:include page="nav.jsp" />
	<section style="padding: 60px">
		<div align="center">입력하신 아이디의 비밀번호는</div>
		<div align="center">

			'<%=password%>' 입니다
		</div>
		<div
			style="width: 100%; text-align: center; float: left; padding: 30px; font-size: 15px; text-decoration-line: none;">
			<a href="loginForm.jsp">로그인</a>
		</div>
	</section>
</body>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
	integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"
	integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V"
	crossorigin="anonymous"></script>
</html>