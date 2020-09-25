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
		
		<%
		if(info == null){%>
			
			<li><a href="#menu2">�α����� ���ּ���</a></li>
		
		<%}else{
			
			if(info.getId().equals("admin")){ %>
			<li><a href="main.jsp">����</a></li>
			<li><a href="admin.jsp">������ ���</a></li>
			
			
		<%}else{%>
			<li><a href="main.jsp">����</a></li>
			<li><a href="myPage.jsp">ȸ������ ����</a></li>
			<li><a href="Taste.jsp">���� �Է��ϱ�</a></li>
			<%}
			}%>
			
		</ul>
	</nav>
	<nav id="menu2">
		<ul class="links">
			<li><h5>�α���</h5></li>
			<form action="LoginService.do" method="post">
				<li><input style="background-color: white;" name="id" type="text" placeholder="ID�� �Է����ּ���"></li>
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
					�ڽ��� ������ �Է��ϰ� ��ȭ�� ��õ �޾ƺ�����<br/>
					���� �� ��ȭ�� �������� Ȯ���ϼ���
				</p>
			</header>
			<a href="#wrapper2" class="button big alt scrolly">��ȭ ��õ ���</a> <a
				href="point.jsp" class="button big alt scrolly">���� �Է��ϱ�</a>
		</div>

	</section>

	<!-- Main -->
<section class="wrapper style1">
	<div id="wrapper2" class="inner, main">
			
			<!--2�� ���� ����-->
			<!-- Main -->
			
			<% 
			MovieDAO dao = new MovieDAO();
			ArrayList<String> list = dao.movieNmAll("screen");
			ArrayList<String> list1 = dao.movieNmAll("movie");
			
			if (info != null){ %>
			<header class="align-center">
				<h2 class="h2_1">��õ��ȭ</h2>
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
				<h2 class="h2_1">���� ����</h2>
				<p></p>
			</header>
			<!--2�� ���� ����-->
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
						<input type="button" class="my-button<%=i%>" value="������"
					style="font-size: 12px; width: 70px; height:30px; float: right; text-align:center;">
				<div class="element_to_pop_up<%=i%>">
					<a class="b-close">X</a>
					<iframe width="1280" height="720"
						<%if(list.get(i).contains("�ٸ� �ǿ��� ���ϼҼ�")){ %>
						src="https://www.youtube.com/embed/7oKAPbnl7mQ"
						<%}else if(list.get(i).contains("��! ����")){ %>
						src="https://www.youtube.com/embed/tecLzQwIoMI?list=TLPQMjIwOTIwMjC8TZu7qX40Tg"
						<%}else if(list.get(i).contains("��Ⱬ��")){ %>
						src="https://www.youtube.com/embed/DNb9QP5kilE?list=TLPQMjIwOTIwMjC8TZu7qX40Tg"
						<%}else if(list.get(i).contains("���")){ %>
						src="https://www.youtube.com/embed/5QWeKTO9NpY?list=TLPQMjIwOTIwMjC8TZu7qX40Tg"
						<%}else if(list.get(i).contains("������ ������")){ %>
						src="https://www.youtube.com/embed/J20a-ws8wE0?list=TLPQMjIwOTIwMjC8TZu7qX40Tg"
						<%}else if(list.get(i).contains("������ ����")){ %>
						src="https://www.youtube.com/embed/Cpzns_3BWII?list=TLPQMjIwOTIwMjC8TZu7qX40Tg"
						<%}else if(list.get(i).contains("ī�϶� ���� ��")){ %>
						src="https://www.youtube.com/embed/29H83sX99Bc?list=TLPQMjIwOTIwMjC8TZu7qX40Tg"
						<%}else if(list.get(i).contains("�����ī")){ %>
						src="https://www.youtube.com/embed/HpDPuNVG1no?list=TLPQMjIwOTIwMjC8TZu7qX40Tg"
						<%}else if(list.get(i).contains("���� ������ ������")){ %>
						src="https://www.youtube.com/embed/1zvoSWKKkhQ?list=TLPQMjIwOTIwMjC8TZu7qX40Tg"
						<%}else if(list.get(i).contains("���ǽ���")){ %>
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
					%>
					<%
						for (int i = list.size(); i < 21; i++) {
					%>
					<article class="item thumb span-1"
						style="width: 280px; height: 400px;">
						<h2 class="h2"><%=list1.get(b)%>
						<input type="button" class="my-button<%=i%>" value="������"
					style="font-size: 12px; width: 70px; height:30px; float: right; text-align:center;">
				<div class="element_to_pop_up<%=i%>">
					<a class="b-close">X</a>
					<iframe width="1280" height="720"
						<%if(list1.get(b).contains("�ӱݴ��� ��Ǽ�ø")){ %>
						src="https://www.youtube.com/embed/w_8oPI6Vexc"
						<%}else if(list1.get(b).contains("Ư���ù�")){ %>
						src="https://www.youtube.com/embed/7pkMGdUradQ"
						<%}else if(list1.get(b).contains("�ƺ��� ��")){ %>
						src="https://www.youtube.com/embed/0AyJ3rY0x3A"
						<%}else if(list1.get(b).contains("�ð����� ��")){ %>
						src="https://www.youtube.com/embed/wmhP8fAUJng"
						<%}else if(list1.get(b).contains("�����")){ %>
						src="https://www.youtube.com/embed/J20a-ws8wE0?list=TLPQMjIwOTIwMjC8TZu7qX40Tg"
						<%}else if(list1.get(b).contains("������")){ %>
						src="https://www.youtube.com/embed/Cpzns_3BWII?list=TLPQMjIwOTIwMjC8TZu7qX40Tg"
						<%}else if(list1.get(b).contains("������")){ %>
						src="https://www.youtube.com/embed/29H83sX99Bc?list=TLPQMjIwOTIwMjC8TZu7qX40Tg"
						<%}else if(list1.get(b).contains("�������� Ư�����")){ %>
						src="https://www.youtube.com/embed/HpDPuNVG1no?list=TLPQMjIwOTIwMjC8TZu7qX40Tg"
						<%}else if(list1.get(b).contains("��õ� �帲")){ %>
						src="https://www.youtube.com/embed/1zvoSWKKkhQ?list=TLPQMjIwOTIwMjC8TZu7qX40Tg"
						<%}else if(list1.get(b).contains("�غ�")){ %>
						src="https://www.youtube.com/embed/1zvoSWKKkhQ?list=TLPQMjIwOTIwMjC8TZu7qX40Tg"
						<%}else if(list1.get(b).contains("���̵����")){ %>
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
					<h3>����</h3>
					<ul class="alt">
						<li><a href="#">������</a></li>
						<li><a href="#"></a></li>
					</ul>
				</div>
				<div class="col">
					<h3>����</h3>
					<ul class="alt">
						<li><a href="#">�����</a></li>
						<li><a href="#">����ȣ</a></li>
						
					</ul>
				</div>
				<div class="col">
					<h1></h1>
					<br>
					<ul class="alt">
						<li><a href="#">������</a></li>
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