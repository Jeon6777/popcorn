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
		//ȸ������
			
				
				String id = request.getParameter("id");
				String pw = request.getParameter("pw");
				String nick = request.getParameter("nick");
				String genre = request.getParameter("genre");
				
				MemberDTO dto = new MemberDTO(id, pw, nick, genre);
				
				MemberDAO dao = new MemberDAO();
				int cnt = dao.Join(dto);
				
				if(cnt>0) {
					System.out.println("ȸ������ ����");
				}else {
					System.out.println("ȸ������ ����");
				}
				
				
				return "index.jsp";
	}

	

	

}
