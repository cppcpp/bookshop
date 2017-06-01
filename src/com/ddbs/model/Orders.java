package com.ddbs.model;

import java.sql.Timestamp;

public class Orders {

	private String o_id;
	private int o_num;
	private float o_price;
	private Timestamp o_time;
	private String u_account;
	private String u_address;
	private String o_phone;
	private String o_receiver;
	private float o_cheaper;
	

	public Orders(){}
	
	public Orders(String o_id,int o_num,float o_price,String u_account,String u_address,String o_phone,String o_receiver,float o_cheaper){
		this.o_cheaper = o_cheaper;
		this.o_id = o_id;
		this.o_num = o_num;
		this.o_phone = o_phone;
		this.o_price = o_price;
		this.o_receiver = o_receiver;
		this.u_account = u_account;
		this.u_address = u_address;
		this.o_time = new Timestamp(System.currentTimeMillis());
	}

	
	public Orders(String o_id, int o_num, float o_price, Timestamp o_time, String u_account, String u_address,
			String o_phone, String o_receiver, float o_cheaper) {
		super();
		this.o_id = o_id;
		this.o_num = o_num;
		this.o_price = o_price;
		this.o_time = o_time;
		this.u_account = u_account;
		this.u_address = u_address;
		this.o_phone = o_phone;
		this.o_receiver = o_receiver;
		this.o_cheaper = o_cheaper;
	}

	public String getO_id() {
		return o_id;
	}

	public void setO_id(String o_id) {
		this.o_id = o_id;
	}

	public int getO_num() {
		return o_num;
	}

	public void setO_num(int o_num) {
		this.o_num = o_num;
	}

	public float getO_price() {
		return o_price;
	}

	public void setO_price(float o_price) {
		this.o_price = o_price;
	}

	public void setO_time(Timestamp o_time){
		this.o_time = o_time;
	}
	public Timestamp getO_time() {
		return o_time;
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

	public String getO_receiver() {
		return o_receiver;
	}

	public void setO_receiver(String o_receiver) {
		this.o_receiver = o_receiver;
	}

	public float getO_cheaper() {
		return o_cheaper;
	}

	public void setO_cheaper(float o_cheaper) {
		this.o_cheaper = o_cheaper;
	}
	
	
}
