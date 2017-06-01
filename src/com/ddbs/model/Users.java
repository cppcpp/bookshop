package com.ddbs.model;



//userÄ£ÐÍ
public class Users {
	
	private String u_account;
	private String u_name;
	private String u_password;
	private String u_phone;
	private String u_mail;
	
	public Users(){}
	
	public Users(String u_account,String u_name,String u_password,String u_phone,String u_mail){
		this.u_account = u_account;
		this.u_mail = u_mail;
		this.u_name = u_name;
		this.u_password = u_password;
		this.u_phone = u_phone;
		
	}
	
	public String getU_account() {
		return u_account;
	}
	public void setU_account(String u_account) {
		this.u_account = u_account;
	}
	
	public String getU_name() {
		return u_name;
	}
	public void setU_name(String u_name) {
		this.u_name = u_name;
	}
	
	public String getU_password() {
		return u_password;
	}
	public void setU_password(String u_password) {
		this.u_password = u_password;
	}
	
	public String getU_phone() {
		return u_phone;
	}
	public void setU_phone(String u_phone) {
		this.u_phone = u_phone;
	}
	
	public String getU_mail() {
		return u_mail;
	}
	public void setU_mail(String u_mail) {
		this.u_mail = u_mail;
	}
	
}
