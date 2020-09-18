package com.cont;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.front.Command;
import com.DAO.MemberDAO;
import com.DTO.MemberDTO;

public class UpdateService implements Command {

	@Override
	public String execut(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession();
		MemberDTO info = (MemberDTO)session.getAttribute("info");
 
		String id = info.getId();
		String pw = request.getParameter("pw");
		String nick = request.getParameter("nick");
		String genre = request.getParameter("genre");
		MemberDTO dto = new MemberDTO(id, pw, nick, genre);
		MemberDAO dao = new MemberDAO();
		int cnt =  dao.update(dto);
		
		if(cnt > 0) {
			System.out.println("ȸ������ ���� �Ϸ�!");
			session.setAttribute("info", dto);
		}else {
			System.out.println("ȸ������ ���� ����");
		}
		
		return "main.jsp";
	}

}
