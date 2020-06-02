package com.nit.controller;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nit.dao.UserDAO;

public class BoyOrderStatus extends HttpServlet {
@Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp)
		throws ServletException, IOException {
	String orderId=req.getParameter("rid");
	
	String comment=req.getParameter("status")+"--"+req.getParameter("comment");
	int i=new UserDAO().boyOrderStatus(orderId,comment);
	if(i>0)
	{
		resp.sendRedirect("showboyorders.jsp?status=Successfully Submitted..");
	}
	else
	{
		resp.sendRedirect("showboyorders.jsp?status=something Went Wrong..");
	}
		 

}
}
