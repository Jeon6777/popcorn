package data;

import java.util.ArrayList;

import com.DAO.MovieDAO;

public class setImg {

	public static void main(String[] args) throws InterruptedException {
		MovieDAO dao = new MovieDAO();
		ArrayList<String> movieNm = new ArrayList<String>();
		movieNm  = dao.movieNmAll("screen");
		
		for (int i = 0; i < movieNm.size(); i++) {
			Thread.sleep(500);
			dao.update_img("screen", movieNm.get(i));
			
		}
		
		Thread.sleep(2000);
		movieNm  = dao.movieNmAll("movie");
		
		for (int i = 0; i < movieNm.size(); i++) {
			Thread.sleep(2000);
			dao.update_img("movie", movieNm.get(i));
			
		}

	}

}
