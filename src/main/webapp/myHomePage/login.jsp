<%@page import="org.apache.tomcat.jni.User"%>
<%@page import="java.io.*" %>

<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>

<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>환영해요</title>
	</head>
	<body>
		<%
		UserDAO userDAO = new UserDAO();
		String ID = request.getParameter("userID");
		String password = request.getParameter("userPassword");
		int result = userDAO.login(ID, password);
		
		if (result == 1) { // 로그인 성공
			response.sendRedirect("index.jsp");
			session.setAttribute("userID", ID);
		}
		else if (result == 0) { // 로그인 실패
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('Please check the *password* again.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else if(result == -1){ // 가입된 아이디 없음
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('Please check the *ID* again.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else if(result == -2){ // DB 오류
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('Please check the DB server.')");
			script.println("history.back()");
			script.println("</script>");
		}
		%>
	</body>
</html>