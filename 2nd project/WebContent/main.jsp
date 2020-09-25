<%@page import="java.util.Random"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.DAO.MovieDAO"%>
<%@page import="com.DTO.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE HTML>
<!--
	Broadcast by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
<head>
<title>Broadcast by TEMPLATED</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<noscript>
	<link rel="stylesheet" href="assets/css/noscript.css" />
</noscript>
</head>
<body class="is-preload">
	<%
		MemberDTO info = (MemberDTO) session.getAttribute("info");
	%>
	<!-- Header -->
	<header id="header" class="alt">
		<h1>
			<a href="main.jsp">pop <span>('corn')</span></a>
		</h1>
		<%
			if (info == null) {
		%>
		<a href="#menu2">로그인</a> <a href="#menu3">회원가입</a>
		<%
			} else {
		%>
		<a href="LogoutService.do">로그아웃</a>
		<%
			}
		%>
		<a href="#menu">Menu</a>
	</header>

	<!-- Nav -->
	<nav id="menu">
		<ul class="links">
		
		<%
		if(info == null){%>
			
			<li><a href="#menu2">로그인을 해주세요</a></li>
		
		<%}else{
			
			if(info.getId().equals("admin")){ %>
			<li><a href="main.jsp">메인</a></li>
			<li><a href="admin.jsp">관리자 모드</a></li>
			
			
		<%}else{%>
			<li><a href="main.jsp">메인</a></li>
			<li><a href="myPage.jsp">회원정보 수정</a></li>
			<li><a href="Taste.jsp">취향 입력하기</a></li>
			<%}
			}%>
			
		</ul>
	</nav>
	<nav id="menu2">
		<ul class="links">
			<li><h5>로그인</h5></li>
			<form action="LoginService.do" method="post">
				<li><input style="background-color: white;" name="id" type="text" placeholder="ID를 입력해주세요"></li>
				<li><input name="pw" type="password" placeholder="PW을 입력해주세요"></li>
				<li><input type="submit" value="LogIn" class="button fit"></li>
			</form>
		</ul>
	</nav>

	<nav id="menu3">
		<div class="inner">
			<div class="inner">
				<ul class="actions vertical" style="width: 40.5em;">
					<li><h5>회원가입</h5></li>
					<ul>
						<form action="JoinService.do" method="post" autocomplete="off">
							<li><input name="id" type="text" placeholder="ID를 입력해주세요"></li>
							<li><input name="pw" type="password"
								placeholder="PW을 입력해주세요"></li>
							<li><input name="nick" type="text"
								placeholder="NICK을 입력해주세요"></li> <br>
							<h5>좋아하는 장르</h5>
							<table>
								<tr>
								<% 
									String[] genreList = {"액션","SF","코미디","사극","뮤지컬","가족","스릴러","모험","전쟁","미스터리"
											,"범죄","판타지","멜로/로맨스","공포","다큐멘터리","드라마","애니메이션","어드벤처"};
									
									for(int i = 0; i < genreList.length; i++){%>
										
									<input id="cb<%=i+1%>" name="genre" type="checkbox" value="<%=genreList[i]%>">
									<label for="cb<%=i+1%>"><%=genreList[i]%></label>
									<%}%>
									<li><input type="submit" value="JoinUs" class="button fit"></li>
								</tr>
							</table>

						</form>
					</ul>
				</ul>
			</div>
	</nav>
	<!-- Banner -->
	<!--
				비디오를 배경으로 사용하려면 데이터 비디오를 비디오 이름으로 설정하십시오.
				확장(예: 영상/영상). 동영상은 .mp4 및 .webm으로 제공되어야 함
				올바르게 작동하는 형식.
			-->
	<section id="banner"
		style="background-image: url(images/Download1.jpg);">
		<div class="inner">
			<header>
				<h1>영화를 추천 받으세요!</h1>
				<p>
					자신의 취향을 입력하고 영화를 추천 받아보세요<br/>
					현재 상영 영화와 예고편을 확인하세요
				</p>
			</header>
			<a href="#wrapper2" class="button big alt scrolly">영화 추천 목록</a> <a
				href="point.jsp" class="button big alt scrolly">취향 입력하기</a>
		</div>

	</section>

	<!-- Main -->
<section class="wrapper style1">
	<div id="wrapper2" class="inner, main">
			
			<!--2열 비디오 섹션-->
			<!-- Main -->
			
			<% 
			MovieDAO dao = new MovieDAO();
			ArrayList<String> list = dao.movieNmAll("screen");
			ArrayList<String> list1 = dao.movieNmAll("movie");
			
			if (info != null){ %>
			<header class="align-center">
				<h2 class="h2_1">추천영화</h2>
				<p></p>
			</header>
			<section id="main0">
				<!-- Items -->
				<div class="items">
					<%				
				

						Random rd = new Random();
					int c = rd.nextInt(400);
					%>
					<%
						for (int i = 0; i < list.size(); i++) {
					%>
					<article class="item thumb span-1"
						style="width: 280px; height: 400px;">
						<h2 class="h2"><%=list1.get(c)%></h2>
						<a href="img/<%=list1.get(c)%>.jpg" class="image2"><img
							class="img" src="img/<%=list1.get(c)%>.jpg" alt=""></a>
					</article>
					<%
						c = rd.nextInt(400);
					/* if (c < list.size()) {
						c++;
					} */
					}
					%>

				</div>
			</section>
			<%} %>
	</div>
	<!-- One -->
	<hr>
	<!-- Wrapper -->
	
	<div id="wrapper" class="inner, main">
		<!-- One -->
		<!-- Wrapper -->
			<header class="align-center">
				<h2 class="h2_1">현재 상영작</h2>
				<p></p>
			</header>
			<!--2열 비디오 섹션-->
			<!-- Main -->
			<section id="main2">
				<!-- Items -->
				<div class="items">
					<%
					
					%>
					<h1 style="text-align: center"></h1>

					<%
						int a = 0;
					for (int i = 0; i < list.size(); i++) {
					%>
					<article class="item thumb span-1"
						style="width: 280px; height: 400px;">
						<h2 class="h2"><%=list.get(a)%>
						<input type="button" class="my-button<%=i%>" value="예고편"
					style="font-size: 12px; width: 70px; height:30px; float: right; text-align:center;">
				<div class="element_to_pop_up<%=i%>">
					<a class="b-close">X</a>
					<iframe width="1280" height="720"
						<%if(list.get(i).contains("다만 악에서 구하소서")){ %>
						src="https://www.youtube.com/embed/7oKAPbnl7mQ"
						<%}else if(list.get(i).contains("오! 문희")){ %>
						src="https://www.youtube.com/embed/tecLzQwIoMI?list=TLPQMjIwOTIwMjC8TZu7qX40Tg"
						<%}else if(list.get(i).contains("기기괴괴")){ %>
						src="https://www.youtube.com/embed/DNb9QP5kilE?list=TLPQMjIwOTIwMjC8TZu7qX40Tg"
						<%}else if(list.get(i).contains("결백")){ %>
						src="https://www.youtube.com/embed/5QWeKTO9NpY?list=TLPQMjIwOTIwMjC8TZu7qX40Tg"
						<%}else if(list.get(i).contains("남매의 여름밤")){ %>
						src="https://www.youtube.com/embed/J20a-ws8wE0?list=TLPQMjIwOTIwMjC8TZu7qX40Tg"
						<%}else if(list.get(i).contains("오케이 마담")){ %>
						src="https://www.youtube.com/embed/Cpzns_3BWII?list=TLPQMjIwOTIwMjC8TZu7qX40Tg"
						<%}else if(list.get(i).contains("카일라스 가는 길")){ %>
						src="https://www.youtube.com/embed/29H83sX99Bc?list=TLPQMjIwOTIwMjC8TZu7qX40Tg"
						<%}else if(list.get(i).contains("후쿠오카")){ %>
						src="https://www.youtube.com/embed/HpDPuNVG1no?list=TLPQMjIwOTIwMjC8TZu7qX40Tg"
						<%}else if(list.get(i).contains("나를 구하지 마세요")){ %>
						src="https://www.youtube.com/embed/1zvoSWKKkhQ?list=TLPQMjIwOTIwMjC8TZu7qX40Tg"
						<%}else if(list.get(i).contains("메피스토")){ %>
						src="https://www.youtube.com/embed/qXQMgjyQpIc?list=TLPQMjIwOTIwMjC8TZu7qX40Tg"
						<%}%> frameborder="0"
						allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
						allowfullscreen></iframe>
				</div>
						</h2>
						<a href="img/<%=list.get(i)%>.jpg" class="image2"> <img
							class="img" src="img/<%=list.get(a)%>.jpg" alt="">
						</a>
					</article>
					<%
						if (a < list.size()) {
						a++;
					}
					}
					%>
				</div>
			</section>
	</div>
	
	<hr>
	<div id="wrapper1" class="inner, main">
			<header class="align-center">
				<h2 class="h2_1">개봉 예정작</h2>
				<p></p>
			</header>
			<!--2열 비디오 섹션-->
			<!-- Main -->
			<section id="main1">
				<!-- Items -->
				<div class="items">
					<%
						int b = 0;
					%>
					<%
						for (int i = list.size(); i < 21; i++) {
					%>
					<article class="item thumb span-1"
						style="width: 280px; height: 400px;">
						<h2 class="h2"><%=list1.get(b)%>
						<input type="button" class="my-button<%=i%>" value="예고편"
					style="font-size: 12px; width: 70px; height:30px; float: right; text-align:center;">
				<div class="element_to_pop_up<%=i%>">
					<a class="b-close">X</a>
					<iframe width="1280" height="720"
						<%if(list1.get(b).contains("임금님의 사건수첩")){ %>
						src="https://www.youtube.com/embed/w_8oPI6Vexc"
						<%}else if(list1.get(b).contains("특별시민")){ %>
						src="https://www.youtube.com/embed/7pkMGdUradQ"
						<%}else if(list1.get(b).contains("아빠는 딸")){ %>
						src="https://www.youtube.com/embed/0AyJ3rY0x3A"
						<%}else if(list1.get(b).contains("시간위의 집")){ %>
						src="https://www.youtube.com/embed/wmhP8fAUJng"
						<%}else if(list1.get(b).contains("어느날")){ %>
						src="https://www.youtube.com/embed/J20a-ws8wE0?list=TLPQMjIwOTIwMjC8TZu7qX40Tg"
						<%}else if(list1.get(b).contains("원라인")){ %>
						src="https://www.youtube.com/embed/Cpzns_3BWII?list=TLPQMjIwOTIwMjC8TZu7qX40Tg"
						<%}else if(list1.get(b).contains("보통사람")){ %>
						src="https://www.youtube.com/embed/29H83sX99Bc?list=TLPQMjIwOTIwMjC8TZu7qX40Tg"
						<%}else if(list1.get(b).contains("비정규직 특수요원")){ %>
						src="https://www.youtube.com/embed/HpDPuNVG1no?list=TLPQMjIwOTIwMjC8TZu7qX40Tg"
						<%}else if(list1.get(b).contains("루시드 드림")){ %>
						src="https://www.youtube.com/embed/1zvoSWKKkhQ?list=TLPQMjIwOTIwMjC8TZu7qX40Tg"
						<%}else if(list1.get(b).contains("해빙")){ %>
						src="https://www.youtube.com/embed/1zvoSWKKkhQ?list=TLPQMjIwOTIwMjC8TZu7qX40Tg"
						<%}else if(list1.get(b).contains("레이디버그")){ %>
						src="https://www.youtube.com/embed/qXQMgjyQpIc?list=TLPQMjIwOTIwMjC8TZu7qX40Tg"
						<%}%>frameborder="0"
						allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
						allowfullscreen></iframe>
				</div>
						
						
						</h2>
						<a href="img/<%=list1.get(b)%>.jpg" class="image2"><img
							class="img" src="img/<%=list1.get(b)%>.jpg" alt=""></a>
							
					</article>
					<%
						if (b < list1.size()) {
						b++;
					}
					}
					%>

				</div>
			</section>
	</div>


</section>

	<!-- Footer -->
	<footer id="footer">
		<div class="inner">
			<div class="flex flex-3">
				<div class="col">
					<h3>팀장</h3>
					<ul class="alt">
						<li><a href="#">전영욱</a></li>
						<li><a href="#"></a></li>
					</ul>
				</div>
				<div class="col">
					<h3>조원</h3>
					<ul class="alt">
						<li><a href="#">국경아</a></li>
						<li><a href="#">박재호</a></li>
						
					</ul>
				</div>
				<div class="col">
					<h1></h1>
					<br>
					<ul class="alt">
						<li><a href="#">조문형</a></li>
						<li><a href="#"></a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="copyright">
			<ul class="icons">
				<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
				<li><a href="#" class="icon fa-facebook"><span
						class="label">Facebook</span></a></li>
				<li><a href="#" class="icon fa-instagram"><span
						class="label">Instagram</span></a></li>
				<li><a href="#" class="icon fa-snapchat"><span
						class="label">Snapchat</span></a></li>
			</ul>
			&copy; Untitled. Design: <a href="https://templated.co">TEMPLATED</a>.
			Images: <a href="https://unsplash.com">Coverr</a>. Video: <a
				href="https://coverr.co">Coverr</a>.
		</div>
	</footer>
<a href="#" title="Back to Top" style="display:scroll;position:fixed;bottom:30px;right:10px; z-index: 10003;" onfocus='this.blur()'>
<img src="img/top.png" style="width:100px; height:100px; border-radius: 15px;"/></a>

	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.poptrox.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/skel.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/scroll3.js"></script>
	<script src="assets/js/scroll2.js"></script>
	<script src="assets/js/scroll.js"></script>
	<script src="assets/js/main.js"></script>
	<script src="js/jquery-1.11.3.min.js"></script>
	<script src="assets/js/jquery.bpopup-0.10.0.min.js"></script>
	<script src="assets/js/frame.js"></script>
	
</body>
</html>