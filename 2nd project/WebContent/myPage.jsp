<%@page import="com.DAO.NoteDAO"%>
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
                        				
                        				
                        				<% 
									String[] genreList = {"액션","SF","코미디","사극","뮤지컬","가족","스릴러","모험","전쟁","미스터리"
											,"범죄","판타지","멜로/로맨스","공포","다큐멘터리","드라마","애니메이션","어드벤처"};
									
									for(int i = 0; i < genreList.length; i++){%>
										
									<input id="cb<%=i%>" name="genre" type="checkbox" value="<%=genreList[i]%>">
									<label for="cb<%=i%>"><%=genreList[i]%></label>
									<%}%>
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
						<div class="tb_wrap">
  							<div class="tb_box">
    							<table class="tb">
    				 				<caption>내가 작성한 한줄평</caption>
    				 				
    				 				
      									<tr class="fixed_top">
       										<th class="cell1 cross" scope="col">영화 제목</th>
       										<th class="cell2" scope="col">한줄평</th>
      									</tr>
    				 				<%
    				 				   NoteDAO dao = new NoteDAO();
    				 				ArrayList<String[]> noteList = dao.getMyNote(info);
    				 				for(int i = 0; i < noteList.size(); i++){%>
    				 					<tr>
        									<th class="cell1 fixed_col" scope="row"><%=noteList.get(i)[0]%></th>
        									<td class="cell2"><%=noteList.get(i)[1]%></td>
      									</tr>
    				 				<%}%>
      									<!-- <tr>
        									<th class="cell1 fixed_col" scope="row">농구</th>
        									<td class="cell2">마이클 조던</td>
      									</tr>
      									<tr>
        									<th class="cell1 fixed_col" scope="row">농구</th>
        									<td class="cell2">마이클 조던</td>
      									</tr>
      									<tr>
        									<th class="cell1 fixed_col" scope="row">농구</th>
        									<td class="cell2">마이클 조던</td>
      									</tr>
      									<tr>
        									<th class="cell1 fixed_col" scope="row">농구</th>
        									<td class="cell2">마이클 조던</td>
      									</tr>
      									<tr>
        									<th class="cell1 fixed_col" scope="row">농구</th>
        									<td class="cell2">마이클 조던</td>
      									</tr>
      									<tr>
        									<th class="cell1 fixed_col" scope="row">농구</th>
        									<td class="cell2">마이클 조던</td>
      									</tr> -->
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
						<p><%=list.get(i).getGrade()%>점</p>
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