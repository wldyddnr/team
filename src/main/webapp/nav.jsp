<%@page import="member.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<nav class="navbar navbar-expand-lg bg-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="home.jsp">HOTEL</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup"
				aria-controls="navbarNavAltMarkup" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
				<div class="navbar-nav">
					<a class="nav-link" href="home.jsp">HOME</a>
					<%
					Member member = (Member) session.getAttribute("member");
					if (session.getAttribute("member") == null) {
					%>
					<a class="nav-link" href="loginForm.jsp">�α���</a> <a
						class="nav-link" href="joinForm.jsp">ȸ������</a>
					<%
					} else {
					%>
					<a class="nav-link" href="memberInfoForm.jsp"><%=member.getName()%></a>
					<a class="nav-link" href="logout.jsp">�α׾ƿ�</a> <a class="nav-link"
						href="selectDate.jsp">�����ϱ�</a>
					<%
					}
					%>

				</div>
			</div>
		</div>
	</nav>
</body>
</html>