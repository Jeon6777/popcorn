package com.DAO;

import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

public class MovieDAO {
	Connection conn = null;
	PreparedStatement pst = null;
	ResultSet rs = null;
	int cnt = 0;
	
	
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
			String img_name = URLEncoder.encode(movieNm, "EUC-KR");
			pst = conn.prepareStatement(sql);
			
			pst.setString(1, img_name+".jpg");
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
	
	//검색시 해당 문자가 포함된 영화 이름 모두 반환
	public ArrayList<String> search_movieNm(String search) {
		getConn();
		ArrayList<String> list = new ArrayList<String>();
		String sql = "select movienm from movie where movienm like ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, search);
			rs = pst.executeQuery();
			while(rs.next()) {
				String movieNm = rs.getString(1);
				list.add(movieNm);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}return list;
		
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
