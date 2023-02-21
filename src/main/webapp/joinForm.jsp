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
<script type="text/javascript">
	function check() {
		if (join.id.value.length < 1) {
			alert("���̵� �Է��ϼ���.");
			join.id.focus();
			return false;
		}
		if (join.name.value.length < 1) {
			alert("�̸��� �Է��ϼ���.");
			join.name.focus();
			return false;
		}
		if (join.password.value.length < 1) {
			alert("��й�ȣ�� �Է��ϼ���.");
			join.password.focus();
			return false;
		}

		if (join.passwordConfirm.value.length < 1) {
			alert("��й�ȣ�� �Է��ϼ���.");
			join.passwordConfirm.focus();
			return false;
		}

		if (!(join.passwordConfirm.value.length == join.password.value.length)) {
			alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
			join.passwordConfirm.focus();
			return false;
		}
		join.submit();

	}
</script>
</head>

<body>
	<jsp:include page="nav.jsp" />
	<section style="padding: 60px">
		<form action="join.jsp" method="post" name="join"
			onsubmit="return check()">
			<div style="text-align: center;">
				<h1>ȸ������</h1>
			</div>
			<br>
			<div class="form-floating mb-3">
				<input type="text" class="form-control" id="id" name="id"
					placeholder="id"> <label
					for="floatingPassword">���̵�</label>
			</div>
			<div class="form-floating mb-3">
				<input type="text" class="form-control" id="name" name="name"
					placeholder="name"> <label for="floatingPassword">�̸�</label>
			</div>
			<div class="form-floating mb-3">
				<input type="password" class="form-control" id="password"
					name="password" placeholder="password"> <label
					for="floatingPassword">��й�ȣ</label>
			</div>
			<div class="form-floating mb-3">
				<input type="password" class="form-control" id="passwordConfirm"
					placeholder="passwordConfirm" name="passwordConfirm"> <label
					for="floatingPassword">��й�ȣ Ȯ��</label>
			</div>

			<div class="d-grid gap-2">
				<button type="submit" class="btn btn-success btn-lg">ȸ������</button>
			</div>
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