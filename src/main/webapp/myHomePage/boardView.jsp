<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="board.Board" %>
<%@ page import="board.BoardDAO" %>
<%@ page import="comment.Comment" %>
<%@ page import="comment.CommentDAO" %>
<%!String userID = null; %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" type="text/css" href="./css/style.css">
        <title>확인해요</title>
    </head>
    <header>
        <div class="logo"><a href='index.jsp'><img src="./img/pig.png"></a></div>
        <div class="to_login_join">
        	    <%
			    if (session.getAttribute("userID") != null) {
			    	userID = (String) session.getAttribute("userID");
			    	%>
			    	<p><%=userID %> 님</p>
			    	<a href='logout.jsp'>LOGOUT</a>&nbsp;&nbsp;&nbsp;
			    	<%
			    }
			    else {
			    	%>
			    	<p>게스트</p>
			    	<a href='login.html'>LOGIN</a>&nbsp;&nbsp;&nbsp;
			    	<a href='join.html'>JOIN</a>
			    	<%
			    }
			    %>
        </div>
    </header>
    <nav>
        <ul>
       	    <%
		    if (session.getAttribute("userID") != null) {
		    	%>
            <li><a href='schedule.jsp' class="floatLeft hoverPinkBack">SCHEDULE</a></li>
            <li><a href='board.jsp' class="floatLeft hoverPinkBack">BOARD</a></li>
            <li><a href='https://tomato-timer.com/' class="hoverPinkBack" target="_blank">🍅POMODORO🔗</a></li>
		    	<%
		    }
		    else {
		    	%>
            <li><a href='schedule.jsp' class="floatLeft hoverPinkBack">SCHEDULE</a></li>
            <li><a href='https://tomato-timer.com/' class="hoverPinkBack" target="_blank">🍅POMODORO🔗</a></li>
		    	<%
		    }
		    %>
        </ul>
    </nav>
    <nav>
        <aside>
            <div class="nav-btn">
                <a href="#"><img src='./img/up.png' width='50'></a>
            </div>
        </aside>
    </nav>
    <hr>
    <body>
        <div>
            <h1>VIEW</h1>
            <p>확인해요</p>
        </div>
		<%
		int boardID = Integer.parseInt(request.getParameter("boardID"));
		BoardDAO boardDAO = new BoardDAO();
		Board board = boardDAO.getBoard(boardID);
		%>
        <article> <!-- 게시글 열람 -->
			<table class="table">
				<thead>
					<tr>
						<th colspan="3">게시판 글보기</th>						
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 20%;">제목</td>
						<td><%= board.getBoardTitle() %></td>
					</tr>
					<tr>
						<td>작성자</td>
						<td><%= board.getUserID() %></td>
					</tr>
					<tr>
						<td>작성일자</td>
						<td><%= board.getBoardDate() %>
					</tr>
					<tr>
						<td>내용</td>
						<td colspan="2" style="width: 100%; text-align: left;"><%= board.getBoardContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">","&gt;").replaceAll("\n", "<br>") %>
					</tr>
				</tbody>
			</table>
        </article>
        <article> <!-- 댓글 작성 -->
        	<div>
				<form method="post" encType="multipart/form-data" action="commentAction.jsp?&boardID=<%=boardID%>">
					<table class="table">
						<tr>
							<td><%= userID %></td>
							<td><input type="text" placeholder="댓글을 남겨보세요" style="width: 100%" name="commentText"></td>
							<td><button class="btn-shape white-font" style="width: 100%; border: none;"" type="submit">작성</button></td>
						</tr>
					</table>
				</form>
        	</div>
        </article>
        <article> <!-- 댓글 목록 -->
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<tbody>
					<tr>
						<td align="left" bgcolor="beige">댓글</td>
					</tr>
					<tr>
					<%
						CommentDAO commentDAO = new CommentDAO();
						ArrayList<Comment> list = commentDAO.getList(boardID);
						for(int i=0; i<list.size(); i++){
					%>
							<div class="container">		//댓글하나당 container만들어서 보여줌
								<div class="row">
									<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
										<tbody>
											<tr>						
												<td align="left"><%= list.get(i).getUserID() %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= list.get(i).getCommentDate().substring(0,11) + list.get(i).getCommentDate().substring(11,13) + "시" + list.get(i).getCommentDate().substring(14,16) + "분" %></td>		
												<td colspan="2"></td>
												<td align="right">
													<%
													if(list.get(i).getUserID() != null && list.get(i).getUserID().equals(userID)){   //댓글 쓴사람과 지금 유저가 같을 때 수정과 삭제를 가능하게 함
													%>
														<form name = "p_search">
															<a type="button" onclick="nwindow(<%=boardID%>,<%=bbsID %>,<%=list.get(i).getCommentID()%>)" class="btn-primary">수정</a>
														</form>	
															<a onclick="return confirm('정말로 삭제하시겠습니까?')" href = "commentDeleteAction.jsp?commentID=<%= list.get(i).getCommentID() %>" class="btn-primary">삭제</a>																	
													<%
													}
													%>	
												</td>
											</tr>
											<tr>
												<td colspan="5" align="left"><%= list.get(i).getCommentText() %>
												<% 	
													String commentReal = "C:\\Users\\j8171\\Desktop\\studyhard\\JSP\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\BBS\\commentUpload";
													File commentFile = new File(commentReal+"\\"+bbsID+"사진"+list.get(i).getCommentID()+".jpg");
													if(commentFile.exists()){           //해당 댓글에 대응되는 사진이 있을 경우 사진도 보여준다.
												%>	
												<br><br><img src = "commentUpload/<%=bbsID%>사진<%=list.get(i).getCommentID() %>.jpg" border="300px" width="300px" height="300px"><br><br></td>
												<%} %>	
											</tr>
										</tbody>
									</table>			
								</div>
							</div>
							<%
								}
							%>
					</tr>
			</table>
        </article>
    </body>
    <hr>
    <footer>
        <div>
            Copyright&nbsp;&copy;&nbsp;2022&nbsp;YewonKim
        </div>
    </footer>
</html>