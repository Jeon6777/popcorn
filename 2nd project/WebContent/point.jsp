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
<style>
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

.star-input>.input, .star-input>.input>label:hover, .star-input>.input>input:focus+label,
	.star-input>.input>input:checked+label {
	display: inline-block;
	vertical-align: middle;
	background: url('img/grade_img.png') no-repeat;
}

.star-input{
	display: inline-block;
	white-space: nowrap;
	width: 225px;
	height: 40px;
	padding: 25px;
	line-height: 30px;
}

.star-input>.input {
	display: inline-block;
	width: 150px;
	background-size: 150px;
	height: 28px;
	white-space: nowrap;
	overflow: hidden;
	position: relative;
}

.star-input>.input>input {
	position: absolute;
	width: 1px;
	height: 1px;
	opacity: 0;
}

star-input>.input.focus {
	outline: 1px dotted #ddd;
}

.star-input>.input>label {
	width: 30px;
	height: 0;
	padding: 28px 0 0 0;
	overflow: hidden;
	float: left;
	cursor: pointer;
	position: absolute;
	top: 0;
	left: 0;
}

.star-input>.input>label:hover, .star-input>.input>input:focus+label,
	.star-input>.input>input:checked+label {
	background-size: 150px;
	background-position: 0 bottom;
}

.star-input>.input>label:hover ~label {
	background-image: none;
}

.star-input>.input>label[for="p1"] {
	width: 30px;
	z-index: 5;
}

.star-input>.input>label[for="p2"] {
	width: 60px;
	z-index: 4;
}

.star-input>.input>label[for="p3"] {
	width: 90px;
	z-index: 3;
}

.star-input>.input>label[for="p4"] {
	width: 120px;
	z-index: 2;
}

.star-input>.input>label[for="p5"] {
	width: 150px;
	z-index: 1;
}

.star-input>output {
	display: inline-block;
	width: 60px;
	font-size: 18px;
	text-align: right;
	vertical-align: middle;
}
</style>
</head>
<body>


	<%
		MovieDAO dao = new MovieDAO();
	ArrayList<String> list = dao.movieNmAll("movie");
	%>
	<h1 style = "text-align: center">영화에 평점을 입력하세요</h1>
	<div>
		<table>
			<%
				int a = 0;
			for (int j = 0; j < list.size()/4; j++) {
			%>
			<tr>
				<%
					for (int i = 0; i < 4; i++) {
				%>
				<td>
					<div class="row">
						<div class="col-sm-6 col-md-4" style="width: 80%">
							<div class="thumbnail">
								<a href="img/<%=list.get(a)%>.jpg">
								<img src="img/<%=list.get(a)%>.jpg" alt="movie">
								</a>
								<div class="caption">
									<h3><%=list.get(a)%></h3>
									<p><%=list.get(a)%></p>
									<span class="star-input">
										<span class="input">
											<input type="radio" name="star-input" value="1" id="p1">
											<label for="p1">1</label>
											<input type="radio" name="star-input" value="2" id="p2">
											<label for="p2">2</label>
											<input type="radio" name="star-input" value="3" id="p3">
											<label for="p3">3</label>
											<input type="radio" name="star-input" value="4" id="p4">
											<label for="p4">4</label>
											<input type="radio" name="star-input" value="5" id="p5">
											<label for="p5">5</label>
										</span>
										<output for="star-input">
										<b>0</b>점
										</output>
									</span>
								</div>
							</div>
						</div>
					</div>
				</td>
				<%
					if (a < list.size()) {
					a++;
				}
				%>
				<%
					}
				%>
			</tr>
			<%
				}
			%>
		</table>
	</div>

		<script src="js/jquery-1.11.3.min.js"></script>
		<script src="js/star.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
</body>
</html>