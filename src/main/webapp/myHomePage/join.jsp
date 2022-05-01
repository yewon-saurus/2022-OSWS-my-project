<%@page import="java.io.*" %>

<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>

<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userEmail" />
<jsp:setProperty name="user" property="userPassword" /> 

<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
		<title>반가워요</title>
	</head>
	<body>
		<%
		UserDAO userDAO = new UserDAO();
		int result = userDAO.join(user);				
		if(result == -1){ // 이미 가입된 email
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('This id is already subscribed.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else { // 가입 성공
			PrintWriter script = response.getWriter();			
			script.println("<script>");
			script.println("alert('You have successfully registered as a member.')");
			script.println("location.href = 'index.jsp'");
			script.println("</script>");
		}
		%>
	</body>
</html>