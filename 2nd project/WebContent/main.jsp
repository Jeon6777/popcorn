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
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
	</head>
	<body class="is-preload ">
	<% MemberDTO info =  (MemberDTO)session.getAttribute("info"); 
	%>
		<!-- Header -->
			<header id="header" class="alt">
				<h1><a href="main.jsp">pop <span>('corn')</span></a></h1>
				<%	if(info == null){%>
					<a href="#menu2">로그인</a>
				<% }else{ %>
					<a href="LogoutService.do">로그아웃</a>	
				<% } %>
				<a href="#menu">Menu</a>
			</header>

		<!-- Nav -->
			<nav id="menu">
				<ul class="links">
					<li><a href="main.jsp">Home</a></li>
					<li><a href="generic.jsp">Generic</a></li>
					<li><a href="elements.jsp">Elements</a></li>
				</ul>
			</nav>
			<nav id="menu2">	
				<ul class="links">
					<li><h5>로그인</h5></li>
						<form action="LoginService.do" method="post">
							<li><input name="id" type="text"  placeholder="ID를 입력해주세요"></li>
							<li><input name="pw" type="password"  placeholder="PW을 입력해주세요"></li>
							<li><input type="submit" value="LogIn" class="button fit"></li>
						</form>
				</ul>
				<ul class="actions vertical">
					<li><h5>회원가입</h5></li>
						<form action="JoinService.do" method="post">
							<li><input name="id" type="text"  placeholder="ID를 입력해주세요"></li>
							<li><input name="pw" type="password"  placeholder="PW을 입력해주세요"></li>
							<li><input name="nick" type="text"  placeholder="NICK을 입력해주세요"></li>
							<li><input name="genre" type="text"  placeholder="장르1개만 입력해주세요(예시 :액션)"></li>
							<li><input type="submit" value="JoinUs" class="button fit"></li>
						</form>
				</ul>
			</nav>
			<!-- Banner -->
			<!--
				비디오를 배경으로 사용하려면 데이터 비디오를 비디오 이름으로 설정하십시오.
				확장(예: 영상/영상). 동영상은 .mp4 및 .webm으로 제공되어야 함
				올바르게 작동하는 형식.
			-->
				<section id="banner" data-video="images/banner">
					<div class="inner">
						<header>
							<h1>This is Broadcast</h1>
							<p>Morbi eu purus eget urna interdum dignissim sed consectetur augue<br />
							vivamus vitae libero in nulla iaculis eleifend non sit amet nulla.</p>
						</header>
						<a href="#wrapper" class="button big alt scrolly">Dignissim</a>
					</div>

				</section>

	<!-- Main -->
	<div id="wrapper" class="inner, main" >
		
	

			<!-- One -->
			<!-- Wrapper -->
					<section class="wrapper style1">
							<header class="align-center">
								<h2 class="h2_1">Nam eu nisi non ante sodale</h2>
								<p>Cras sagittis turpis sit amet est tempus, sit amet consectetur purus tincidunt.</p>
							</header>
				

							<!--2열 비디오 섹션-->
							<!-- Main -->
							<section id="main2">

									<!-- Items -->
								<div class="items">
									<div class="item intro span-2">
										<h1>Parallelism</h1>
										<p>A responsive portfolio site<br />
										template by HTML5 UP</p>
									</div>


									<article class="item thumb span-1">
										<h2 class="h2">You really got me</h2>
										<a href="images/fulls/01.jpg" class="image2"><img class="img" src="images/thumbs/01.jpg" alt=""></a>
									</article>

									<article class="item thumb span-2">
										<h2 class="h2">Ad Infinitum</h2>
										<a href="images/fulls/02.jpg" class="image2"><img class="img" src="images/thumbs/02.jpg" alt=""></a>
									</article>

									<article class="item thumb span-1">
										<h2 class="h2">Different.</h2>
										<a href="images/fulls/03.jpg" class="image2"><img class="img" src="images/thumbs/03.jpg" alt=""></a>
									</article>

									<article class="item thumb span-1">
										<h2 class="h2">Elysium</h2>
										<a href="images/fulls/04.jpg" class="image2"><img class="img" src="images/thumbs/04.jpg" alt=""></a>
									</article>

									<article class="item thumb span-3">
										<h2 class="h2">Kingdom of the Wind</h2>
										<a href="images/fulls/05.jpg" class="image2"><img class="img" src="images/thumbs/05.jpg" alt=""></a>
									</article>

									<article class="item thumb span-1">
										<h2 class="h2">The Pursuit</h2>
										<a href="images/fulls/06.jpg" class="image2"><img class="img" src="images/thumbs/06.jpg" alt=""></a>
									</article>

									<article class="item thumb span-2">
										<h2 class="h2">Boundless</h2>
										<a href="images/fulls/07.jpg" class="image2"><img class="img" src="images/thumbs/07.jpg" alt=""></a>
									</article>

									<article class="item thumb span-2">
										<h2 class="h2">The Spectators</h2>
										<a href="images/fulls/08.jpg" class="image2"><img class="img" src="images/thumbs/08.jpg" alt=""></a>
									</article>

								</div>

									<!-- Items -->
									<div class="items">

										<article class="item thumb span-3"><h2 class="h2">Kingdom of the Wind</h2><a href="images/fulls/05.jpg" class="image2"><img class="img" src="images/thumbs/05.jpg" alt=""></a></article>
										<article class="item thumb span-1"><h2 class="h2">The Pursuit</h2><a href="images/fulls/06.jpg" class="image2"><img class="img" src="images/thumbs/06.jpg" alt=""></a></article>
										<article class="item thumb span-2"><h2 class="h2">Boundless</h2><a href="images/fulls/07.jpg" class="image2"><img class="img" src="images/thumbs/07.jpg" alt=""></a></article>
										<article class="item thumb span-2"><h2 class="h2">The Spectators</h2><a href="images/fulls/08.jpg" class="image2"><img class="img" src="images/thumbs/08.jpg" alt=""></a></article>
										<article class="item thumb span-1"><h2 class="h2">You really got me</h2><a href="images/fulls/01.jpg" class="image2"><img class="img" src="images/thumbs/01.jpg" alt=""></a></article>
										<article class="item thumb span-2"><h2 class="h2">Ad Infinitum</h2><a href="images/fulls/02.jpg" class="image2"><img class="img" src="images/thumbs/02.jpg" alt=""></a></article>
										<article class="item thumb span-1"><h2 class="h2">Different.</h2><a href="images/fulls/03.jpg" class="image2"><img class="img" src="images/thumbs/03.jpg" alt=""></a></article>
										<article class="item thumb span-2"><h2 class="h2">Kingdom of the Wind</h2><a href="images/fulls/05.jpg" class="image2"><img class="img" src="images/thumbs/05.jpg" alt=""></a></article>
										<article class="item thumb span-1"><h2 class="h2">Elysium</h2><a href="images/fulls/04.jpg" class="image2"><img class="img" src="images/thumbs/04.jpg" alt=""></a></article>

									</div>

							</section>

					</section>
					
				</div>

			<!-- Two -->
				<section class="wrapper style2">
					<div class="inner">
						<header>
							<h2 class="h2_1">Etiam veroeros lorem</h2>
							<p>Fusce fringilla enim sit amet lectus sollicitudin, eu tincidunt odio semper.</p>
						</header>
						<!-- 탭으로 된 비디오 섹션 -->
							<div class="flex flex-tabs">
								<ul class="tab-list">
									<li><a href="#" data-tab="tab-1" class="active">Duis vestibulum tellus</a></li>
									<li><a href="#" data-tab="tab-2">Quam tempus sodales ipsum</a></li>
									<li><a href="#" data-tab="tab-3">Donec faucibus risus cursus</a></li>
								</ul>
								<div class="tabs">

									<!-- Tab 1 -->
										<div class="tab tab-1 flex flex-3 active">
											<!-- 비디오 미리 보기 -->
												<div class="video col">
													<div class="image fit">
														<img src="images/pic01.jpg" alt="" />
														<div class="arrow">
															<div class="icon fa-play"></div>
														</div>
													</div>
													<a href="generic.html" class="link"><span>Click Me</span></a>
												</div>
											<!-- 비디오 미리 보기 -->
												<div class="video col">
													<div class="image fit">
														<img src="images/pic02.jpg" alt="" />
														<div class="arrow">
															<div class="icon fa-play"></div>
														</div>
													</div>
													<a href="generic.html" class="link"><span>Click Me</span></a>
												</div>
											<!-- 비디오 미리 보기 -->
												<div class="video col">
													<div class="image fit">
														<img src="images/pic03.jpg" alt="" />
														<div class="arrow">
															<div class="icon fa-play"></div>
														</div>
													</div>
													<a href="generic.html" class="link"><span>Click Me</span></a>
												</div>
											<!-- 비디오 미리 보기 -->
												<div class="video col">
													<div class="image fit">
														<img src="images/pic04.jpg" alt="" />
														<div class="arrow">
															<div class="icon fa-play"></div>
														</div>
													</div>
													<a href="generic.html" class="link"><span>Click Me</span></a>
												</div>
											<!-- 비디오 미리 보기 -->
												<div class="video col">
													<div class="image fit">
														<img src="images/pic05.jpg" alt="" />
														<div class="arrow">
															<div class="icon fa-play"></div>
														</div>
													</div>
													<a href="generic.html" class="link"><span>Click Me</span></a>
												</div>
											<!-- 비디오 미리 보기 -->
												<div class="video col">
													<div class="image fit">
														<img src="images/pic06.jpg" alt="" />
														<div class="arrow">
															<div class="icon fa-play"></div>
														</div>
													</div>
													<a href="generic.html" class="link"><span>Click Me</span></a>
												</div>
										</div>

									<!-- Tab 2 -->
										<div class="tab tab-2 flex flex-3">
											<!-- 비디오 미리 보기 -->
												<div class="video col">
													<div class="image fit">
														<img src="images/pic06.jpg" alt="" />
														<div class="arrow">
															<div class="icon fa-play"></div>
														</div>
													</div>
													<a href="generic.html" class="link"><span>Click Me</span></a>
												</div>
											<!-- 비디오 미리 보기 -->
												<div class="video col">
													<div class="image fit">
														<img src="images/pic05.jpg" alt="" />
														<div class="arrow">
															<div class="icon fa-play"></div>
														</div>
													</div>
													<a href="generic.html" class="link"><span>Click Me</span></a>
												</div>
											<!-- 비디오 미리 보기 -->
												<div class="video col">
													<div class="image fit">
														<img src="images/pic04.jpg" alt="" />
														<div class="arrow">
															<div class="icon fa-play"></div>
														</div>
													</div>
													<a href="generic.html" class="link"><span>Click Me</span></a>
												</div>
											<!-- 비디오 미리 보기 -->
												<div class="video col">
													<div class="image fit">
														<img src="images/pic03.jpg" alt="" />
														<div class="arrow">
															<div class="icon fa-play"></div>
														</div>
													</div>
													<a href="generic.html" class="link"><span>Click Me</span></a>
												</div>
											<!-- 비디오 미리 보기 -->
												<div class="video col">
													<div class="image fit">
														<img src="images/pic02.jpg" alt="" />
														<div class="arrow">
															<div class="icon fa-play"></div>
														</div>
													</div>
													<a href="generic.html" class="link"><span>Click Me</span></a>
												</div>
											<!-- 비디오 미리 보기 -->
												<div class="video col">
													<div class="image fit">
														<img src="images/pic01.jpg" alt="" />
														<div class="arrow">
															<div class="icon fa-play"></div>
														</div>
													</div>
													<a href="generic.html" class="link"><span>Click Me</span></a>
												</div>
										</div>

									<!-- Tab 3 -->
										<div class="tab tab-3 flex flex-3">
											<!-- 비디오 미리 보기 -->
												<div class="video col">
													<div class="image fit">
														<img src="images/pic03.jpg" alt="" />
														<div class="arrow">
															<div class="icon fa-play"></div>
														</div>
													</div>
													<a href="generic.html" class="link"><span>Click Me</span></a>
												</div>
											<!-- 비디오 미리 보기 -->
												<div class="video col">
													<div class="image fit">
														<img src="images/pic02.jpg" alt="" />
														<div class="arrow">
															<div class="icon fa-play"></div>
														</div>
													</div>
													<a href="generic.html" class="link"><span>Click Me</span></a>
												</div>
											<!-- 비디오 미리 보기 -->
												<div class="video col">
													<div class="image fit">
														<img src="images/pic01.jpg" alt="" />
														<div class="arrow">
															<div class="icon fa-play"></div>
														</div>
													</div>
													<a href="generic.html" class="link"><span>Click Me</span></a>
												</div>
											<!-- 비디오 미리 보기 -->
												<div class="video col">
													<div class="image fit">
														<img src="images/pic06.jpg" alt="" />
														<div class="arrow">
															<div class="icon fa-play"></div>
														</div>
													</div>
													<a href="generic.html" class="link"><span>Click Me</span></a>
												</div>
											<!-- 비디오 미리 보기-->
												<div class="video col">
													<div class="image fit">
														<img src="images/pic05.jpg" alt="" />
														<div class="arrow">
															<div class="icon fa-play"></div>
														</div>
													</div>
													<a href="generic.html" class="link"><span>Click Me</span></a>
												</div>
											<!-- 비디오 미리 보기 -->
												<div class="video col">
													<div class="image fit">
														<img src="images/pic04.jpg" alt="" />
														<div class="arrow">
															<div class="icon fa-play"></div>
														</div>
													</div>
													<a href="generic.html" class="link"><span>Click Me</span></a>
												</div>
										</div>

								</div>
							</div>
					</div>
				</section>

			<!-- Three -->
				<section class="wrapper ">
					<div class="inner">
						<header class="align-center">
							<h2 class="h2_1">Aliquam ipsum purus dolor</h2>
							<p>Cras sagittis turpis sit amet est tempus, sit amet consectetur purus tincidunt.</p>
						</header>

						<!-- 3 Column Video Section -->
							<div class="flex flex-3">
								<div class="video col">
									<div class="image fit">
										<img src="images/pic09.jpg" alt="" />
										<div class="arrow">
											<div class="icon fa-play"></div>
										</div>
									</div>
									<p class="caption">
										Cras eget lacus sed mauris scelerisque tincidunt
									</p>
									<a href="generic.html" class="link"><span>Click Me</span></a>
								</div>
								<div class="video col">
									<div class="image fit">
										<img src="images/pic10.jpg" alt="" />
										<div class="arrow">
											<div class="icon fa-play"></div>
										</div>
									</div>
									<p class="caption">
										Vivamus vulputate lacus non massa auctor lobortis
									</p>
									<a href="generic.html" class="link"><span>Click Me</span></a>
								</div>
								<div class="video col">
									<div class="image fit">
										<img src="images/pic11.jpg" alt="" />
										<div class="arrow">
											<div class="icon fa-play"></div>
										</div>
									</div>
									<p class="caption">
										Nam eu nisi non ante sodales interdum a vitae neque
									</p>
									<a href="generic.html" class="link"><span>Click Me</span></a>
								</div>
							</div>
					</div>
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
						<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
						<li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
						<li><a href="#" class="icon fa-snapchat"><span class="label">Snapchat</span></a></li>
					</ul>
					&copy; Untitled. Design: <a href="https://templated.co">TEMPLATED</a>. Images: <a href="https://unsplash.com">Coverr</a>. Video: <a href="https://coverr.co">Coverr</a>.
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