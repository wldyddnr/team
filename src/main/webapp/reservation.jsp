<%@page import="order.Order"%>
<%@page import="order.OrderDao"%>
<%@page import="member.Member"%>
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
<body>
	<jsp:include page="nav.jsp" />
	<%
	request.setCharacterEncoding("euc-kr");
	String startDate = request.getParameter("startDate");
	String endDate = request.getParameter("endDate");
	int ridx = Integer.parseInt(request.getParameter("ridx"));
	String type = request.getParameter("type");
	int oPrice = Integer.parseInt(request.getParameter("oPrice"));
	Member member = (Member) session.getAttribute("member");

	OrderDao oDao = new OrderDao();
	int result = oDao.insertOrder(member.getId(), startDate, endDate, ridx, oPrice);
	%>
	<section style="padding: 60px">
		<div align="center">
			<h1>예약 되었습니다.</h1>
		</div>
		<br>
		<div align="center">
			<a href="memberInfoForm.jsp">예약확인</a>
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