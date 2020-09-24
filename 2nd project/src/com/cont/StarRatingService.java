package com.cont;


import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.GradeDAO;
import com.DTO.GradeDTO;
import com.DTO.MemberDTO;
import com.front.Command;


public class StarRatingService implements Command {
	@Override
	public String execut(HttpServletRequest request, HttpServletResponse response) {
		
		
		try {
			request.setCharacterEncoding("EUC-KR");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println("���� �ֱ� ���� ����");
		HttpSession session = request.getSession();
		MemberDTO info = (MemberDTO) session.getAttribute("info");

		float grade = Float.valueOf(request.getParameter("starRating"));
		String movieNm = request.getParameter("movieNm");
		System.out.println("���� �ֱ� �������� ��� : " + grade);
		System.out.println("���� �ֱ� �������� ��� : " + movieNm);
		
		 GradeDAO grade_dao = new GradeDAO();
		 //info.getId()
		GradeDTO grade_dto = new GradeDTO(info.getId(), movieNm, grade);
		 
		
		int cnt = grade_dao.setGrade(grade_dto);
		
		if(cnt>0) {
			System.out.println("id : "+ info.getId());
			System.out.println("���� ���强��");
		}else {
			System.out.println("id : "+ info.getId());
			System.out.println("���� �������");
		}
		
		return null;

	}

}
