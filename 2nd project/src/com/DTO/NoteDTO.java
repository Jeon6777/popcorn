package com.DTO;

public class NoteDTO {
	
	private int note_no;
	private String id;
	private String movieNm;
	private String note;
	
	
	
	public NoteDTO(String id,String movieNm, String note) {
		this.id = id;
		this.movieNm = movieNm;
		this.note = note;
	}
	
	public int getNote_no() {
		return note_no;
	}
	public void setNote_no(int note_no) {
		this.note_no = note_no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getMovieNm() {
		return movieNm;
	}
	public void setMovieNm(String movieNm) {
		this.movieNm = movieNm;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	
	

}
