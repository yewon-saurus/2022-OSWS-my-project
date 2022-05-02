<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="comment.CommentDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="comment" class="comment.Comment" scope="page" />
<jsp:setProperty name="comment" property="commentContent" />

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
<title>commentAction</title>
</head>
<body>
	<%
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	int boardID = 0;
	if (request.getParameter("boardID") != null){
		boardID = Integer.parseInt(request.getParameter("boardID"));
	}
	String realFolder="";
	String saveFolder = "commentUpload";
	String encType = "utf-8";
	int maxSize=5*1024*1024;
	
	ServletContext context = this.getServletContext();
	realFolder = context.getRealPath(saveFolder);
	
	MultipartRequest multi = null;
	
	multi = new MultipartRequest(request,realFolder,maxSize,encType,new DefaultFileRenamePolicy());		
	String fileName = multi.getFilesystemName("fileName");
	String commentText = multi.getParameter("commentText");
	comment.setCommentText(commentText);
	
 	if(userID == null){
 		PrintWriter script = response.getWriter();
 		script.println("<script>");
		script.println("alert('�α����� ���ּ���.')");
 		script.println("location.href = 'login.jsp'");
 		script.println("</script>");
 	} 
 	else{
	 	int bbsID = 0; 
	 	if (request.getParameter("bbsID") != null){
	 		bbsID = Integer.parseInt(request.getParameter("bbsID"));
	 	}
	 	
	 	if (bbsID == 0){
	 		PrintWriter script = response.getWriter();
	 		script.println("<script>");
	 		script.println("alert('��ȿ���� ���� ���Դϴ�.')");
	 		script.println("location.href = 'login.jsp'");
	 		script.println("</script>");
	 	}
 		if (comment.getCommentText() == null){
	 		PrintWriter script = response.getWriter();
	 		script.println("<script>");
	 		script.println("alert('�Է��� �ȵ� ������ �ֽ��ϴ�.')");
	 		script.println("history.back()");
	 		script.println("</script>");
	 	} else {
	 		CommentDAO commentDAO = new CommentDAO();
	 		int commentID = commentDAO.write(boardID, bbsID, userID, comment.getCommentText());
	 		if (commentID == -1){
		 		PrintWriter script = response.getWriter();
		 		script.println("<script>");
		 		script.println("alert('��� ���⿡ �����߽��ϴ�.')");
		 		script.println("history.back()");
		 		script.println("</script>");
		 	}
	 		else{
		 		PrintWriter script = response.getWriter();
		 		if(fileName != null){
					File oldFile = new File(realFolder+"\\"+fileName);
					File newFile = new File(realFolder+"\\"+bbsID+"����"+(commentID-1)+".jpg");
					oldFile.renameTo(newFile);
				}
		 		script.println("<script>");
		 		script.println("location.href=document.referrer;");
		 		script.println("</script>");
		 	}
	 	}
	 }
	%>
</body>
</html>