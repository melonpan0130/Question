package com.example.project.model.dto;

import java.util.Date;

public class ReplyVO {
	private int bno;
	private int rno;
	private String replyer;
	private String userName;
	private Date regdate;
	private String replytext;
	private boolean secret;
	
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public String getReplyer() {
		return replyer;
	}
	public void setReplyer(String replyer) {
		this.replyer = replyer;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getReplytext() {
		return replytext;
	}
	public void setReplytext(String replyText) {
		this.replytext = replyText;
	}
	public boolean isSecret() {
		return secret;
	}
	public void setSecret(boolean secret) {
		this.secret = secret;
	}
	
}
