package com.front;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cont.JoinService;
import com.cont.LoginService;
import com.cont.LogoutService;
import com.cont.StarRatingService;
import com.cont.UpdateService;
import com.cont.UploadScreenService;
import com.DAO.MemberDAO;
import com.DAO.MovieDAO;
import com.DAO.GradeDAO;
import com.DAO.NoteDAO;
import com.DTO.MemberDTO;
import com.DTO.GradeDTO;
import com.DTO.MovieDTO;
import com.DTO.NoteDTO;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private HashMap<String, Command> map;
	
	
	
	@Override
	public void init() throws ServletException {
		
		map = new HashMap<String, Command>();
		map.put("JoinService.do",new JoinService());
		map.put("LogoutService.do",new LogoutService());
		map.put("UpdateService.do",new UpdateService());
		map.put("LoginService.do",new LoginService());
		map.put("StarRatingService.do", new StarRatingService());
		map.put("UploadScreenService.do", new UploadScreenService());
	}



	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		System.out.println("프론트 컨드롤러 실행");
	
		String requestURI =  request.getRequestURI();
		String contextPath = request.getContextPath();
		
		String resultURL = requestURI.substring(contextPath.length()+1);
		System.out.println(resultURL);
		
		request.setCharacterEncoding("EUC-KR");
		
		Command command = map.get(resultURL);
		
		
		String moveURL = command.execut(request,response);
		response.sendRedirect(moveURL);
		
		
		
		
		
		
	}
}
