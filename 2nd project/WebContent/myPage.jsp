<%@page import="com.DTO.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<title>마이페이지</title>
		 <meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets/css/main.css" />
		 <script src="/0911/jquery-3.5.1.min.js"></script>
	</head>
	<body class="subpage">
	<%
		MemberDTO info =  (MemberDTO)session.getAttribute("info");
	%>

		<!-- Header -->
			<header id="header" class="alt">
				<h1><a href="main.jsp">pop <span>('corn')</span></a></h1>
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

		<!-- Main -->
			<div id="main">

			<!-- One -->
				<section class="wrapper style1">
					<div class="inner">
						<header class="align-center">
							<h3><%=info.getNick() %> 님 환영합니다!</h3>
						</header>
							<img alt="" src="img/memberinfo.png" style="margin-left: 170px">
						<div class="box">
							<form method="post" action="UpdateService.do">
									<h4>ID : <%=info.getId() %></h4>
									<h5>비밀번호 변경</h5>
									<div class="6u$ 12u$(xsmall)">
										<input type="password" name="pw" id="pw" placeholder="새 비밀번호" >
									</div>
									<div class="6u$ 12u$(xsmall)">
										<input type="password" name="pw_Check" id="pw_Check" placeholder="새 비밀번호 확인" >
									</div>
									<h5>닉네임  </h5>
									<div class="6u$ 12u$(xsmall)">
										<input type="text" name="nick" id="nick" value=<%=info.getNick() %> >
									</div>
									<br>
									<h5>좋아하는 장르  </h5>
									<%
										String genre = info.getGenre();
										System.out.println("장르 : "+genre);
										String[] genres = genre.split("|");
										for(int i=0; i<genres.length;i++){
											System.out.println("구분자 | 로 자르기 : "+genres[i]);
										}
									%>
									<table>
                        				<tr>
                          					<input id="cb1" name="genre" type="checkbox" value="액션">        <label for="cb1">액션</label>
                         					<input id="cb2" name="genre" type="checkbox" value="SF">          <label for="cb2">SF</label>
                          					<input id="cb3" name="genre" type="checkbox" value="코미디">     <label for="cb3">코미디</label>
                          					<input id="cb4" name="genre" type="checkbox" value="사극">         <label for="cb4">사극</label>
                          				 	<input id="cb5" name="genre" type="checkbox" value="뮤지컬">     <label for="cb5">뮤지컬</label>   
                          					<input id="cb6" name="genre" type="checkbox" value="가족">        <label for="cb6">가족</label>   
                          					<input id="cb7" name="genre" type="checkbox" value="스릴러">     <label for="cb7">스릴러</label>   
                          					<input id="cb8" name="genre" type="checkbox" value="모험">        <label for="cb8">모험</label>
                        				  	<input id="cb9" name="genre" type="checkbox" value="전쟁">        <label for="cb9">전쟁</label>
                       					   	<input id="cb10" name="genre" type="checkbox" value="미스터리">   <label for="cb10">미스터리</label><br>
                      					    <input id="cb11" name="genre" type="checkbox" value="범죄">       <label for="cb11">범죄</label>
                      						<input id="cb12" name="genre" type="checkbox" value="판타지">     <label for="cb12">판타지</label>
                      						<input id="cb13" name="genre" type="checkbox" value="멜로/로맨스"><label for="cb13">멜로/로맨스</label>
                         					<input id="cb14" name="genre" type="checkbox" value="공포">        <label for="cb14">공포</label>
                      						<input id="cb15" name="genre" type="checkbox" value="다큐멘터리"> <label for="cb15">다큐멘터리</label>
                       					    <input id="cb16" name="genre" type="checkbox" value="드라마">     <label for="cb16">드라마</label>
                        			   		<input id="cb17" name="genre" type="checkbox" value="애니메이션"> <label for="cb17">애니메이션</label>
                        					<input id="cb18" name="genre" type="checkbox" value="어드벤처">   <label for="cb18">어드벤처</label>
                        				</tr>
                    				 </table>
									</div>
									<input style="margin-left: 270px;" type="submit" value="회원 정보 수정" class="button special fit">
									<input type="button" value="뒤로가기" onclick="history.back(-1);" class="button special fit">
								</section>
							</form>

			<!-- Three -->
				<section class="wrapper ">
					<div class="inner">
						<header class="align-center">
							<h2>Aliquam ipsum purus dolor</h2>
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
			<script src="assets/js/main.js"></script>

	</body>
</html>