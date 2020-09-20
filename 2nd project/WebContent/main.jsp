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
<body class="is-preload ">
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
			<li><a href="main.jsp">Home</a></li>
			<li><a href="myPage.jsp">My Page</a></li>
			<li><a href="generic.jsp">Generic</a></li>
			<li><a href="elements.jsp">Elements</a></li>
		</ul>
	</nav>
	<nav id="menu2">
		<ul class="links">
			<li><h5>로그인</h5></li>
			<form action="LoginService.do" method="post">
				<li><input name="id" type="text" placeholder="ID를 입력해주세요"></li>
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
									<input id="cb1" name="genre" type="checkbox" value="액션">
									<label for="cb1">액션</label>
									<input id="cb2" name="genre" type="checkbox" value="SF">
									<label for="cb2">SF</label>
									<input id="cb3" name="genre" type="checkbox" value="코미디">
									<label for="cb3">코미디</label>
									<input id="cb4" name="genre" type="checkbox" value="사극">
									<label for="cb4">사극</label>
									<input id="cb5" name="genre" type="checkbox" value="뮤지컬">
									<label for="cb5">뮤지컬</label>
									<input id="cb6" name="genre" type="checkbox" value="가족">
									<label for="cb6">가족</label>
									<input id="cb7" name="genre" type="checkbox" value="스릴러">
									<label for="cb7">스릴러</label>
									<input id="cb8" name="genre" type="checkbox" value="모험">
									<label for="cb8">모험</label>
									<input id="cb9" name="genre" type="checkbox" value="전쟁">
									<label for="cb9">전쟁</label>
									<input id="cb10" name="genre" type="checkbox" value="미스터리">
									<label for="cb10">미스터리</label>
									<input id="cb11" name="genre" type="checkbox" value="범죄">
									<label for="cb11">범죄</label>
									<input id="cb12" name="genre" type="checkbox" value="판타지">
									<label for="cb12">판타지</label>
									<input id="cb13" name="genre" type="checkbox" value="멜로/로맨스">
									<label for="cb13">멜로/로맨스</label>
									<input id="cb14" name="genre" type="checkbox" value="공포">
									<label for="cb14">공포</label>
									<input id="cb15" name="genre" type="checkbox" value="다큐멘터리">
									<label for="cb15">다큐멘터리</label>
									<input id="cb16" name="genre" type="checkbox" value="드라마">
									<label for="cb16">드라마</label>
									<input id="cb17" name="genre" type="checkbox" value="애니메이션">
									<label for="cb17">애니메이션</label>
									<input id="cb18" name="genre" type="checkbox" value="어드벤처">
									<label for="cb18">어드벤처</label>
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
	<section id="banner" style="background-image: url(images/다운로드1.jpg);">
		<div class="inner">
			<header>
				<h1>영화를 추천 받으세요!</h1>
				<p>
					자신의 취향을 입력하고<br /> 나와 맞는 영화를 찾으세요.
				</p>
			</header>
			<a href="#wrapper" class="button big alt scrolly">영화 목록 보기</a> <a
				href="point.jsp" class="button big alt scrolly">취향 입력하기</a>
		</div>

	</section>

	<!-- Main -->
	<div id="wrapper" class="inner, main">
		<!-- One -->
		<!-- Wrapper -->
		<section class="wrapper style1">
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
						MovieDAO dao = new MovieDAO();
					ArrayList<String> list = dao.movieNmAll("screen");
					%>
					<h1 style="text-align: center"></h1>

					<%
						int a = 0;
					for (int i = 0; i < list.size(); i++) {
					%>
					<article class="item thumb span-1"
						style="width: 280px; height: 400px;">
						<h2 class="h2"><%=list.get(a)%></h2>
						<a href="img/<%=list.get(a)%>.jpg" class="image2"> <img
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


				<!-- One -->
				<!-- Wrapper -->

				<br>

				<header class="align-center">
					<h2 class="h2_1">개봉 예정작</h2>
					<p></p>
				</header>
				<!--2열 비디오 섹션-->
				<!-- Main -->
				<!-- Items -->
				<div class="items">
					<%
						int b = 0;
					ArrayList<String> list1 = dao.movieNmAll("movie");
					%>
					<%
						for (int i = 0; i < list1.size(); i++) {
					%>
					<article class="item thumb span-1"
						style="width: 280px; height: 400px;">
						<h2 class="h2"><%=list1.get(b)%></h2>
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

				<br>


				<header class="align-center">
					<h2 class="h2_1">추천영화</h2>
					<p></p>
				</header>
				<!--2열 비디오 섹션-->
				<!-- Main -->
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
		</section>
	</div>










	<!-- Footer -->
	<footer id="footer">
		<div class="inner">
			<div class="flex flex-3">
				<div class="col">
					<h3>Vestibullum</h3>
					<ul class="alt">
						<li><a href="#">Nascetur nunc varius commodo.</a></li>
						<li><a href="#">Vis id faucibus montes tempor</a></li>
						<li><a href="#">Massa amet lobortis vel.</a></li>
						<li><a href="#">Nascetur nunc varius commodo.</a></li>
					</ul>
				</div>
				<div class="col">
					<h3>Lobortis</h3>
					<ul class="alt">
						<li><a href="#">Nascetur nunc varius commodo.</a></li>
						<li><a href="#">Vis id faucibus montes tempor</a></li>
						<li><a href="#">Massa amet lobortis vel.</a></li>
						<li><a href="#">Nascetur nunc varius commodo.</a></li>
					</ul>
				</div>
				<div class="col">
					<h3>Accumsan</h3>
					<ul class="alt">
						<li><a href="#">Nascetur nunc varius commodo.</a></li>
						<li><a href="#">Vis id faucibus montes tempor</a></li>
						<li><a href="#">Massa amet lobortis vel.</a></li>
						<li><a href="#">Nascetur nunc varius commodo.</a></li>
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


	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.poptrox.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/skel.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/scroll.js"></script>
	<script src="assets/js/main.js"></script>

</body>
</html>