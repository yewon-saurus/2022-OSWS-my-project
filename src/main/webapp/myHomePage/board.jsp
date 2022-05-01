<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="board.Board" %>
<%@ page import="board.BoardDAO" %>
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
			    String userID = null;
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
		    	userID = (String) session.getAttribute("userID");
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
        <article>
            <table class="boardTable">
                <thead>
                    <th>제목</th><th>작성시간</th>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            <a href="#">[공지]학습 일기 작성 시 유의사항</a>
                        </td>
                        <td>2021-08-16</td>
                    </tr>
                    <tr>
                        <td>
                            <a href="#">가정법 과거완료</a>
                        </td>
                        <td>2021-08-16</td>
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