<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
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
            <li><a href='board.html' class="floatLeft hoverPinkBack">BOARD</a></li>
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
    <main>
        <article>
            <h1>BOARD</h1>
            <p>기록해요</p>
        </article>
<%
int boardID = Integer.parseInt(request.getParameter("boardID"));
BoardDAO boardDAO = new BoardDAO();
Board board = boardDAO.getBoard(boardID);
%>
        <article>
            <table class="boardTable">
                <thead>
                    <th colspan="3">게시판 글보기</th>
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
						<td colspan="2" style="min-height: 200px; text-align: left;"><%= board.getBoardContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">","&gt;").replaceAll("\n", "<br>") %>
					</tr>
                </tbody>
            </table>
            <table class="boardWrite">
                <tr>
                    <td><a href="write.html">✍글쓰기</a></td>
                </tr>
            </table>
        </article>
    </main>
    <hr>
    <footer>
        <div>
            Copyright&nbsp;&copy;&nbsp;2022&nbsp;YewonKim
        </div>
    </footer>
</html>