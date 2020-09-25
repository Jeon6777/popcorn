package com.DAO;

import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.DTO.MovieDTO;

public class MovieDAO {
	Connection conn = null;
	PreparedStatement pst = null;
	ResultSet rs = null;
	int cnt = 0;
	
	//전체 MovieDTO 리스트
	public ArrayList<MovieDTO> allMovie(String DB_tableName) {
		ArrayList<MovieDTO> list = new ArrayList<MovieDTO>();
		getConn();
		String sql = "select * from "+DB_tableName;
		try {
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			while(rs.next()) {
				
				int no = rs.getInt(1);
				String movieNm = rs.getString(2);
				String director = rs.getString(3);
				String genre = rs.getString(4);
				String actor = rs.getString(5);
				String opendt = rs.getString(6);
				String img = rs.getString(7);
				
				MovieDTO dto = new MovieDTO(no, movieNm, director, genre, actor, opendt, img);
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		return list;
	}
	
	
	//테이블명 입력시(상영작 screen, 영화 movie) 영화이름 전체출력
	
	
	public ArrayList<String> movieNmAll(String DB_tableName) {
		ArrayList<String> name = new ArrayList<String>();
		getConn();
		String sql = "select movieNm from "+DB_tableName;
		try {
			pst = conn.prepareStatement(sql);
			rs = pst.executeQuery();
			while(rs.next()) {
				String movieNm = rs.getString(1);
				name.add(movieNm);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		return name;
	}
	
	public int update_img(String DB_tableName, String movieNm){ //영화 이름 입력시 이미지 업로드
		getConn();
		String sql = "update "+DB_tableName+" set img = ? where img is null and movieNm Like ?";
		try {
			//String img_name = URLEncoder.encode(movieNm, "EUC-KR");
			pst = conn.prepareStatement(sql);
			
			pst.setString(1, movieNm+".jpg");
			pst.setString(2, movieNm);
			
			cnt = pst.executeUpdate();
			if(cnt>0) {
				System.out.println("이미지 넣기 성공");
			}else {
				System.out.println("이미지 넣기 실패");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		return cnt;
		
	}
	//관리자 기능에서 csv파일 업로드시 상영작 DB변경
	public int uploadScreen(MovieDTO dto,int no) {
		getConn();
		String sql = "update screen set movienm=?,director=?,genre=?,actor=?,opendt=?,img=? where movie_no=?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, dto.getMovieNm());
			pst.setString(2, dto.getDirector());
			pst.setString(3, dto.getGenre());
			pst.setString(4, dto.getActor());
			pst.setString(5, dto.getOpendt());
			pst.setString(6, dto.getImg());
			pst.setInt(7, no);
			
			cnt = pst.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		
		return cnt;
	}
	
	private void getConn() {
		String url = "jdbc:oracle:thin:@127.0.0.1:1521:xe";
		String dbid = "hr";
		String dbpw = "hr";

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, dbid, dbpw);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}


	private void close() {	//닫기
		try {
			if (pst != null) {
				pst.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (Exception e2) {
			e2.printStackTrace();
		}
	}


}
