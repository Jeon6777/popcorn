package com.DAO;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.DTO.MemberDTO;

public class MemberDAO {
	Connection conn = null;
	PreparedStatement pst = null;
	ResultSet rs = null;
	int cnt = 0;

	private void getConn() { // ����
		try {
			InputStream in = getClass().getResourceAsStream("../../../../db.properties");
			// �ܺ� ������ �о�鿩���� �ڵ� (DAO.class������ ��������)
			Properties p = new Properties();
			// PropertiesȮ���� ������ �б� ���ؼ� ��ü ����
			p.load(in);
			// �о�鿩�� ������ Properties��ü�� �ε�
			Class.forName(p.getProperty("dbclass"));
			String url = p.getProperty("dburl");
			String dbid = p.getProperty("dbid");
			String dbpw = p.getProperty("dbpw");

			conn = DriverManager.getConnection(url, dbid, dbpw);
			if (conn != null) {
				System.out.println("���� ����");
			} else {
				System.out.println("���� ����");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void close() { // �ݱ�
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

	public int Join(MemberDTO dto) {

		try {
			getConn();

			String sql = "insert movie_member into values(?,?,?,?)"; // ���̺� �̸� �ۼ�
			pst = conn.prepareStatement(sql);

			pst.setString(1, dto.getId());
			pst.setString(2, dto.getPw());
			pst.setString(3, dto.getNick());
			pst.setString(4, dto.getGenre());

			cnt = pst.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	public MemberDTO login(MemberDTO dto) {

		MemberDTO rdto = null;

		try {

			getConn();

			String sql = "select * from movie_member where id = ? and pw = ?";   //��� ���̺� �ۼ�
			
			
			pst = conn.prepareStatement(sql);

			pst.setString(1, dto.getId());
			pst.setString(2, dto.getPw());

			rs = pst.executeQuery();

			if (rs.next()) {
				String id = rs.getString(1);
				String pw = rs.getString(2);
				String nick = rs.getString(3);
				String genre = rs.getString(4);

				rdto = new MemberDTO(id, pw, nick, genre);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return rdto;
	}

	public int update(MemberDTO dto) {
		int cnt = 0;

		getConn();

		String sql = "update movie_member set pw = ?, nick = ?, genre = ? where id = ?"; // ��� ���̺� �ۼ�

		try {
			pst = conn.prepareStatement(sql);

			pst.setString(1, dto.getPw());
			pst.setString(2, dto.getNick());
			pst.setString(3, dto.getGenre());
			pst.setString(4, dto.getId());

			cnt = pst.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return cnt;
	}

}