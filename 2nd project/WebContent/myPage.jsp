<%@page import="com.DTO.GradeDTO"%>
<%@page import="com.DAO.GradeDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.DAO.MovieDAO"%>
<%@page import="java.util.Random"%>
<%@page import="com.DTO.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri ="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<title>����������</title>
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
							<h3><%=info.getNick() %> �� ȯ���մϴ�!</h3>
						</header>
							<img alt="" src="img/memberinfo.png" style="margin-left: 170px">
						<div class="box">
							<form method="post" action="UpdateService.do">
									<h4>ID : <%=info.getId() %></h4>
									<h5>��й�ȣ ����</h5>
									<div class="6u$ 12u$(xsmall)">
										<input type="password" name="pw" id="pw" placeholder="�� ��й�ȣ" >
									</div>
									<div class="6u$ 12u$(xsmall)">
										<input type="password" name="pw_Check" id="pw_Check" placeholder="�� ��й�ȣ Ȯ��" >
									</div>
									<h5>�г���  </h5>
									<div class="6u$ 12u$(xsmall)">
										<input type="text" name="nick" id="nick" value=<%=info.getNick() %> >
									</div>
									<br>
									<h5>�����ϴ� �帣  </h5>
									<%
										String genre = info.getGenre();
										System.out.println("�帣 : "+genre);
										String[] genres = genre.split("|");
										for(int i=0; i<genres.length;i++){
											System.out.println("������ | �� �ڸ��� : "+genres[i]);
										}
									%>
									<table>
                        				<tr>
                          					<input id="cb1" name="genre" type="checkbox" value="�׼�">        <label for="cb1">�׼�</label>
                         					<input id="cb2" name="genre" type="checkbox" value="SF">          <label for="cb2">SF</label>
                          					<input id="cb3" name="genre" type="checkbox" value="�ڹ̵�">     <label for="cb3">�ڹ̵�</label>
                          					<input id="cb4" name="genre" type="checkbox" value="���">         <label for="cb4">���</label>
                          				 	<input id="cb5" name="genre" type="checkbox" value="������">     <label for="cb5">������</label>   
                          					<input id="cb6" name="genre" type="checkbox" value="����">        <label for="cb6">����</label>   
                          					<input id="cb7" name="genre" type="checkbox" value="������">     <label for="cb7">������</label>   
                          					<input id="cb8" name="genre" type="checkbox" value="����">        <label for="cb8">����</label>
                        				  	<input id="cb9" name="genre" type="checkbox" value="����">        <label for="cb9">����</label>
                       					   	<input id="cb10" name="genre" type="checkbox" value="�̽��͸�">   <label for="cb10">�̽��͸�</label><br>
                      					    <input id="cb11" name="genre" type="checkbox" value="����">       <label for="cb11">����</label>
                      						<input id="cb12" name="genre" type="checkbox" value="��Ÿ��">     <label for="cb12">��Ÿ��</label>
                      						<input id="cb13" name="genre" type="checkbox" value="���/�θǽ�"><label for="cb13">���/�θǽ�</label>
                         					<input id="cb14" name="genre" type="checkbox" value="����">        <label for="cb14">����</label>
                      						<input id="cb15" name="genre" type="checkbox" value="��ť���͸�"> <label for="cb15">��ť���͸�</label>
                       					    <input id="cb16" name="genre" type="checkbox" value="���">     <label for="cb16">���</label>
                        			   		<input id="cb17" name="genre" type="checkbox" value="�ִϸ��̼�"> <label for="cb17">�ִϸ��̼�</label>
                        					<input id="cb18" name="genre" type="checkbox" value="��庥ó">   <label for="cb18">��庥ó</label>
                        				</tr>
                    				 </table>
									</div>
									<input style="margin-left: 270px;" type="submit" value="ȸ�� ���� ����" class="button special fit">
									<input type="button" value="�ڷΰ���" onclick="history.back(-1);" class="button special fit">
								</section>
							</form>

			<!-- Three -->
				<section class="wrapper ">
					<div class="inner">
						<div class="tb_wrap">
  							<div class="tb_box">
    							<table class="tb">
    				 				<caption>���� �ۼ��� ������</caption>
      									<tr class="fixed_top">
       										<th class="cell1 cross" scope="col">��ȭ ����</th>
       										<th class="cell2" scope="col">������</th>
      									</tr>
      									<tr>
        									<th class="cell1 fixed_col" scope="row">��</th>
        									<td class="cell2">����Ŭ ����</td>
      									</tr>
      									<tr>
        									<th class="cell1 fixed_col" scope="row">��</th>
        									<td class="cell2">����Ŭ ����</td>
      									</tr>
      									<tr>
        									<th class="cell1 fixed_col" scope="row">��</th>
        									<td class="cell2">����Ŭ ����</td>
      									</tr>
      									<tr>
        									<th class="cell1 fixed_col" scope="row">��</th>
        									<td class="cell2">����Ŭ ����</td>
      									</tr>
      									<tr>
        									<th class="cell1 fixed_col" scope="row">��</th>
        									<td class="cell2">����Ŭ ����</td>
      									</tr>
      									<tr>
        									<th class="cell1 fixed_col" scope="row">��</th>
        									<td class="cell2">����Ŭ ����</td>
      									</tr>
    								</table>
 								</div>
							</div>
					</div>
				</section>

			</div>

		<!-- Footer -->
			<footer id="footer">
				<div class="inner">
			 		<div class="items">
					<%
					MovieDAO dao1 = new MovieDAO();
					GradeDAO dao2 = new GradeDAO();
					String id = info.getId();
					ArrayList<String> list1 = dao1.movieNmAll("movie");
					ArrayList<GradeDTO> list = dao2.getGrade(id);
						
						int b = 0;
					%>
					<%
						for (int i = 0; i < list.size(); i++) {
						System.out.print(list.size());
					%>
					
					<article class="item thumb span-1"
						style="width: 280px; height: 400px;">
						<a href="img/<%=list.get(i).getMovieNm()%>.jpg" class="image2">
						<img class="img" src="img/<%=list.get(i).getMovieNm()%>.jpg" alt=""></a>
						<p><%=list.get(i).getGrade()%>��</p>
					</article>
					 
					<%}%>
				</div> 
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