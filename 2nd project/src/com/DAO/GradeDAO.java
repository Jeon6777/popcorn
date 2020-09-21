package com.DAO;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.DTO.GradeDTO;
import com.DTO.MovieDTO;

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

	private void close() { // �ݱ�
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

	// ���� �Ű���� �ȸŰ���� Ȯ�� ��� dto ==null : insert / !=null : update
	public GradeDTO checkGrade(GradeDTO dto) {
		getConn();
		GradeDTO search_dto = null;
		String sql = "select grade_no, grade from movie_grade where movienm like ? and id like ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, dto.getMovieNm());
			pst.setString(2, dto.getId());
			rs = pst.executeQuery();
			if (rs.next()) { // ������ ���� �ϴ� ���
				int grade_no = rs.getInt(1);
				float grade = rs.getFloat(2);
				search_dto = new GradeDTO(grade_no, dto.getId(), dto.getMovieNm(), grade);

				System.out.println("DB ���� : " + grade);

			}else {
				search_dto = null;
				System.out.println("���� �������� ����");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return search_dto;
	}

	public int setGrade(GradeDTO dto) {// ��ȭ ���� �ۼ� DB�� ����
		getConn();
		GradeDTO search_dto = checkGrade(dto);
		String sql = "";
		try {
			// ������ ���� ���
			if (search_dto == null) {
				sql = "insert into movie_grade values(grade_seq.nextval, ?, ?, ?)";
				pst = conn.prepareStatement(sql);
				pst.setString(1, dto.getId());
				pst.setString(2, dto.getMovieNm());
				pst.setFloat(3, dto.getGrade());
				
			} else { // ������ �ִ� ���
//				System.out.println("���� �ִ°�� ���� : " + dto.getGrade());
//				System.out.println("���̵�"+dto.getId());
//				System.out.println("���� �̸� "+dto.getMovieNm());
				
				sql = "update movie_grade set grade = ? where movienm like ? and id like ?";
								
				pst = conn.prepareStatement(sql);
				pst.setFloat(1, dto.getGrade());
				pst.setString(2, dto.getMovieNm());
				pst.setString(3, dto.getId());
			}

			cnt = pst.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	
	}
	
	public ArrayList<GradeDTO> getGrade(String id) { // ���� �������� , id�� movienm dto�� ��������
		
		ArrayList<GradeDTO> list = new ArrayList<GradeDTO>();
		
		getConn();
		
		String sql = "select movieNm,grade from movie_grade where id = ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, id);
			rs = pst.executeQuery();
			while(rs.next()) {
				String movieNm = rs.getString(1);
				float grade = rs.getFloat(2);
				GradeDTO dto = new GradeDTO(movieNm, grade);
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}return list;
		
	}
}