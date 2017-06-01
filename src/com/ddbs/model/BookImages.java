package com.ddbs.model;

public class BookImages {
	private String b_id;
	private String b_img;
	
	public BookImages(){}
	
	public BookImages(String b_id,String b_img){
		this.b_id = b_id;
		this.b_img = b_img+".jpg";
	}

	public String getB_id() {
		return b_id;
	}

	public void setB_id(String b_id) {
		this.b_id = b_id;
	}

	public String getB_img() {
		return b_img;
	}

	public void setB_img(String b_img) {
		this.b_img = b_img+".jpg";
	}
	
	
}
