<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" type="text/css" href="./css/style.css">
        <title>SCHDULE</title>
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
            <li><a href='schedule.html' class="floatLeft hoverPinkBack">SCHEDULE</a></li>
            <li><a href='board.html' class="floatLeft hoverPinkBack">BOARD</a></li>
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
    <main>
        <article>
            <section>
                <h1>SCHEDULE</h1>
                <p>저의 일정이에요.</p>
            </section>
        </article>
        <article>
            <table class="schedule-table">
                <thead>
                    <tr>
                        <th scope="col"></th>
                        <th scope="col">MON</th>
                        <th scope="col">TUE</th>
                        <th scope="col">WED</th>
                        <th scope="col">THU</th>
                        <th scope="col">FRI</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>9</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>10</td>
                        <td rowspan="2">오픈소스<br>웹소프트웨어</td>
                        <td rowspan="2">객체지향<br>설계</td>
                        <td rowspan="2">컴파일러</td>
                        <td>컴퓨터<br>네트워크</td>
                        <td rowspan="2">운영체제</td>
                    </tr>
                    <tr>
                        <td>11</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>12</td>
                        <td colspan="5">🍱 식사 하세요 🍖</td>
                    </tr>
                    <tr>
                        <td>1</td>
                        <td></td>
                        <td></td>
                        <td rowspan="4">오픈소스<br>전문프로젝트</td>
                        <td rowspan="2">창업기획</td>
                        <td rowspan="2">오픈소스<br>웹소프트웨어</td>
                    </tr>
                    <tr>
                        <td>2</td>
                        <td></td>
                        <td>운영체제</td>
                    </tr>
                    <tr>
                        <td>3</td>
                        <td></td>
                        <td rowspan="2">컴퓨터<br>네트워크</td>
                        <td rowspan="2">컴파일러</td>
                    </tr>
                    <tr>
                        <td>4</td>
                        <td rowspan="2">객체지향<br>설계</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>5</td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                </tbody>
                <tfoot>
                    
                </tfoot>
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