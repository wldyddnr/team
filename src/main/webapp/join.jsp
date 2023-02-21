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
	script.println("alert('회원 가입에 성공했습니다.');");
	script.println("location.href = 'loginForm.jsp';");
	script.println("</script>");
	script.close();
	return;
}

if (result == -1) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('이미 가입된 아이디 입니다.');");
	script.println("history.back();");
	script.println("</script>");
	script.close();
	return;
}
%>