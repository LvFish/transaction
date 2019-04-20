package com.test.entity;

public class CartEntity {
	private int id;
	private int goodId;
	private int customerId;
	private String name;
	private String price;
	private String url;
	private String publishedStatus;
	
	
	public String getPublishedStatus() {
		return publishedStatus;
	}
	public void setPublishedStatus(String publishedStatus) {
		this.publishedStatus = publishedStatus;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getGoodId() {
		return goodId;
	}
	public void setGoodId(int goodId) {
		this.goodId = goodId;
	}
	public int getCustomerId() {
		return customerId;
	}
	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}
	
}
