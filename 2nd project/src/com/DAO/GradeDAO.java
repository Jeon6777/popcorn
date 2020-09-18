package com.DAO;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.DTO.GradeDTO;

public class GradeDAO {
	Connection conn = null;
	PreparedStatement pst = null;
	ResultSet rs = null;
	int cnt = 0;

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

	private void close() { // 닫기
		try {
			if (pst != null) {
				pst.close();
			}
			if (rs != null) {
				rs.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (Exception e2) {
			e2.printStackTrace();
		}
	}

	// 평점 매겼는지 안매겼는지 확인 기능 dto ==null : insert / !=null : update
	public GradeDTO checkGrade(GradeDTO dto) {
		getConn();
		GradeDTO search_dto = null;
		String sql = "select grade_no, grade from movie_grade where movienm like ? and id like ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, dto.getMovieNm());
			pst.setString(2, dto.getId());
			rs = pst.executeQuery();
			if (rs.next()) { // 평점이 존재 하는 경우
				int grade_no = rs.getInt(1);
				float grade = rs.getFloat(2);
				search_dto = new GradeDTO(grade_no, dto.getId(), dto.getMovieNm(), grade);

				//System.out.println("DB 평점 : " + grade);

			}else {
				search_dto = null;
				//System.out.println("평점 존재하지 않음");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return search_dto;
	}

	public int setGrade(GradeDTO dto) {// 영화 평점 작성 DB에 저장
		getConn();
		GradeDTO search_dto = checkGrade(dto);
		String sql = "";
		try {
			// 평점이 없는 경우
			if (search_dto == null) {
				sql = "insert into movie_grade values(grade_seq.nextval, ?, ?, ?)";
				pst = conn.prepareStatement(sql);
				pst.setString(1, dto.getId());
				pst.setString(2, dto.getMovieNm());
				pst.setFloat(3, dto.getGrade());
				
			} else { // 평점이 있는 경우
//				System.out.println("평점 있는경우 점수 : " + dto.getGrade());
//				System.out.println("아이디"+dto.getId());
//				System.out.println("무비 이름 "+dto.getMovieNm());
				
				sql = "update movie_grade set grade = ? where movienm like ? and id like ?";
								
				pst = conn.prepareStatement(sql);
				pst.setFloat(1, dto.getGrade());
				pst.setString(2, dto.getMovieNm());
				pst.setString(3, dto.getId());
			}

			cnt = pst.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}
	
	public float getGrade(GradeDTO dto) { // 평점 가져오기 , id와 movienm dto로 가져오기
		getConn();
		float grade = 0;
		String sql = "select grade from movie_grade where id like ? and movienm like ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, dto.getId());
			pst.setString(2, dto.getMovieNm());
			rs = pst.executeQuery();
			if(rs.next()) {
				grade = rs.getFloat(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}return grade;
		
	}
}