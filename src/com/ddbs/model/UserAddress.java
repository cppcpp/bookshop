package com.ddbs.model;

//用户收获信息模型
public class UserAddress {
	
	private String u_account;
	private String u_address;
	private String o_phone;
	private int u_isDefault;
	private String o_receiver;
	private String u_addr_id;//增加一个地址的id
	
	public UserAddress(){}
	
	public UserAddress(String u_account,String u_address,String o_phone,int u_isDefault,String o_receiver){
		this.u_account = u_account;
		this.u_address = u_address;
		this.o_phone = o_phone;
		this.u_isDefault = u_isDefault;
		this.o_receiver = o_receiver;
	}
	
	//存储修改后的地址信息
	public UserAddress(String u_account, String u_address, String o_phone, int u_isDefault, String o_receiver,
			String u_addr_id) {
		super();
		this.u_account = u_account;
		this.u_address = u_address;
		this.o_phone = o_phone;
		this.u_isDefault = u_isDefault;
		this.o_receiver = o_receiver;
		this.u_addr_id = u_addr_id;
	}

	
	public String getU_addr_id() {
		return u_addr_id;
	}

	public void setU_addr_id(String u_addr_id) {
		this.u_addr_id = u_addr_id;
	}
	
	public String getU_account() {
		return u_account;
	}
	public void setU_account(String u_account) {
		this.u_account = u_account;
	}
	
	public String getU_address() {
		return u_address;
	}
	public void setU_address(String u_address) {
		this.u_address = u_address;
	}
	
	public String getO_phone() {
		return o_phone;
	}
	public void setO_phone(String o_phone) {
		this.o_phone = o_phone;
	}
	
	public int getU_isDefault() {
		return u_isDefault;
	}
	public void setU_isDefault(int u_isDefault) {
		this.u_isDefault = u_isDefault;
	}
	
	public String getO_receiver() {
		return o_receiver;
	}
	public void setO_receiver(String o_receiver) {
		this.o_receiver = o_receiver;
	}
	
	
}
