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
<title>pop('corn') </title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<noscript>
	<link rel="stylesheet" href="assets/css/noscript.css" />
</noscript>
<style>
* {
  -webkit-font-smoothing: antialiased;
  text-rendering: optimizeLegibility;
}

 body {
  align-items: center;
  justify-content: center;
  flex-direction: column; 
  position: relative;

  font-family: "Roboto", helvetica, arial, sans-serif;


  &:before {
    content: "";
    position: absolute;
    top: 0;
    left: 0;
    height: 100%;
    width: 100%;

   opacity: 0.3;
  }
} 

.login-form {
  width: 100%;
  padding: 2em;
  position: relative;
  background: rgba(0, 0,0, 0.5);
 
  &:before {
    content: "";
    position: absolute;
    top: -2px;
    left: 0;
    height: 2px;
    width: 100%;


  }

  @media screen and (min-width: 600px) {
    width: 50vw;
    max-width: 15em;
  }
}

.flex-row {
  display: flex;
  margin-bottom: 1em;
}

.lf--label {
  width: 2em;
  display: flex;
  align-items: center;
  justify-content: center;

  background: #8f8f8f-light;
  cursor: pointer;
}
.lf--input {
  flex: 1;
  padding: 1em;
  border: 0;
  color: #8f8f8f;
  font-size: 1rem;
  height: 2.0em;

  &:focus {
    outline: none;
    transition: transform 0.15s ease;
    transform: scale(1.1);
  }
}

.lf--submit{
  display: block;
  padding: 1em;
  width: 100%;

  background: linear-gradient(to right, #35c3c1, #00d6b7);
  border: 0;
  color: #fff;
  cursor: pointer;
  font-size: 0.75em;
  font-weight: 600;
  text-shadow: 0 1px 0 rgba(black, 0.2);

  &:focus {
    outline: none;
    transition: transform 0.15s ease;
    transform: scale(1.1);
  }
}

.lf--forgot {
  margin-top: 1em;
  color: #00d6b7;
  font-size: 0.65em;
  text-align: center;
  position: relative;
}

::placeholder {
  color: #8f8f8f;
}

</style>
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
			<li><a href="starRating.jsp">���ϱ�</a></li>
			<%}
			}%>
			
		</ul>
	</nav>
	<nav id="menu2">
		<ul class="links">
			<li><h3 style=" margin-bottom: 15px;">�α���</h3></li>
			<form class="login-form" action="LoginService.do" method="post">
 			 <div class="flex-row">
    			<label class="lf--label" for="username">
      			<svg x="0px" y="0px" width="12px" height="13px">
      			  <path fill="#B1B7C4" d="M8.9,7.2C9,6.9,9,6.7,9,6.5v-4C9,1.1,7.9,0,6.5,0h-1C4.1,0,3,1.1,3,2.5v4c0,0.2,0,0.4,0.1,0.7 C1.3,7.8,0,9.5,0,11.5V13h12v-1.5C12,9.5,10.7,7.8,8.9,7.2z M4,2.5C4,1.7,4.7,1,5.5,1h1C7.3,1,8,1.7,8,2.5v4c0,0.2,0,0.4-0.1,0.6 l0.1,0L7.9,7.3C7.6,7.8,7.1,8.2,6.5,8.2h-1c-0.6,0-1.1-0.4-1.4-0.9L4.1,7.1l0.1,0C4,6.9,4,6.7,4,6.5V2.5z M11,12H1v-0.5 c0-1.6,1-2.9,2.4-3.4c0.5,0.7,1.2,1.1,2.1,1.1h1c0.8,0,1.6-0.4,2.1-1.1C10,8.5,11,9.9,11,11.5V12z"/>
     			</svg>
    			</label>
    			<input id="username" class='lf--input' placeholder='UserID' type='text' name='id'>
  				</div>
 				 <div class="flex-row">
  				  <label class="lf--label" for="password">
   				   <svg x="0px" y="0px" width="15px" height="5px">
     			   <g>
         		 <path fill="#B1B7C4" d="M6,2L6,2c0-1.1-1-2-2.1-2H2.1C1,0,0,0.9,0,2.1v0.8C0,4.1,1,5,2.1,5h1.7C5,5,6,4.1,6,2.9V3h5v1h1V3h1v2h1V3h1 V2H6z M5.1,2.9c0,0.7-0.6,1.2-1.3,1.2H2.1c-0.7,0-1.3-0.6-1.3-1.2V2.1c0-0.7,0.6-1.2,1.3-1.2h1.7c0.7,0,1.3,0.6,1.3,1.2V2.9z"/>
       				 </g>
     				 </svg>
   					 </label>
  				  <input id="password" class='lf--input' placeholder='Password' type='password' name='pw'>
				  </div>
 				 <input class='lf--submit' type='submit' value='LOGIN'>
					</form>
			<!-- <form action="LoginService.do" method="post">
				<li><input style="background-color: white;" name="id" type="text" placeholder="ID�� �Է����ּ���"></li>
				<li><input name="pw" type="password" placeholder="PW�� �Է����ּ���"></li>
				<li><input type="submit" value="LogIn" class="button fit"></li>
			</form> -->
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
					��ȭ�� ���ϰ� ��õ �޾ƺ�����<br/>
					���� �� ��ȭ�� �������� Ȯ���ϼ���
				</p>
			</header>
			<a href="#wrapper2" class="button big alt scrolly">��ȭ ��õ ���</a> <a
				href="starRating.jsp" class="button big alt scrolly">���ϱ�</a>
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
			<%}%>
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
<img src="img/top.png" style="width:50px; height:50px; border-radius: 15px;margin-right: 10px;"/></a>

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