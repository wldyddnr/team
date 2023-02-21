<%@page import="java.io.PrintWriter"%>
<%@page import="order.OrderDao"%>
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
	int oidx = Integer.parseInt(request.getParameter("oidx"));
	System.out.println(oidx);
	OrderDao oDao = new OrderDao();

	int result = oDao.deleteOrder(oidx);

	if (result < 0) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("다시 시도해주세요.");
		script.println("history.back();");
		script.println("</script>");
		script.close();
		return;
	}
	if (result == 1) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('예약 취소되었습니다..');");
		script.println("location.href = 'memberInfoForm.jsp';");
		script.println("</script>");
		script.close();
		return;
	}
	%>
</body>
</html>