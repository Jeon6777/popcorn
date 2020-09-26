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
import com.front.Command;
import com.sun.corba.se.pept.transport.Connection;

public class JoinService implements Command{


	@Override
	public String execut(HttpServletRequest request, HttpServletResponse response) {
		//회원가입
			
				
				String id = request.getParameter("id");
				String pw = request.getParameter("pw");
				String nick = request.getParameter("nick");
				String[] genre = request.getParameterValues("genre");
				String genres = "";
				if(genres!=null) {
					for (int i = 0; i < genre.length; i++) {
						genres += genre[i];
						if(i < genre.length-1) {
							genres += "|";				
						}
					}
				}
				System.out.println("id : "+ id);
				System.out.println("pw : "+ pw);
				System.out.println("nick : "+ nick);
				System.out.println("genre : "+ genre);
				
				MemberDTO dto = new MemberDTO(id, pw, nick, genres);
				MemberDAO dao = new MemberDAO();
				int cnt = dao.Join(dto);
				
				if(cnt>0) {
					System.out.println("회원가입 성공");
				}else {
					System.out.println("회원가입 실패");
				}
				
				
				return "main.jsp";
	}

	

	

}
