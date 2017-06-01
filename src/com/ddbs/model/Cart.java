package com.ddbs.model;

public class Cart {
	private String u_account;
	private String b_id;
	private String b_name;
	private int b_nums;
	private float b_price;
	private float b_discountprice;
	private float b_sumprice;
	private float b_sumdiscountprice;
	
	public Cart(String u_account, String b_id, String b_name, int b_nums, float b_price, float b_discountprice,
			float b_sumprice, float b_sumdiscountprice) {
		this.u_account = u_account;
		this.b_id = b_id;
		this.b_name = b_name;
		this.b_nums = b_nums;
		this.b_price = b_price;
		this.b_discountprice = b_discountprice;
		this.b_sumprice = b_sumprice;
		this.b_sumdiscountprice = b_sumdiscountprice;
	}
	public Cart() {
		
	}
	
	public String getU_account() {
		return u_account;
	}
	public void setU_account(String u_account) {
		this.u_account = u_account;
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
	public int getB_nums() {
		return b_nums;
	}
	public void setB_nums(int b_nums) {
		this.b_nums = b_nums;
	}
	public float getB_price() {
		return b_price;
	}
	public void setB_price(float b_price) {
		this.b_price = b_price;
	}
	public float getB_discountprice() {
		return b_discountprice;
	}
	public void setB_discountprice(float b_discountprice) {
		this.b_discountprice = b_discountprice;
	}
	public float getB_sumprice() {
		return b_sumprice;
	}
	public void setB_sumprice(float b_sumprice) {
		this.b_sumprice = b_sumprice;
	}
	public float getB_sumdiscountprice() {
		return b_sumdiscountprice;
	}
	public void setB_sumdiscountprice(float b_sumdiscountprice) {
		this.b_sumdiscountprice = b_sumdiscountprice;
	}
	
	
	
}
