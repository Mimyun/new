package com.ezen.ly09.member;

public class Member_DTO {
	String id;
	String pw;
	String name;
	String tel;
	String sex;
	String address;
	String hobby;
	String hello;
	String image;
	public Member_DTO() {
	}
	public Member_DTO(String id, String pw, String name, String tel, String sex, String address, String hobby,
			String hello, String image) {
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.tel = tel;
		this.sex = sex;
		this.address = address;
		this.hobby = hobby;
		this.hello = hello;
		this.image = image;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getHobby() {
		return hobby;
	}
	public void setHobby(String hobby) {
		this.hobby = hobby;
	}
	public String getHello() {
		return hello;
	}
	public void setHello(String hello) {
		this.hello = hello;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
}
