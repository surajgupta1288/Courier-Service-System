package com.nit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.nit.beans.OrderBean;
import com.nit.beans.RegistrationBean;
import com.nit.util.Constants;
import com.nit.util.DBConnectionClass;
import com.nit.util.SqlConstants;


public class UserDAO extends DBConnectionClass {
	public static Connection con;
	PreparedStatement ps,pst;
	private boolean flag;

	public UserDAO() {
		con = getConnection();

	}

	public boolean checkLoginIDExisted(String loginid) {
		boolean f = false;
		try {
			con = getConnection();
			ps = con
					.prepareStatement(SqlConstants.SQL_CHECK_LOGIN);
			ps.setString(1, loginid);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				f = true;
			}
			ps.close();
		rs.close();
		}
		

		catch (Exception e) {
			
		} 
		return f;
	}

	

	public boolean insertUserInfo(RegistrationBean reb) {
		
		
		try {
			int i = 0;
			
			pst = con
					.prepareStatement(SqlConstants.SQL_INSERT_USER_INFO);
			pst.setString(1, reb.getUserId());
			pst.setString(2, reb.getPassword());
			pst.setString(3, reb.getUserName());
			pst.setString(4, reb.getMobile());
			pst.setString(5, reb.getMail());
			
			pst.setString(6, reb.getAddress());
			pst.setString(7, reb.getRole());
			
			
	
			i = pst.executeUpdate();
			if (i == 1) {
				flag = true;
				con.commit();
			} else {
				flag = false;
				con.rollback();
			}
			pst.close();
		} catch (SQLException ex) {
			ex.printStackTrace();
			flag = false;
			try {
				con.rollback();
			} catch (SQLException sex1) {
				sex1.printStackTrace();
			}
		} catch (Exception e) {
			e.printStackTrace();
			flag = false;
			try {
				con.rollback();
			} catch (SQLException se) {
				se.printStackTrace();
			}
		}  
		return flag;
	}


	public RegistrationBean loginCheck(RegistrationBean regbean) 
	{
		String loginid = regbean.getUserId();
		String password = regbean.getPassword();
		RegistrationBean regbean1 = new RegistrationBean();
		try {
			
			pst = con
			.prepareStatement(SqlConstants.SQL_LOGIN_CHECK);
			pst.setString(1, loginid);
			pst.setString(2, password);

			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				regbean1.setRole(rs.getString(1));
				regbean1.setUserName(rs.getString(2));
				
			} else {
				flag = false;
				regbean1.setRole("");
				regbean1.setUserName("");
				
				
			}
			pst.close();
		} catch (SQLException ex) {
			System.out.println(ex);
			
			flag = false;
		} 

		return regbean1;
		
	}

	public int sendCustomerOrderRequest(OrderBean ob) {
		int i = 0;
		try {
			pst = con
					.prepareStatement(SqlConstants.SQL_INSERT_CUSTOMER_REQUEST);
			pst.setString(1, ob.getItemName());
			pst.setString(2,ob.getItemCharacter());
			pst.setString(3,ob.getWeight());
			pst.setString(4,ob.getSourceAddress());
			pst.setString(5,ob.getDestinationAddress());
			pst.setString(6,ob.getDeliveryType());
			pst.setString(7,ob.getStatus());
			pst.setString(8, ob.getUserId());
			i=pst.executeUpdate();
	
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	return i;
	}

	
	public List<OrderBean> showCustomerOrderRequest()
	{
		List<OrderBean> list=new ArrayList<OrderBean>();
		try
		{
		pst=con.prepareStatement("select * from orders where status=?");
		pst.setString(1, Constants.PENDING);
		ResultSet rs=pst.executeQuery();
		while(rs.next())
		{
			OrderBean ob=new OrderBean();
			ob.setDeliveryType(rs.getString(7));
			ob.setDestinationAddress(rs.getString(6));
			ob.setItemCharacter(rs.getString(3));
			ob.setItemName(rs.getString(2));
			ob.setOrderId(rs.getInt(1));
			ob.setSourceAddress(rs.getString(5));
			ob.setWeight(rs.getString(4));
			
			list.add(ob);
		}
		pst.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
			
		}
		
		return list;
	}
	
	
	
	public List<OrderBean> shoBoyOrders(String userId)
	{
		List<OrderBean> list=new ArrayList<OrderBean>();
		try
		{
		pst=con.prepareStatement("select * from orders where del_boy_id=? and status=?");
		pst.setString(1, userId);
		pst.setString(2, Constants.BOY_ALLOCATED);
		ResultSet rs=pst.executeQuery();
		while(rs.next())
		{
			OrderBean ob=new OrderBean();
			ob.setDeliveryType(rs.getString(7));
			ob.setDestinationAddress(rs.getString(6));
			ob.setItemCharacter(rs.getString(3));
			ob.setItemName(rs.getString(2));
			ob.setOrderId(rs.getInt(1));
			ob.setSourceAddress(rs.getString(5));
			ob.setWeight(rs.getString(4));
			ob.setNoOfDays(rs.getString(9));
			ps=con.prepareStatement("select * from users where userid=?");
			ps.setString(1, rs.getString(13));
			ResultSet rss=ps.executeQuery();
			if(rss.next())
			{
				RegistrationBean rb=new RegistrationBean();
				rb.setAddress(rss.getString(6));
				rb.setMail(rss.getString(5));
				rb.setMobile(rss.getString(4));
				rb.setUserName(rss.getString(3));
				ob.setRb(rb);
			}
			ps.close();
			list.add(ob);
		}
		pst.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
			
		}
		
		return list;
	}
	
	
	public List<OrderBean> showCustomerOrderStatus(String userId)
	{
		List<OrderBean> list=new ArrayList<OrderBean>();
		try
		{
		pst=con.prepareStatement("select * from orders where (status=? or status=? or status=? or status=?) and userId=?");
		pst.setString(1, Constants.CUSTOMER_CONFIRM_PENDING);
		pst.setString(2, Constants.REJECTED);
		pst.setString(3, Constants.BOY_ALLOCATED);
		pst.setString(4, Constants.DELIVERED);
		pst.setString(5,userId);
		
		ResultSet rs=pst.executeQuery();
		while(rs.next())
		{
			OrderBean ob=new OrderBean();
			ob.setDeliveryType(rs.getString(7));
			ob.setDestinationAddress(rs.getString(6));
			ob.setItemCharacter(rs.getString(3));
			ob.setItemName(rs.getString(2));
			ob.setOrderId(rs.getInt(1));
			ob.setSourceAddress(rs.getString(5));
			ob.setWeight(rs.getString(4));
			ob.setPrice(rs.getString(8));
			ob.setNoOfDays(rs.getString(9));
			ob.setComment(rs.getString(12));
			ob.setStatus(rs.getString(11));
			
			list.add(ob);
		}
		pst.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
			
		}
		
		return list;
	}
	
	

	public List<OrderBean> showCustomerAcceptedOrders()
	{
		List<OrderBean> list=new ArrayList<OrderBean>();
		try
		{
		pst=con.prepareStatement("select * from orders where status=?");
		pst.setString(1, Constants.CUSTOMER_ACCEPTED);
		
		ResultSet rs=pst.executeQuery();
		while(rs.next())
		{
			OrderBean ob=new OrderBean();
			ob.setDeliveryType(rs.getString(7));
			ob.setDestinationAddress(rs.getString(6));
			ob.setItemCharacter(rs.getString(3));
			ob.setItemName(rs.getString(2));
			ob.setOrderId(rs.getInt(1));
			ob.setSourceAddress(rs.getString(5));
			ob.setWeight(rs.getString(4));
			ob.setPrice(rs.getString(8));
			ob.setNoOfDays(rs.getString(9));
			ob.setComment(rs.getString(12));
			ob.setStatus(rs.getString(11));
			
			list.add(ob);
		}
		pst.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
			
		}
		
		return list;
	}
	
	public String acceptAdminOrder(String price, String days,String id,String comment) {
		String status="";
		try
		{
		pst=con.prepareStatement("update orders set price=? , days_to_deliver=?,status=?,comments=? where orderid=?");
		pst.setString(1, price);
		pst.setString(2, days);
		pst.setString(3,Constants.CUSTOMER_CONFIRM_PENDING);
		pst.setString(4, comment);
		pst.setInt(5, Integer.parseInt(id));
		int i=pst.executeUpdate();
		if(i>0)
		{
			status="Successfully Accepted";
		}
		else
		{
			status="Something Went Wrong";
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return status;
	}

	public String rejectAdminOrder(String id, String comment) {
		
		String status="";
		try
		{
		pst=con.prepareStatement("update orders set status=?,comments=? where orderid=?");
		
		pst.setString(1,Constants.REJECTED);
		pst.setString(2, comment);
		pst.setInt(3, Integer.parseInt(id));
		int i=pst.executeUpdate();
		if(i>0)
		{
			status="Successfully Accepted";
		}
		else
		{
			status="Something Went Wrong";
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return status;
	}

	public String customerAcept(String parameter) {

		String status="";
		try
		{
		pst=con.prepareStatement("update orders set status=? where orderid=?");
		
		pst.setString(1,Constants.CUSTOMER_ACCEPTED);
		pst.setString(2, parameter);
		int i=pst.executeUpdate();
		if(i>0)
		{
			status="Successfully Accepted";
		}
		else
		{
			status="Something Went Wrong";
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return status;
	}
	
	
	
	
	
	
	
	
	

	public List<RegistrationBean> getBoys()
	{
		
		List<RegistrationBean> list=new ArrayList<RegistrationBean>();
		try
		{
		pst=con.prepareStatement("select * from users where  userid not in (select del_boy_id from orders where status='ALLOCATED') and role='BOY'");
		ResultSet rs=pst.executeQuery();
		while(rs.next())
		{
			RegistrationBean rb=new RegistrationBean();
			rb.setUserId(rs.getString(1));
			rb.setUserName(rs.getString(3));
			rb.setMobile(rs.getString(4));
			rb.setMail(rs.getString(5));
			list.add(rb);
		}
		pst.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
			
		}
		
		return list;
	}

	public String allocateBoy(String user, String oid) {
		

		String status="";
		try
		{
		pst=con.prepareStatement("update orders set status=?,del_boy_id=? where orderid=?");
		
		pst.setString(1,Constants.BOY_ALLOCATED);
		pst.setString(2, user);
		pst.setInt(3,Integer.parseInt(oid));
		int i=pst.executeUpdate();
		if(i>0)
		{
			status="Successfully Allocated";
		}
		else
		{
			status="Something Went Wrong";
		}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return status;
	}
	
	
	public RegistrationBean getAllocatedBoy(int id) {
		

		RegistrationBean rb=new RegistrationBean();
		try
		{
		pst=con.prepareStatement("select * from users where userid=(select del_boy_id from orders where orderid=?)");
		pst.setInt(1, id);
		ResultSet rs=pst.executeQuery();
		if(rs.next())
		{
			rb.setUserId(rs.getString(1));
			rb.setUserName(rs.getString(3));
			rb.setMobile(rs.getString(4));
			rb.setMail(rs.getString(5));
		}
		pst.close();
		}
		catch(Exception e)
		{
			e.printStackTrace();
			
		}
		
		return rb;
	}

	public int boyOrderStatus(String orderId, String comment) {
		try
		{
			if(comment.contains(Constants.DELIVERED))
			{
				pst=con.prepareStatement("update orders set comments=?,status=? where orderId=?");
				pst.setString(1, comment);
				pst.setString(3,orderId);
				pst.setString(2,Constants.DELIVERED);
			}
			else
			{
				pst=con.prepareStatement("update orders set comments=? where orderId=?");
				pst.setString(1, comment);
				pst.setString(2,orderId);
			}
		
		return  pst.executeUpdate();
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return 0;
		
	}	
	
	
}
		
		


	
	
	
	
	

	
	


