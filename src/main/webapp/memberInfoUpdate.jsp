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
	script.println("alert('��й�ȣ�� Ȯ�����ּ���');");
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
	script.println("alert('ȸ�������� ���� �Ǿ����ϴ�.');");
	script.println("location.href = 'memberInfoForm.jsp';");
	script.println("</script>");
	script.close();
	return;
} else if (result == -1) {
	PrintWriter script = response.getWriter();
	script.println("<script>");
	script.println("alert('���� �����Ͽ����ϴ�. �Է� ������ Ȯ�����ּ���');");
	script.println("history.back();");
	script.println("</script>");
	script.close();
	return;
}
%>