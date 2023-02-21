<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	function check() {
		if (findPassword.id.value.length < 1) {
			alert("���̵� �Է��ϼ���.");
			findPassword.id.focus();
			return false;
		}
		if (findPassword.name.value.length < 1) {
			alert("�̸��� �Է��ϼ���.");
			findPassword.password.focus();
			return false;
		}

		findPassword.submit();

	}
</script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
</head>
<body>
	<jsp:include page="nav.jsp" />
	<section style="padding: 60px">
		<form action="findPassword.jsp" method="post" name="findPassword">
			<div style="text-align: center;">
				<h1>��й�ȣ ã��</h1>
			</div>
			<br>
			<div class="form-floating mb-3">
				<input type="text" class="form-control" id="id" placeholder="id"
					name="id"> <label for="floatingInput">���̵�</label>
			</div>
			<div class="form-floating mb-3">
				<input type="text" class="form-control" id="name" name="name"
					placeholder="name"> <label for="floatingPassword">�̸�</label>
			</div>
			<div class="d-grid gap-2">
				<button type="submit" class="btn btn-success btn-lg">��й�ȣ
					ã��</button>
			</div>
		</form>
		<div
			style="width: 50%; text-align: center; float: left; padding: 30px; font-size: 15px; text-decoration-line: none;">
			<a href="findIdForm.jsp">���̵� ã��</a>
		</div>
		<div
			style="width: 50%; text-align: center; float: left; padding: 30px; font-size: 15px; text-decoration-line: none;">
			<a href="loginForm.jsp">�α���</a>
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