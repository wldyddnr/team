<%@page import="room.Room"%>
<%@page import="room.RoomDao"%>
<%@page import="java.util.List"%>
<%@page import="order.Order"%>
<%@page import="order.OrderDao"%>
<%@page import="member.Member"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<title>Insert title here</title>
<script type="text/javascript">
	function check() {

		if (memberInfoForm.password.value.length < 1) {
			alert("�����Ͻ÷��� ��й�ȣ�� �Է��ϼ���.");
			memberInfoForm.password.focus();
			return false;
		}
		memberInfoForm.submit();

	}
</script>
</head>
<body>
	<jsp:include page="nav.jsp" />
	<%
	Member member = (Member) session.getAttribute("member");
	OrderDao oDao = new OrderDao();
	RoomDao rDao = new RoomDao();
	Room room = new Room();
	List<Order> orders = oDao.selectOrder(member.getId());
	%>
	<section style="padding: 60px">
		<div>
			<h1>ȸ�� ����</h1>
		</div>
		<br>
		<form action="memberInfoUpdate.jsp" name="memberInfoForm"
			onsubmit="return check()" method="post">
			<div class="mb-3">
				<label for="exampleFormControlInput1" class="form-label">���̵�</label>
				<input type="text" class="form-control" name="id"
					value="<%=member.getId()%>" readonly>
			</div>
			<div class="mb-3">
				<label for="exampleFormControlInput1" class="form-label">�̸�</label>
				<input type="text" class="form-control" name="name"
					value="<%=member.getName()%>">
			</div>
			<div class="mb-3">
				<label for="exampleFormControlInput1" class="form-label">��й�ȣ</label>
				<input type="password" class="form-control" name="password"
					placeholder="�����Ϸ��� ���� ��й�ȣ�� �Է����ּ���.">
			</div>
			<input type="submit" value="����" class="btn btn-success">
		</form>
		<br>
		<div>
			<h1>���� ����</h1>
		</div>
		<br>
		<form action="deleteReservation.jsp" method="post">
			<table class="table">
				<thead>
					<tr>
						<th scope="col">�����ȣ</th>
						<th scope="col">���೯¥</th>
						<th scope="col">Ÿ��</th>
						<th scope="col">�ѱݾ�</th>
					</tr>
				</thead>
				<tbody>
					<%
					for (Order o : orders) {
						room = rDao.selectRoom(o.getRidx());
					%>
					<input type="hidden" name="oidx" id="oidx" value="<%=o.getOidx()%>">
					<tr>
						<th scope="row"><%=o.getOidx()%></th>
						<td><%=o.getStartDate()%>~<%=o.getEndDate()%></td>
						<td><%=room.getType()%></td>
						<td><%=o.getoPrice()%></td>
						<td><button class="btn btn-success" type="submit">�������</button></td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
		</form>

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