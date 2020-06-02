package com.nit.beans;

import java.io.Serializable;

public class OrderBean implements Serializable
{
	private int orderId;
	private String itemName;
	private String itemCharacter;
	private String weight;
	private String sourceAddress;
	private String destinationAddress;
	private String deliveryType;
	private String price;
	private String noOfDays;
	private String deliveryBoyId;
	private String status;
	private String comment;
	private String userId;
	private RegistrationBean rb;
	
	
	
	
	public RegistrationBean getRb() {
		return rb;
	}
	public void setRb(RegistrationBean rb) {
		this.rb = rb;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public String getItemCharacter() {
		return itemCharacter;
	}
	public void setItemCharacter(String itemCharacter) {
		this.itemCharacter = itemCharacter;
	}
	public String getWeight() {
		return weight;
	}
	public void setWeight(String weight) {
		this.weight = weight;
	}
	public String getSourceAddress() {
		return sourceAddress;
	}
	public void setSourceAddress(String sourceAddress) {
		this.sourceAddress = sourceAddress;
	}
	public String getDestinationAddress() {
		return destinationAddress;
	}
	public void setDestinationAddress(String destinationAddress) {
		this.destinationAddress = destinationAddress;
	}
	public String getDeliveryType() {
		return deliveryType;
	}
	public void setDeliveryType(String deliveryType) {
		this.deliveryType = deliveryType;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getNoOfDays() {
		return noOfDays;
	}
	public void setNoOfDays(String noOfDays) {
		this.noOfDays = noOfDays;
	}
	public String getDeliveryBoyId() {
		return deliveryBoyId;
	}
	public void setDeliveryBoyId(String deliveryBoyId) {
		this.deliveryBoyId = deliveryBoyId;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	
	
	
	

}
