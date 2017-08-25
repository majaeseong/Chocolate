package com.jaeseong.world.dto;


public class MemberDTO {
	private String id,pwd,name,addr;
	private int authority, useyn;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAuthority() {
		return authority;
	}

	public void setAuthority(int authority) {
		this.authority = authority;
	}

	public int getUseyn() {
		return useyn;
	}

	public void setUseyn(int useyn) {
		this.useyn = useyn;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}
	
}
