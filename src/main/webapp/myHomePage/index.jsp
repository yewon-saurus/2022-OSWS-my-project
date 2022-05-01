<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" type="text/css" href="./css/style.css">
        <title>어서오세요</title>
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
    <body>
        <article>
            <h1>MAIN</h1>
            <p>어서오세요.</p>
        </article>
        <article>
            <section>
                <!-- 메인 배너 -->
                <div class='whoIsYewon'> <!--소개-->
                    <img src="./img/animal_chara_smartphone_buta.png" width="260" height="340">
                    <p>김 예원</p>
                    <p>Yewon Kim</p>
                    <p>소속: <a href="https://software.cbnu.ac.kr/" target="_blank">CBNU computer science 🔗</a></p>
                </div>
            </section>
        </article>
    </body>
    <hr>
    <footer>
        <div>
            Copyright&nbsp;&copy;&nbsp;2022&nbsp;YewonKim
        </div>
    </footer>
</html>