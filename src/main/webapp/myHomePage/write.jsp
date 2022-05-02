<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            <a href='login.html'>LOGIN</a>&nbsp;&nbsp;&nbsp;
            <a href='join.html'>JOIN</a>
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
            <h1>WRITE</h1>
            <p>기록해요</p>
        </div>
		<% 
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		%>
        <article>
            <form method="post" action="insertContent.jsp">
                <table>
					<thead>
						<tr>
							<th colspan="2">게시판 입력</th>						
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control" placeholder="제목(최대 50자)" name="boardTitle" maxlength="50" style="width: 100%" required></td>
						</tr>
						<tr>
							<td><textarea placeholder="내용을 입력하세요." name="boardContent" maxlength="2048" style="width: 100%; height: 350px" required></textarea></td>						
						</tr>
					</tbody>
                </table>
                <br>
                <button class="btn-shape white-font" type="submit" style="border: none;">작성</button>
            </form>
        </article>
    </body>
    <hr>
    <footer>
        <div>
            Copyright&nbsp;&copy;&nbsp;2022&nbsp;YewonKim
        </div>
    </footer>
</html>