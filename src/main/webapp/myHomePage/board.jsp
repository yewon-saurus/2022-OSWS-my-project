<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="board.Board" %>
<%@ page import="board.BoardDAO" %>
<%!String userID = null; %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" type="text/css" href="./css/style.css">
        <title>기록해요</title>
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
            <h1>BOARD</h1>
            <p>기록해요</p>
        </div>
        <article>
			<table class="table">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<%
					BoardDAO boardDAO = new BoardDAO();
					ArrayList<Board> list = boardDAO.getList();
					for (int i = 0; i < list.size(); i++) {
					%>
					<tr>
						<td><%= list.get(i).getBoardID() %></td>
						<td><%= list.get(i).getBoardTitle() %></td>
						<td><%= list.get(i).getUserID() %></td>
						<td><%= list.get(i).getBoardDate().substring(0, 11) + list.get(i).getBoardDate().substring(11, 13) + "시 " + list.get(i).getBoardDate().substring(14, 16) + "분 " %></td>
						<td> <a href="boardView.jsp?boardID=<%= list.get(i).getBoardID() %>">글보기</a></td>
					</tr>
					<%		
					}
					%>
				</tbody>
			</table>
			<br>
			<a href="write.jsp">✍ 글쓰기</a>
        </article>
    </body>
    <hr>
    <footer>
        <div>
            Copyright&nbsp;&copy;&nbsp;2022&nbsp;YewonKim
        </div>
    </footer>
</html>