<%@page import="com.DTO.MemberDTO"%>
<%@page import="com.DTO.MovieDTO"%>
<%@page import="java.util.Random"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.DAO.MovieDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>평점 입력</title>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<style type="text/css">
@import
	url(//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css); 
img {
	width: 400px;
}

.row {
	display: inline;
	float: left;
	/* clear: both; */
	width: 300px;
	margin-left: 130px;
}

body {
	margin: 20px;
	background-image: url("images/overlay.png"), -moz-linear-gradient(top, rgba(0, 0, 0, 0) 75%, rgba(0, 0, 0, 0.65)), url("images/bg.jpg");
	background-image: url("images/overlay.png"), -webkit-linear-gradient(top, rgba(0, 0, 0, 0) 75%, rgba(0, 0, 0, 0.65)), url("images/bg.jpg");
	background-image: url("images/overlay.png"), -ms-linear-gradient(top, rgba(0, 0, 0, 0) 75%, rgba(0, 0, 0, 0.65)), url("images/bg.jpg");
	background-image: url("images/overlay.png"), linear-gradient(top, rgba(0, 0, 0, 0) 75%, rgba(0, 0, 0, 0.65)), url("images/bg.jpg");
	background-position: top left, bottom left, auto;
	background-size: auto, 100% 100%, cover;
	background-attachment: fixed;
	background-repeat: repeat, no-repeat, auto;
	position: relative;
	
	line-height: 1.75em;
	overflow-x: hidden;
	overflow-y: auto;
	
	
}

h1 {
	font-size: 1.5em;
	margin: 10px;
}

fieldset, label {
	margin: 0;
	padding: 0;
}
/* fieldset[class *="rating"] */
/****** Style Star Rating Widget *****/

/* .rating0 { 
  border: none;
  float: left;
}

.rating0 > input { display: none; } 
.rating0 > label:before { 
  margin: 5px;
  font-size: 1.25em;
  font-family: FontAwesome;
  display: inline-block;
  content: "\f005";
}

.rating0 > .half:before { 
  content: "\f089";
  position: absolute;
}

.rating0 > label { 
  color: #ddd; 
 float: right; 
} */

/***** CSS Magic to Highlight Stars on Hover *****/
/* 
.rating0 > input:checked ~ label, /* show gold star when clicked */
.rating0:not(:checked) > label:hover, /* hover current star */
.rating0:not(:checked) > label:hover ~ label { color: #FFD700;  } /* hover previous stars in list */

.rating0 > input:checked + label:hover, /* hover current star when changing rating */
.rating0 > input:checked ~ label:hover,
.rating0 > label:hover ~ input:checked ~ label, /* lighten current selection */
.rating0 > input:checked ~ label:hover ~ label { color: #FFED85;  }  */


/****** Style Star Rating Widget *****/

/* .rating1 { 
  border: none;
  float: left;
}

.rating1 > input { display: none; } 
.rating1 > label:before { 
  margin: 5px;
  font-size: 1.25em;
  font-family: FontAwesome;
  display: inline-block;
  content: "\f005";
}

.rating1 > .half:before { 
  content: "\f089";
  position: absolute;
}

.rating1 > label { 
  color: #ddd; 
 float: right; 
}

/***** CSS Magic to Highlight Stars on Hover *****/

.rating1 > input:checked ~ label, /* show gold star when clicked */
.rating1:not(:checked) > label:hover, /* hover current star */
.rating1:not(:checked) > label:hover ~ label { color: #FFD700;  } /* hover previous stars in list */

.rating1 > input:checked + label:hover, /* hover current star when changing rating */
.rating1 > input:checked ~ label:hover,
.rating1 > label:hover ~ input:checked ~ label, /* lighten current selection */
.rating1 > input:checked ~ label:hover ~ label { color: #FFED85;  } 
 */
</style>
<script src="js/jquery-3.5.1.min.js"></script>
</head>
<body>

	<%
		MovieDAO dao = new MovieDAO();
	ArrayList<MovieDTO> list = dao.allMovie("movie");
	%>
	<header>
		<h1 style="text-align: center; color: white; font-size: 50px;">영화에
			평점을 입력하세요!	            
			<a onClick="window.location.reload()" style="cursor: pointer;"><img src = "images/refresh.png" style="width:80px; height:80px"></a>
			</h1>
	</header>
	
			<center>
			</center>
	<div>
		<table>
			<%
				Random rd = new Random();
			int a = rd.nextInt(list.size());
			int cnt = 0;
			for (int j = 0; j < 4; j++) {
			%>
			<tr>
				<%
					String print = "";
				for (int i = 0; i < 4; i++) {
				%>
				<td>
					<div class="row">
						<div class="col-sm-6 col-md-4" style="width: 80%">
							<div class="thumbnail">
								<%
									if (list.get(a).getMovieNm().contains(":")) {
									String[] spl = list.get(a).getMovieNm().split(":");
									print = spl[0].trim();
									System.out.println(print);
								} else {
									print = list.get(a).getMovieNm();
									System.out.println(print);
								}
								%>
								<a href="img/<%=print%>.jpg"> <img src="img/<%=print%>.jpg"
									alt="movie">
								</a>
								<div class="caption" id = "caption<%=cnt %>" style="height: 250px;">
								<%-- 	<h3 id="movieNm"><%=list.get(a).getMovieNm()%></h3> --%>
								<h2 class = "movieNm1" id="movieNm<%=cnt %>"><%=list.get(a).getMovieNm()%></h2>
									<p><%=list.get(a).getGenre()%></p>
							
								
								<fieldset class="rating<%=cnt%> ">
									<input type="radio" id="star1" name="rating" value="1"/>
									<label class="full" for="star1" title="Sucks big time - 1 star"></label>
									<input type="radio" id="star2" name="rating" value="2" />
									<label class="full" for="star2" title="Kinda bad - 2 stars"></label>
									<input type="radio" id="star3" name="rating" value="3" />
									<label class="full" for="star3" title="Meh - 3 stars"></label>
									<input type="radio" id="star4" name="rating" value="4" />
									<label class="full" for="star4" title="Pretty good - 4 stars"> </label>	
									<input type="radio" id="star5" name="rating" value="5" />
									<label class="full" for="star5" title="Awesome - 5 stars"> </label>	
										 <!-- <input type="radio" id="star4half" name="rating" value="4.5" /><label
										class="half" for="star4half" title="Pretty good - 4.5 stars"></label> -->
									
									<!-- <input type="radio" id="star3half" name="rating" value="3.5" /><label
										class="half" for="star3half" title="Meh - 3.5 stars"></label> -->
									<!--  <input
										type="radio" id="star2half" name="rating" value="2.5" /><label
										class="half" for="star2half" title="Kinda bad - 2.5 stars"></label> -->
									
								<!-- 	<input type="radio" id="star1half" name="rating" value="1.5" /><label
										class="half" for="star1half" title="Meh - 1.5 stars"></label> -->
									
									<!-- <input type="radio" id="starhalf" name="rating" value="0.5" /><label
										class="half" for="starhalf" title="Sucks big time - 0.5 stars"></label> -->
								</fieldset>
								
								<h1 id="starTxt<%=cnt %>"></h1>
								<%cnt++; %>
								
							</div>
						</div>
					</div>
					</div>
				</td>
				<%
					a = rd.nextInt(list.size());
				%>
				<%
					}
				%>
			</tr>
			<%
				}
			%>
		</table>
		<h1 style="margin-left: 41.5%;">
			<input type="button" value="저장하기" href="main.jsp" onclick="alert('저장완료!')">
			<input type="button" value="뒤로가기" onclick="history.back()">
		</h1>
		
	</div>
	
		<script>
 		
		
		var num;
		let p = document.querySelector('#starTxt'+num);

	
 		$('div.caption').off('click').on('click', function() { 
			
			console.log($(this).attr("id"))
			var click = $(this).attr("id");
			var tmp = click.split("caption");
			num = tmp[1];
			console.log("num값 출력 : "+num);
			//var click = $('h3').attr("id");
			//var click = $('fieldset').attr("class");
			//console.log(click);
			
			/* var name = $("#movieNm").html();
			console.log(name); */
			/* var movie0 = document.getElementsByClassName('movieNm1')[0].getAttribute('id');
			var movie1 = document.getElementsByClassName('movieNm1')[1].getAttribute('id');
		
			 */
		/* 	
			console.log(movie1);
		 */
	
			var str = document.getElementsByName("rating");
			
			for (var i = 0; i < str.length; i++) {
				if (str[i].checked == true) {
					
					//alert(str[i].value);
					var star = str[i].value;
					console.log("점수"+star);
					//p.innerHTML = `<h1>나오나확인</h1>`;
					//p.innerHTML = `<h1>${str[i].value}</h1>`;
					
					$('#starTxt'+num).html(star);
					//$('#starTxt').html('<h1>'+star+'</h1>');
					
					var name = $("#movieNm"+num).html();
					console.log("영화 이름 : "+name);
			
			
					
					$.ajax({
						type : "GET",
						url : "StarRatingService.do",
						data : {
							starRating : star,
							movieNm : name
						},
						dataType: "json",
						success : function(data){
							//alert("성공"+data);
						},
						error : function (e) {
							//alert("실패"+e);
						
						}
					})
					
				}
			}
			//alert($('input[type=radio]'));
		
			
		})
	
	</script>
	

</body>
</html>