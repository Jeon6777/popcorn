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
		<a href="#menu2">�α���</a> <a href="#menu3">ȸ������</a>
		<%
			} else {
		%>
		<a href="LogoutService.do">�α׾ƿ�</a>
		<%
			}
		%>
		<a href="#menu">Menu</a>
	</header>

	<!-- Nav -->
	<nav id="menu">
		<ul class="links">
			<li><a href="main.jsp">����</a></li>
			<li><a href="myPage.jsp">ȸ������ ����</a></li>
			<li><a href="generic.jsp">Generic</a></li>
			<li><a href="elements.jsp">Elements</a></li>
		</ul>
	</nav>
	<nav id="menu2">
		<ul class="links">
			<li><h5>�α���</h5></li>
			<form action="LoginService.do" method="post">
				<li><input name="id" type="text" placeholder="ID�� �Է����ּ���"></li>
				<li><input name="pw" type="password" placeholder="PW�� �Է����ּ���"></li>
				<li><input type="submit" value="LogIn" class="button fit"></li>
			</form>
		</ul>
	</nav>

	<nav id="menu3">
		<div class="inner">
			<div class="inner">
				<ul class="actions vertical" style="width: 40.5em;">
					<li><h5>ȸ������</h5></li>
					<ul>
						<form action="JoinService.do" method="post" autocomplete="off">
							<li><input name="id" type="text" placeholder="ID�� �Է����ּ���"></li>
							<li><input name="pw" type="password"
								placeholder="PW�� �Է����ּ���"></li>
							<li><input name="nick" type="text"
								placeholder="NICK�� �Է����ּ���"></li> <br>
							<h5>�����ϴ� �帣</h5>
							<table>
								<tr>
								<% 
									String[] genreList = {"�׼�","SF","�ڹ̵�","���","������","����","������","����","����","�̽��͸�"
											,"����","��Ÿ��","���/�θǽ�","����","��ť���͸�","���","�ִϸ��̼�","��庥ó"};
									
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
				������ ������� ����Ϸ��� ������ ������ ���� �̸����� �����Ͻʽÿ�.
				Ȯ��(��: ����/����). �������� .mp4 �� .webm���� �����Ǿ�� ��
				�ùٸ��� �۵��ϴ� ����.
			-->
	<section id="banner"
		style="background-image: url(images/Download1.jpg);">
		<div class="inner">
			<header>
				<h1>��ȭ�� ��õ ��������!</h1>
				<p>
					�ڽ��� ������ �Է��ϰ�<br /> ���� �´� ��ȭ�� ã������.
				</p>
			</header>
			<a href="#wrapper" class="button big alt scrolly">��ȭ ��� ����</a> <a
				href="point.jsp" class="button big alt scrolly">���� �Է��ϱ�</a>
		</div>

	</section>

	<!-- Main -->
	<div id="wrapper" class="inner, main">
		<!-- One -->
		<!-- Wrapper -->
		<section class="wrapper style1">
			<header class="align-center">
				<h2 class="h2_1">���� ����</h2>
				<p></p>
			</header>
			<!--2�� ���� ����-->
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
			</section>
		</section>
	</div>
	<!-- One -->

	<!-- Wrapper -->
	
	<div id="wrapper1" class="inner, main">
		<section class="wrapper style1">
			<header class="align-center">
				<h2 class="h2_1">���� ������</h2>
				<p></p>
			</header>
			<!--2�� ���� ����-->
			<!-- Main -->
			<section id="main1">
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
			</section>
		</section>
	</div>
	

	<div id="wrapper2" class="inner, main">
		<section class="wrapper style1">
			<header class="align-center">
				<h2 class="h2_1">��õ��ȭ</h2>
				<p></p>
			</header>
			<!--2�� ���� ����-->
			<!-- Main -->
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

</body>
</html>