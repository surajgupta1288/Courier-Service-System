package com.nit.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nit.dao.UserDAO;

public class AdminAcceptOrder extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
	
		UserDAO dao=new UserDAO();
		String status="";
		if(req.getParameter("reject")!=null && req.getParameter("reject").equals("reject"))
		{
			 status=dao.rejectAdminOrder(req.getParameter("rid"),req.getParameter("comment"));
		}
		else
		{
		 status=dao.acceptAdminOrder(req.getParameter("price"),req.getParameter("daysToDeliver"),req.getParameter("aid"),req.getParameter("comment"));
		}
		resp.sendRedirect("showorderrequest.jsp?status="+status);
	
	}

}
