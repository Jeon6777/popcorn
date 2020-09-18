package com.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.DTO.NoteDTO;

public class NoteDAO {
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

	//id, ��ȭ�̸�, ������ dto�� ��� �Ű�����
	public int setNote(NoteDTO dto) { // ������ �Է� �Լ�
		getConn();
		String sql = "insert into movie_note values(note_seq.nextval, ?, ?, ?)";
		try {
			System.out.println("id"+dto.getId());
			System.out.println("movie"+dto.getMovieNm());
			System.out.println("note"+dto.getNote());
			pst = conn.prepareStatement(sql);
			pst.setString(1, dto.getId());
			pst.setString(2, dto.getMovieNm());
			pst.setString(3, dto.getNote());
			
			cnt = pst.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return cnt;
	}

	//��ȭ�̸� �޾ƿͼ� ������ ���
	public ArrayList<String[]> getNote(String movieNm) {
		getConn();
		ArrayList<String[]> list  = new ArrayList<String[]>();
		String sql = "select id, note from movie_note where movienm like ?";
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, movieNm);
			rs = pst.executeQuery();
			while(rs.next()) {
				String id = rs.getString(1);
				String note  = rs.getString(2);
				String[] arr = new String[2];
				arr[0] = id;
				arr[1] = note;
				list.add(arr);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}return list;
		
	}
	

}
