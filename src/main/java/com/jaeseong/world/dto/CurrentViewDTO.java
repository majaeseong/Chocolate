package com.jaeseong.world.dto;

import java.sql.Timestamp;

public class CurrentViewDTO {
	private String name, pimage;
	private int id, pid, price, amount, totalprice,cheory;
	private Timestamp ordertime;
	
	public String getPimage() {
		return pimage;
	}
	public void setPimage(String pimage) {
		this.pimage = pimage;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(int totalprice) {
		this.totalprice = totalprice;
	}
	public int getCheory() {
		return cheory;
	}
	public void setCheory(int cheory) {
		this.cheory = cheory;
	}
	public Timestamp getOrdertime() {
		return ordertime;
	}
	public void setOrdertime(Timestamp ordertime) {
		this.ordertime = ordertime;
	}
	
	
}
