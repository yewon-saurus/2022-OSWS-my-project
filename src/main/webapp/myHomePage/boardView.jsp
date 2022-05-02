<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="board.Board" %>
<%@ page import="board.BoardDAO" %>
<%@ page import="comment.Comment" %>
<%@ page import="comment.CommentDAO" %>
<%@ page import="java.util.ArrayList" %>
<%!String userID = null; %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" type="text/css" href="./css/style.css">
        <title>확인해요</title>
    </head>
    <header>
        <div class="logo">
        	<a href='index.jsp'>
	      		<svg id="logo_pig" lang="ko" xmlns="http://www.w3.org/1999/xhtml">
				    <image
				        xlink:href="./img/pig.png"
				        x="0"
				        y="0"
				        width="100%"
				        height="100%"/>
					<image
				        xlink:href="./img/computer_light.png"
				        x="0"
				        y="0"
				        width="100%"
				        height="100%"/>
				</svg>
        	</a>
        </div>
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
            <li><a href='schedule.jsp' class="floatLeft hoverPinkBack">SCHEDULE</a></li>
            <li><a href='board.jsp' class="floatLeft hoverPinkBack">BOARD</a></li>
            <li><a href='https://tomato-timer.com/' class="hoverPinkBack" target="_blank">🍅POMODORO🔗</a></li>
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
			<form method="post" encType = "multipart/form-data" action="commentAction.jsp?&boardID=<%=boardID%>">
				<table class="table">
					<tr>
						<td><%= userID %></td>
						<td><input type="text" placeholder="댓글을 남겨보세요!" name="commentText" style="width: 100%" required></td>
						<td><button class="btn-shape white-font" style="width: 100%; border: none;" type="submit">작성</button></td>
					</tr>
				</table>
			</form>
        </article>
		<article> <!-- 댓글 목록 -->
			<table class="table">
				<tbody>
					<tr>
						<td align="left" bgcolor="beige">댓글 목록</td>
					</tr>
					<tr>
						<%
						CommentDAO commentDAO = new CommentDAO();
						ArrayList<Comment> list = commentDAO.getList();
						for(int i=0; i<list.size(); i++){
						%>
						<table class="table">
							<tbody>
								<tr>						
									<td align="left"><%= list.get(i).getUserID() %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%= list.get(i).getCommentDate().substring(0,11) + list.get(i).getCommentDate().substring(11,13) + "시" + list.get(i).getCommentDate().substring(14,16) + "분" %></td>
								</tr>
								<tr>
									<td colspan="5" align="left"><%= list.get(i).getCommentText() %></td>
								<%} %>	
								</tr>
							</tbody>
						</table>
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