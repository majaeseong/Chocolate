package com.jaeseong.world.dto;

import java.sql.Timestamp;

public class QnaDTO {
	private int id,repyn;
	private String memid, title, content, reply;
	private Timestamp regtime;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getRepyn() {
		return repyn;
	}
	public void setRepyn(int repyn) {
		this.repyn = repyn;
	}
	public String getMemid() {
		return memid;
	}
	public void setMemid(String memid) {
		this.memid = memid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	public Timestamp getRegtime() {
		return regtime;
	}
	public void setRegtime(Timestamp regtime) {
		this.regtime = regtime;
	}
	
	
	
}
