package data;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;

import com.DAO.GradeDAO;
import com.DAO.MemberDAO;
import com.DTO.GradeDTO;

public class setGrade {

	public static void main(String[] args) {
		GradeDAO dao = new GradeDAO();
		//1, '1000','����',4.5);
//		GradeDTO dto1 = new GradeDTO("1000", "����", 3.5f);
//		GradeDTO dto1 = new GradeDTO("1001", "����", 5);
//		int cnt = dao.setGrade(dto1);
//		if(cnt>0) {
//			System.out.println("���� �ֱ� ����");
//		}else {
//			System.out.println("���� �ֱ� ����");
//		}
		//dao.checkGrade(dto1);
		
		
		ArrayList<String[]> list = run("C:/Users/SMT058/Desktop/��ȭ����.csv", "euc-kr");
		
			try {
				for (int i = 1; i <list.size(); i++) {
					String id = i+"";
					for (int j = 1; j < list.get(i).length; j++) {
						String movieNm = list.get(0)[j];
						float grade = Integer.parseInt(list.get(i)[j]);
						//System.out.println("set������� : "+grade);
						GradeDTO dto = new GradeDTO(id, movieNm, grade);
						Thread.sleep(1000);
						int cnt = dao.setGrade(dto);
						if(cnt>0) {
							System.out.println("���� �ֱ� ����!");
						}else {
							System.out.println("���� �ֱ� ����");
						}
					}
				}
			}catch (Exception e) {
				e.printStackTrace();
			}
	}

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
				// System.out.println(field);

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
		// csv ���� ���
		String[] temp = new String[11];
		for (int i = 0; i < list.size(); i++) {
			for (int j = 0; j < list.get(i).length; j++) {

				System.out.print(list.get(i)[j] + "\t");
			}
			System.out.println();
		}
		return list;
	}

}
