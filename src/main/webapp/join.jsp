<%@page import="member.MemberDao"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%
request.setCharacterEncoding("euc-kr");
String id = request.getParameter("id");
String name = request.getParameter("name");
String password = request.getParameter("password");

MemberDao dao = new MemberDao();
int result = dao.insertMember(id, name, password);

if (result == 1) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('ȸ�� ���Կ� �����߽��ϴ�.');");
	script.println("location.href = 'loginForm.jsp';");
	script.println("</script>");
	script.close();
	return;
}

if (result == -1) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('�̹� ���Ե� ���̵� �Դϴ�.');");
	script.println("history.back();");
	script.println("</script>");
	script.close();
	return;
}
%>