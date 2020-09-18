package data;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;

import com.DAO.MemberDAO;

public class setMember {

	public static void main(String[] args) {
		ArrayList<String[]> list = run("C:\\Users\\SMT005\\Desktop\\��ȭ����.csv", "euc-kr");
		MemberDAO dao = new MemberDAO();
		
		for (int i = 0; i < list.size(); i++) {
			try {
				Thread.sleep(2000);
				int cnt = dao.setMember(list.get(i)[0]);
				if(cnt>0) {
					System.out.println("ȸ�� �ֱ� ����");
				}else {
					System.out.println("ȸ�� �ֱ� ����");
				}			
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		

	}

	 private static  ArrayList<String[]> run(String path, String encoding) {
	        BufferedReader br = null;
	        String line;
	        String cvsSplitBy = ",";
	        ArrayList<String[]> list = new ArrayList<String[]>();

	        try {
	            br = new BufferedReader(new InputStreamReader(new FileInputStream(path), encoding));
	            while ((line = br.readLine()) != null) {
	            	 String[] field = line.split(cvsSplitBy);
	            	 list.add(field);
	               //System.out.println(field);
	               
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
	        //csv ���� ���
	        String[] temp = new String[11];
			for (int i = 1; i < list.size(); i++) {
				//for (int j = 0; j < list.get(i).length; j++) {
				
					System.out.print(list.get(i)[0]+"\t");				
				//}
					System.out.println();			
			}
			return list;
	 }
}
