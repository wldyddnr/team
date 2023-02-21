<%@page import="java.io.PrintWriter"%>
<%@page import="member.MemberDao"%>
<%@page import="member.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
request.setCharacterEncoding("euc-kr");
String id = request.getParameter("id");
String name = request.getParameter("name");
String password = request.getParameter("password");

Member member = new Member(id, name, password);
Member sessionMember = (Member) session.getAttribute("member");
MemberDao dao = new MemberDao();

if (!sessionMember.getPassword().equals(password)) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('비밀번호를 확인해주세요');");
	script.println("history.back();");
	script.println("</script>");
	script.close();
	return;
}

int result = dao.updateMember(member);

if (result == 1) {
	session.setAttribute("member", member);
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('회원정보가 수정 되었습니다.');");
	script.println("location.href = 'memberInfoForm.jsp';");
	script.println("</script>");
	script.close();
	return;
} else if (result == -1) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('수정 실패하였습니다. 입력 정보를 확인해주세요');");
	script.println("history.back();");
	script.println("</script>");
	script.close();
	return;
}
%>