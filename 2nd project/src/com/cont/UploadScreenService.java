package com.cont;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.GradeDAO;
import com.DAO.MovieDAO;
import com.DTO.GradeDTO;
import com.DTO.MemberDTO;
import com.DTO.MovieDTO;
import com.front.Command;

public class UploadScreenService implements Command{
	private static ArrayList<String[]> run(String path, String encoding) {
		BufferedReader br = null;
		String line;
		String cvsSplitBy = ",";
		ArrayList<String[]> list = new ArrayList<String[]>();

		try {
			br = new BufferedReader(new InputStreamReader(new FileInputStream(path), encoding));
			while ((line = br.readLine()) != null) {
				String[] field = line.split(cvsSplitBy);
				list.add(field);

			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (br != null) {
				try {
					br.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		// csv 파일 출력
		String[] temp = new String[11];
		for (int i = 0; i < list.size(); i++) {
			for (int j = 0; j < list.get(i).length; j++) {
				System.out.print(list.get(i)[j] + "\t");
			}
			System.out.println();
		}
		return list;
	}

	@Override
	public String execut(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		MemberDTO info = (MemberDTO)session.getAttribute("info");

		ArrayList<String[]> list = run("C:/Users/SMT012/Downloads/data.csv", "UTF-8");
		
		try {
			System.out.println("영화갯수: "+list.size());
			for (int i = 0; i <list.size(); i++) {
				//나중에 할일
				//값이 null값이여도 컬럼갯수가 5개 인데, 애니매이션 6,7,8번 같은 경우 null값이여도 컬럼갯수가 3개 밖에 아님
				System.out.println(i+1+"번째 영화컬럼갯수: "+list.get(i).length);			
	
				String movieNm = list.get(i)[0];
				String directors= null;
				String genres = list.get(i)[2];
				String actors = null;
				String openDt = null;
				
					if(list.get(i)[1]==null) {
						directors = "";
					}else {
						directors = list.get(i)[1];
					}
					System.out.println("감독 : "+directors);
					if(list.get(i)[3]==null) {
						actors = "";
					}else {
						actors = list.get(i)[3];
					}
					if(list.get(i)[4]==null) {
						openDt = "";
					}else {
						openDt = list.get(i)[4];
					}
					System.out.println("영화이름 : "+movieNm);
					System.out.println("장르 : "+genres);
					System.out.println("배우 : "+actors);
					System.out.println("개봉날짜  : "+openDt);
					
					MovieDAO dao = new MovieDAO();
					MovieDTO dto = new MovieDTO(movieNm, directors, genres, actors, openDt, movieNm+".jpg");
					Thread.sleep(1000);
					int cnt = dao.uploadScreen(dto,i+1);

					if(cnt>0) {
						System.out.println("상영작 넣기 성공!");
					}else {
						System.out.println("상영작 넣기 실패");
					}
				}					
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return "admin.jsp";
	}


}
