<%@page import="member.MemberDao"%>
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
	<%
	request.setCharacterEncoding("euc-kr");

		String id = request.getParameter("id");
		String password = request.getParameter("password");
		Member member = new Member();
		MemberDao dao = new MemberDao();
		member = dao.selectMember(id);

		if (id.equals(member.getId()) && password.equals(member.getPassword())) {
			session.setAttribute("member", member);
			response.sendRedirect("loginSuccess.jsp");
		} else {
			response.sendRedirect("loginFail.jsp");
		}
	%>

	<script type="text/javascript">
		
	</script>
</body>
</html>