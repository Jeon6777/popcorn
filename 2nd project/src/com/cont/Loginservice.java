package com.cont;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.MemberDAO;
import com.DTO.MemberDTO;

@WebServlet("/Loginservice")
public class Loginservice extends HttpServlet{
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
	
		
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = new MemberDTO(id, pw);
		
		MemberDTO info =  dao.login(dto);
		System.out.println("id"+id);
		System.out.println("pw"+pw);
		
		if(info != null) {
			System.out.println("�α��� ����");
			// �α��� ������ id ����  server �� ������ session �� �����Ѵ�
			HttpSession session = request.getSession();
			//session �����ֱ�
			session.setAttribute("id", id);
			response.sendRedirect("index.jsp");
		}else {
			System.out.println("�α��ν���");
			response.sendRedirect("index.jsp");
		}
		
		
	}
	
	

}
