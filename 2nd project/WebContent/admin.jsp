<%@page import="java.util.Calendar"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.DAO.MovieDAO"%>
<%@page import="com.DTO.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<!--
	Broadcast by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
<head>
<title>관리자 페이지</title>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="assets/css/main.css" />
<script src="js/jquery-3.5.1.min.js"></script>
</head>

<body class="subpage">
	<%
		MemberDTO info = (MemberDTO) session.getAttribute("info");

	Calendar cal = Calendar.getInstance();
	int year = cal.get(cal.YEAR);
	int month = cal.get(cal.MONTH) + 1;
	int date = cal.get(cal.DATE) - 1;
	String today = year + "0" + month + date;
	String printDay = year+"년     "+month+"월    "+date+"일\t"; 
	System.out.println("박스오피스 날짜  : " + printDay);
	//System.out.println("오늘 날짜 : " + today);
	%>
	<!-- Header -->
	<header id="header" class="alt">
		<h1>
			<a href="main.jsp">pop <span>('corn')</span></a>
		</h1>
		<a href="#menu">Menu</a>
	</header>

	<!-- Nav -->
	<nav id="menu">
		<ul class="links">
			<li><a href="main.jsp">Home</a></li>
			<li><a href="admin.jsp">관리자 Mode</a></li>
			<li><a href="starRating.jsp">평가하기</a></li>
		</ul>
	</nav>

	<!-- Main -->
	<section class="wrapper style1">
		<div id="main">
			<div class="inner">
				<header class="align-center">
					<h2 class="h2_1">관리자</h2>

				</header>


				<!-- 상영작 다운로드 -->

				<hr class="major" />

				<div class="row 200%">
					<div class="10u 12u$(medium)">
						<input class="button special icon fa-search" name="file_name"
							type="file" style="float: right;">
						<h3>상영작 관리</h3>

						<div class="box">

							<h4><%=printDay %> 박스 오피스</h4>
							<div class="table-wrapper">
								<table id="screenTable">
									<thead>
										<tr>
											<th>영화제목</th>
											<th>감독</th>
											<th>장르</th>
											<th>배우</th>
											<th>오픈 날짜</th>
										</tr>
									</thead>

								</table>
							</div>
						</div>
					</div>
					<div class="1u$ 12u$(medium)" style="padding: 0 0 0 12px;">
						<br> <br>
						<ul class="actions">
							<li><button onclick="screenPrint()"
									class="button special icon fa-search">상영작 출력</li>
							<br>
							<br>
							<li><button onclick="downloadCSV()"
									class="button icon fa-download">
									파일 다운로드</li>
							<br>
							<br>
							<li><a href="UploadScreenService.do"
								class="button alt icon fa-check">DB 업데이트</a></li>


						</ul>
					</div>
				</div>
				<hr />
			</div>
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
							MovieDAO dao = new MovieDAO();
						ArrayList<String> list = dao.movieNmAll("screen");
						%>
						<h1 style="text-align: center"></h1>

						<%
						String print = "";
							int a = 0;
						for (int i = 0; i < list.size(); i++) {
							
							if (list.get(i).contains(":")) {
								String[] spl = list.get(i).split(":");
								print = spl[0].trim();
								System.out.println(print);
							} else {
								print = list.get(i);
								System.out.println(print);
							}
						%>
						<article class="item thumb span-1"
							style="width: 280px; height: 400px;">
							<h2 class="h2"><%=list.get(i)%></h2>
							<a href="img/<%=print%>.jpg" class="image2"> <img
								class="img" src="img/<%=print%>.jpg" alt="">
							</a>
						</article>
						<%
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
		<div id="Parse_Area"></div>
	</footer>

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

	<script>
	   /* var urlList = [20193666, 20201687, 20183813, 20197922, 20199883, 20189973, 20198484, 20196773, 20209022, 20197032];  */

	   var array = [];
	
    
    console.log("오늘 날짜 2: <%=today%>");
    var todayList = [];
     	
      	window.onload = function () {
     		var a = <%=today%>;
     		console.log(a)
     		  $.ajax({
   	      		
     				url : "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=eed9023203d880733508fd00373d6f6f&multiMovieYn=N&repNationCd=K&targetDt="+a,
     				type : "get",
     				success : function(res){
     					var list = res.boxOfficeResult.dailyBoxOfficeList;
     					for (var i = 0; i < list.length; i++) {
     						todayList.push(list[i].movieCd);
     						console.log(list[i].movieCd)
    					}
     				},
    				error : function () {
    					 alert("연결실패");                       
    				}
     						
      		 });
     	} 
     
         function screenPrint(){
        	for (var i = 0 ; i < todayList.length; i++) {
        		  (function(i){ 
        	console.log("반복문시작")
            	$.ajax({
            		url : "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json?key=eed9023203d880733508fd00373d6f6f&movieCd="+todayList[i],
            		type : "get",
            		dataType: 'json',
            		 async:false,
            		 success : function(res){
            			 var cnt = 0;
            			 var movieNm = res.movieInfoResult.movieInfo.movieNm;
             			console.log("영화 이름 : "+movieNm);
            			var temp_dir="";
            			var temp_gen="";
            			var temp_act="";
            			
            			 var direct = res.movieInfoResult.movieInfo.directors;
            			 for (var i = 0; i < direct.length; i++) {
            				 temp_dir += direct[i].peopleNm;
                			 if(i+1 < direct.length){
                				 temp_dir += "/";
                			 }
    						}            			
    					var genre = res.movieInfoResult.movieInfo.genres;
            			 for (var i = 0; i < genre.length; i++) {
            				 temp_gen+=genre[i].genreNm;
                			 if(i+1 <genre.length){
                				 temp_gen+="/";
                			 }
    						}
    					var actor = res.movieInfoResult.movieInfo.actors;
            			 for (var i = 0; i <actor.length; i++) {
            				 temp_act += actor[i].peopleNm;
            			 if(i>=2){
        					 break;
        				 }
            			 if(i+1 < actor.length){
            				 temp_act +="/";
            			 }
						}
						
						var open = res.movieInfoResult.movieInfo.openDt;
             		
             			$("#screenTable").append("<tr><td>"+movieNm+"</td><td>"+temp_dir+"</td><td>"+temp_gen+"</td><td>"+temp_act+"</td><td>"+open+"</td></tr>");

            			array.push({name : movieNm , directors : temp_dir, genres : temp_gen, actors : temp_act, openDt : open});
            			
            		 },
            		 error : function () {
            			 alert("연결실패");                       
					}
            	});
        		  })(i);
        	}  
        }
        
        function downloadCSV(){        	
    		var a = "";
    		for (var i = 0; i < array.length; i++) {
        		a += array[i].name+","+ array[i].directors+","+ array[i].genres+","+array[i].actors+","+array[i].openDt + "\r\n";
			}
    		var downloadLink = document.createElement("a");
    		var blob = new Blob([a], { type: "text/csv;charset=utf-8" });
    		var url = URL.createObjectURL(blob);
    		downloadLink.href = url;
    		downloadLink.download = "data.csv";

    		document.body.appendChild(downloadLink);
    		downloadLink.click();
    		document.body.removeChild(downloadLink);
    	}
    </script>

</body>
</html>