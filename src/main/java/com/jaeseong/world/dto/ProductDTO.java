package com.jaeseong.world.dto;

import java.sql.Timestamp;

public class ProductDTO {
	private String name,content,image;
	private int id,useyn,hityn,price,total,sold,remain,category;
	private Timestamp regtime;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUseyn() {
		return useyn;
	}
	public void setUseyn(int useyn) {
		this.useyn = useyn;
	}
	public int getHityn() {
		return hityn;
	}
	public void setHityn(int hityn) {
		this.hityn = hityn;
	}
	public Timestamp getRegtime() {
		return regtime;
	}
	public void setRegtime(Timestamp regtime) {
		this.regtime = regtime;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getSold() {
		return sold;
	}
	public void setSold(int sold) {
		this.sold = sold;
	}
	public int getRemain() {
		return remain;
	}
	public void setRemain(int remain) {
		this.remain = remain;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	

}
