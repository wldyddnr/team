<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
</head>
<%
request.setCharacterEncoding("euc-kr");
String id = request.getParameter("id");
if (id == null) {
	id = "";
}
%>
<body>
	<jsp:include page="nav.jsp" />
	<section style="padding: 60px">
		<form action="login.jsp" method="post">
			<div style="text-align: center;">
				<h1>로그인</h1>
			</div>
			<br>
			<div class="form-floating mb-3">
				<input type="text" class="form-control" id="id" name="id"
					placeholder="id" value="<%=id%>"> <label
					for="floatingPassword">아이디</label>
			</div>
			<div class="form-floating mb-3">
				<input type="password" class="form-control" id="password"
					placeholder="password" name="password"> <label
					for="floatingPassword">비밀번호</label>
			</div>
			<div class="d-grid gap-2">
				<button type="submit" class="btn btn-success btn-lg">로그인</button>
			</div>
		</form>
		<div
			style="width: 50%; text-align: center; float: left; padding: 30px; font-size: 15px; text-decoration-line: none;">
			<a href="findIdForm.jsp">아이디/비밀번호 찾기</a>
		</div>
		<div
			style="width: 50%; text-align: center; float: right; padding: 30px; font-size: 15px; text-decoration-line: none;">
			<a href="joinForm.jsp">회원가입</a>
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