<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!String userID = null; %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" type="text/css" href="./css/style.css">
        <title>어서오세요</title>
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
            <h1>MAIN</h1>
            <p>어서오세요.</p>
        </div>
        <article>
            <section>
                <!-- 메인 배너 -->
                <div class='whoIsYewon'> <!--소개-->
                <div>
					<svg id="pig" style="width: 260px; height: 340;" lang="ko" xmlns="http://www.w3.org/1999/xhtml">
					    <image
					        xlink:href="./img/buta_tail.png"
					        x="0"
					        y="0"
					        width="260px"
					        height="340px"/>
					    <image
					        xlink:href="./img/pig_right_arm.png"
					        x="0"
					        y="-2px"
					        width="260px"
					        height="340px"/>
					    <image
					        xlink:href="./img/smartphone_pig1.png"
					        x="0"
					        y="0"
					        width="260px"
					        height="340px"/>
					    <circle
					    	cx="39%"
					    	cy="32%"
					    	r="5px"
					    	fill="#000"/>
					    <circle
					    	cx="60%"
					    	cy="32%"
					    	r="5px"
					    	fill="#000"/>
					</svg>
                </div>
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