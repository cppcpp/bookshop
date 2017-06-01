package com.ddbs.model;

import java.sql.Date;
import java.sql.Timestamp;

import org.omg.CORBA.PUBLIC_MEMBER;

public class Books {
	private String b_id;
	private String b_name;
	private String b_description;
	private float b_price;
	private int b_discount;
	private String b_author;
	private String b_press;
	private Date b_press_time;
	private String b_service;
	private Timestamp b_add_time;
	private int b_sale_num;
	
	public Books(){}
	
	public Books(String b_id,String b_name,String b_description,float b_price,int b_discount,String b_author,String b_press,Date b_press_time,String b_service,int b_sale_num,Timestamp TimeStamp){
		this.b_author = b_author+"  著";
		this.b_description = b_description;
		this.b_discount = b_discount;
		this.b_id = b_id;
		this.b_name = b_name;
		this.b_press = b_press;
		this.b_press_time = b_press_time;
		this.b_price = b_price;
		this.b_sale_num = b_sale_num;
		this.b_service = b_service;
		this.b_add_time =TimeStamp;
	}
	
	public Books(String b_id,String b_name,String b_description,float b_price,int b_discount,String b_author,String b_press,Date b_press_time,String b_service,int b_sale_num){
		this.b_author = b_author+"  著";
		this.b_description = b_description;
		this.b_discount = b_discount;
		this.b_id = b_id;
		this.b_name = b_name;
		this.b_press = b_press;
		this.b_press_time = b_press_time;
		this.b_price = b_price;
		this.b_sale_num = b_sale_num;
		this.b_service = b_service;
		this.b_add_time = new Timestamp(System.currentTimeMillis());
	}
	
	public Books(String b_id,String b_name,String b_description,float b_price,int b_discount,String b_author,String b_press,Date b_press_time,String b_service){
		this.b_author = b_author+"  著";
		this.b_description = b_description;
		this.b_discount = b_discount;
		this.b_id = b_id;
		this.b_name = b_name;
		this.b_press = b_press;
		this.b_press_time = b_press_time;
		this.b_price = b_price;
		this.b_service = b_service;
		this.b_add_time = new Timestamp(System.currentTimeMillis());
	}
	
	
	public String getB_id() {
		return b_id;
	}

	public void setB_id(String b_id) {
		this.b_id = b_id;
	}

	public String getB_name() {
		return b_name;
	}

	public void setB_name(String b_name) {
		this.b_name = b_name;
	}

	public String getB_description() {
		return b_description;
	}

	public void setB_description(String b_description) {
		this.b_description = b_description;
	}

	public float getB_price() {
		return b_price;
	}

	public void setB_price(float b_price) {
		this.b_price = b_price;
	}

	public int getB_discount() {
		return b_discount;
	}

	public void setB_discount(int b_discount) {
		this.b_discount = b_discount;
	}

	public String getB_author() {
		return b_author;
	}

	public void setB_author(String b_author) {
		//因为在数据库中忘记写  著  字，在这边添一下
		this.b_author = b_author+" 著";
	}

	public String getB_press() {
		return b_press;
	}

	public void setB_press(String b_press) {
		this.b_press = b_press;
	}

	public Date getB_press_time() {
		return b_press_time;
	}

	public void setB_press_time(Date b_press_time) {
		this.b_press_time = b_press_time;
	}

	public String getB_service() {
		return b_service;
	}

	public void setB_service(String b_service) {
		this.b_service = b_service;
	}

	public int getB_sale_num() {
		return b_sale_num;
	}

	public void setB_sale_num(int b_sale_num) {
		this.b_sale_num = b_sale_num;
	}
	
	public void setB_add_time(Timestamp timestamp){
		this.b_add_time=timestamp;
	}
	public Timestamp getB_add_time() {
		return b_add_time;
	}
	
}
