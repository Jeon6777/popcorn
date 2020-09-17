package com.DTO;

public class MemberDTO {
	//id, pw, nick, genre
	private String id;	//사용자 ID
	private String pw;	//PW
	private String nick;	//Nick Name
	private String genre;	//사용자 취향 : 장르
	
	
	public MemberDTO(String id, String pw, String nick, String genre) {
		this.id = id;
		this.pw = pw;
		this.nick = nick;
		this.genre = genre;
	}
	
	
	public MemberDTO(String id, String pw) {
		this.id = id;
		this.pw = pw;
	}


	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getNick() {
		return nick;
	}
	public void setNick(String nick) {
		this.nick = nick;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	
	
	
}
