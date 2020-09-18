package com.cont;

import java.io.IOException;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.DAO.MemberDAO;
import com.DTO.MemberDTO;
import com.sun.corba.se.pept.transport.Connection;

@WebServlet("/JoinService")
public class JoinService extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String nick = request.getParameter("nick");
		String genre = request.getParameter("genre");
		
		
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = new MemberDTO(id, pw, nick, genre);
		int cnt = dao.Join(dto);
			
		if(cnt>0) {
			response.sendRedirect("index.jsp");
		}else {
			System.out.println("가입실패");
			response.sendRedirect("index.jsp");
		}
		
		
	}
	
	
	

}
