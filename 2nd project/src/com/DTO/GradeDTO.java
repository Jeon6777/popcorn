package com.DTO;

public class GradeDTO {
	
	//no, id, movienm, grade, note
	private int no;	//���� ��ȣ ������ ���
	private String id;	//ȸ�� ID
	private String movieNm;	//��ȭ �̸�
	private float grade;	//��ȭ ����
	private String note;	//��ȭ ������
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
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
	public float getGrade() {
		return grade;
	}
	public void setGrade(float grade) {
		this.grade = grade;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	

}
