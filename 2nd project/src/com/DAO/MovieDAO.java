package com.DAO;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Properties;

public class MovieDAO {
	Connection conn = null;
	PreparedStatement pst = null;
	ResultSet rs = null;
	int cnt = 0;
	

	
	private void getConn(){ //����
		try {
			InputStream in = getClass().getResourceAsStream("../../../../db.properties");
			//�ܺ� ������ �о�鿩���� �ڵ� (DAO.class������ ��������)
			Properties p = new Properties();
			//PropertiesȮ���� ������ �б� ���ؼ� ��ü ����
			p.load(in);
			//�о�鿩�� ������ Properties��ü�� �ε�
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

	private void close() {	//�ݱ�
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
