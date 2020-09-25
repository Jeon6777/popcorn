<%@page import="com.DAO.NoteDAO"%>
<%@page import="com.DTO.GradeDTO"%>
<%@page import="com.DAO.GradeDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.DAO.MovieDAO"%>
<%@page import="java.util.Random"%>
<%@page import="com.DTO.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>����������</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="assets/css/main.css" />
<script src="js/jquery-3.5.1.min.js"></script>

</head>
<body class="subpage">
	<%
		MemberDTO info = (MemberDTO) session.getAttribute("info");
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
			<li><a href="main.jsp">����</a></li>
			<li><a href="Taste.jsp">���ϱ�</a></li>
		</ul>
	</nav>

	<!-- Main -->
<section class="wrapper style1">
	<div id="main">

		<!-- One -->
			<div class="inner">
				<header class="align-center">
					<h3><%=info.getNick()%>
						�� ȯ���մϴ�!
					</h3>
				</header>
				<img alt="" src="img/memberinfo.png" style="margin-left: 170px">
				<div class="box">
					<form method="post" action="UpdateService.do">
						<h4>
							ID :
							<%=info.getId()%></h4>
						<h5>��й�ȣ ����</h5>
						<div class="6u$ 12u$(xsmall)">
							<input type="password" name="pw" id="pw" class="pw" placeholder="�� ��й�ȣ">
						</div>
						<div class="6u$ 12u$(xsmall)">
							<input type="password" name="pw_Check" id="pw_Check" class="pw" placeholder="�� ��й�ȣ Ȯ��" style="margin-bottom: 0px;">
							 <span id="alert-danger" style="display: none; color: #d92742; font-size: 13px; "> ! ��й�ȣ�� ��ġ���� �ʽ��ϴ�.</span>
						</div>
						<br>
						<h5>�г���</h5>
						<div class="6u$ 12u$(xsmall)">
							<input type="text" name="nick" id="nick"
								value=<%=info.getNick()%>>
						</div>
						<br>
						<h5>�����ϴ� �帣</h5>
						<%
							String genre = info.getGenre();
						System.out.println("�帣 : " + genre);
						String[] genres = genre.split("|");
						for (int i = 0; i < genres.length; i++) {
							System.out.println("������ | �� �ڸ��� : " + genres[i]);
						}
						%>
						<table>
							<tr>
								<%
									String[] genreList = { "�׼�", "SF", "�ڹ̵�", "���", "������", "����", "������", "����", "����", "�̽��͸�", "����", "��Ÿ��", "���/�θǽ�", "����",
										"��ť���͸�", "���", "�ִϸ��̼�", "��庥ó" };

								for (int i = 0; i < genreList.length; i++) {
									if(genre.contains(genreList[i])){%>
								<input id="cb<%=i%>" name="genre" type="checkbox"
									value="<%=genreList[i]%>" checked="checked">
								<label for="cb<%=i%>"><%=genreList[i]%></label>
									<%}else{%>
								<input id="cb<%=i%>" name="genre" type="checkbox"
									value="<%=genreList[i]%>">
								<label for="cb<%=i%>"><%=genreList[i]%></label>
								<%
									}
									}
								%>
							</tr>
						</table>
				</div>
				<input style="margin-left: 270px;" type="submit" value="ȸ�� ���� ����"
					class="button special fit"> <input type="button"
					value="�ڷΰ���" onclick="history.back(-1);" class="button special fit">
		</form>
	 <hr>
		   <!-- Three -->
      
         <header class="align-center">
            <h2 class="h2_1" style="text-align: center">���� ������</h2>
         </header>
         <div class="inner">
            <div class="tb_wrap">
               <div class="tb_box">
                  <table class="tb">


                     <tr class="fixed_top">
                        <th class="cell1 cross" scope="col">��ȭ ����</th>
                        <th class="cell2" scope="col">������</th>
                     </tr>
                     <%
                        NoteDAO dao = new NoteDAO();
                     ArrayList<String[]> noteList = dao.getMyNote(info);
                     for (int i = 0; i < noteList.size(); i++) {
                     %>
                     <tr>
                        <th class="cell1 fixed_col" scope="row"><%=noteList.get(i)[0]%></th>
                        <td class="cell2"><%=noteList.get(i)[1]%></td>
                     </tr>
                     <%
                        }
                     %>
                  </table>
               </div>
            </div>
         </div>
      

   </div>
		
		

	</div>
	<!-- Footer -->
	<header class="align-center">
		<h2 class="h2_1" style="text-align: center">���� ���� ��ȭ</h2>
	</header>
	<footer id="footer">
	<div style="width:100%; height:520px; overflow:auto">
		<table>
			<tr>
				<%
					int a = 0;
				GradeDAO dao1 = new GradeDAO();
				ArrayList<GradeDTO> list = dao1.getGrade(info.getId());
				for (int j = 0; j < list.size(); j++) {

					String print = "";
				%>
				<td>
					<div class="row" style="width: 80%;">
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
									alt="movie" style="width: 280px; height: 400px;">
								</a>
								<div>
									<h2 style="text-align: center"><%=list.get(a).getMovieNm()%></h2>
									<h3 style="text-align: center"><%=list.get(a).getGrade()%>��
									</h3>
								</div>
							</div>
						</div>
					</div>
				</td>
				<%
					if ((a + 1) % 4 == 0) {
					System.out.println("<tr>����");
				%>
			</tr>
			<tr>
				<%
					}
				a++;
				}
				%>

			</tr>
		</table>
	</div>
</footer>
</section>
<a href="#" title="Back to Top" style="display:scroll;position:fixed;bottom:30px;right:10px; z-index: 10003;" onfocus='this.blur()'>
<img src="img/top.png" style="width:100px; height:100px; border-radius: 15px;"/></a>
	<!-- Scripts -->
	<script src="assets/js/scroll.js"></script>
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.poptrox.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/skel.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
	<script>
    $('.pw').focusout(function () {
        var pwd1 = $("#pw").val();
        var pwd2 = $("#pw_Check").val();
 
        if ( pwd1 != '' && pwd2 == '' ) {
            null;
        } else if (pwd1 != "" || pwd2 != "") {
            if (pwd1 == pwd2) {
                $("#alert-danger").css('display', 'none');
            } else {
                $("#alert-danger").css('display', 'inline');
            }
        }
    }); 
	</script>

</body>
</html>