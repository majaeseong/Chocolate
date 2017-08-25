package com.jaeseong.world.dto;

import java.sql.Timestamp;

public class OrderViewDTO {
	private int id, price, cheory;
	private String name, memid,addr;
	private Timestamp ordertime;
	
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getMemid() {
		return memid;
	}
	public void setMemid(String memid) {
		this.memid = memid;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Timestamp getOrdertime() {
		return ordertime;
	}
	public void setOrdertime(Timestamp ordertime) {
		this.ordertime = ordertime;
	}
	public int getCheory() {
		return cheory;
	}
	public void setCheory(int cheory) {
		this.cheory = cheory;
	}
	
	
	
}
