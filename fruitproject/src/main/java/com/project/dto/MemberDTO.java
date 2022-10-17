package com.project.dto;

import org.apache.ibatis.type.Alias;

@Alias("member")
public class MemberDTO {
	private String id;
	private String pass;
	private String nick;
	private String email;
	
	public MemberDTO() {
	}

	public MemberDTO(String id, String pass, String nick, String email) {
		super();
		this.id = id;
		this.pass = pass;
		this.nick = nick;
		this.email = email;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "MemberDTO [id=" + id + ", pass=" + pass + ", nick=" + nick + ", email=" + email + "]";
	}
	
}
