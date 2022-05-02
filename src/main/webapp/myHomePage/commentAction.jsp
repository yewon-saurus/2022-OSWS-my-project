<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="comment.CommentDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="comment" class="comment.Comment" scope="page" />
<jsp:setProperty name="comment" property="commentText" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>commentAction</title>
</head>
<body>
	 <%
	 	String userID = null;
	 	if(session.getAttribute("userID") != null){
	 		userID = (String) session.getAttribute("userID");
	 	}
	 	int boardID = 0;
		if (request.getParameter("boardID") != null){
			boardID = Integer.parseInt(request.getParameter("boardID"));
		}
		
	 	if(userID == null){
	 		PrintWriter script = response.getWriter();
	 		script.println("<script>");
			script.println("alert('로그인을 해주세요.')");
	 		script.println("location.href = 'login.html'");
	 		script.println("</script>");
	 	} 
	 	else{
	 		CommentDAO commentDAO = new CommentDAO();
	 		int commentID = commentDAO.write(boardID, userID, comment.getCommentText());
	 		if (commentID == -1){
		 		PrintWriter script = response.getWriter();
		 		script.println("<script>");
		 		script.println("alert('댓글 쓰기에 실패했습니다.')");
		 		script.println("history.back()");
		 		script.println("</script>");
		 	}
	 		else{
		 		PrintWriter script = response.getWriter();

		 		script.println("<script>");
		 		script.println("location.href='board.jsp'");
		 		script.println("</script>");
		 	}
		 }
	 %>
</body>
</html>