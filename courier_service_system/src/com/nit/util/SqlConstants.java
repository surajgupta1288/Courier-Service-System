package com.nit.util;

public class SqlConstants
{
	public static final String SQL_CHECK_LOGIN="select userid from users where userid=?";
	
	public static final String SQL_INSERT_USER_INFO="insert into users(userid,password,username,mobile,mail,address,role) values(?,?,?,?,?,?,?)";
	
	public static final String SQL_LOGIN_CHECK="select role,username from USERS where USERID=? and PASSWORD=?";
	
	public static final String SQL_INSERT_CUSTOMER_REQUEST="insert into orders(orderid,item_name,item_character,weight,source_address,destination_address,delivery_type,status,userid) values((SELECT NVL(MAX(orderid),1)+1 FROM orders),?,?,?,?,?,?,?,?)";
	
}
