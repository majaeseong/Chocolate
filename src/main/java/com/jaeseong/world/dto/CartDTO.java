package com.jaeseong.world.dto;

public class CartDTO {
	private int id, productid,amount,cheory;
	private String memid;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getProductid() {
		return productid;
	}
	public void setProductid(int productid) {
		this.productid = productid;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getCheory() {
		return cheory;
	}
	public void setCheory(int cheory) {
		this.cheory = cheory;
	}
	public String getMemid() {
		return memid;
	}
	public void setMemid(String memid) {
		this.memid = memid;
	}
	
	
}
