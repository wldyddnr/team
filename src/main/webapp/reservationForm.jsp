<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.List"%>
<%@page import="room.Room"%>
<%@page import="room.RoomDao"%>
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
<body>
	<jsp:include page="nav.jsp" />
	<section style="padding: 60px">
		<%
		request.setCharacterEncoding("euc-kr");
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");

		if (startDate.equals("") || endDate.equals("")) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('날짜를 다시 입력해주세요');");
			script.println("history.back();");
			script.println("</script>");
			script.close();
			return;
		}
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date start1 = format.parse(startDate);
		Date end = format.parse(endDate);
		long sec = (end.getTime() - start1.getTime()) / 1000;
		long day = sec / (24 * 60 * 60);

		if (day < 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('날짜를 다시 입력해주세요');");
			script.println("history.back();");
			script.println("</script>");
			script.close();
			return;
		}

		RoomDao roomDao = new RoomDao();
		List<Room> roomList = roomDao.selectAllRoom();
		%>
		<div style="text-align: center;">
			<h1>객실 선택</h1>
		</div>
		<br>
		<div align="center">
			<%=startDate%>
			~
			<%=endDate%>
			<%=day%>박<%=day + 1%>일
		</div>
		<br>
		<%
		for (Room r : roomList) {
		%>
		<div align="center">
			<img src="image/<%=r.getType()%>.jpg" class="img-fluid" alt="...">
		</div>
		<br>
		<form action="reservation.jsp" method="post">
			<br> <input type="hidden" name="ridx" id="ridx"
				value="<%=r.getRidx()%>"> <input type="hidden"
				name="startDate" id="startDate" value="<%=startDate%>"> <input
				type="hidden" name="endDate" id="endDate" value="<%=endDate%>">
			<input type="hidden" name="type" id="type" value="<%=r.getType()%>">
			<input type="hidden" name="oPrice" id="oPrice"
				value="<%=r.getPrice() * day%>">
			<div align="right">
				<%=r.getType()%>
			</div>
			<div align="right">
				1박당 금액:
				<%=r.getPrice()%>
			</div>
			<div align="right">
				총 금액:
				<%=r.getPrice() * day%>
			</div>
			<div class="d-grid gap-2">
				<button type="submit" class="btn btn-success btn-lg">예약하기</button>
			</div>
		</form>
		<hr>
		<%
		}
		%>

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