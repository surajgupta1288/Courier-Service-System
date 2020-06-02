package com.nit.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nit.beans.OrderBean;
import com.nit.dao.UserDAO;
import com.nit.util.Constants;

public class CustomerOrderRequest extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		OrderBean ob=new OrderBean();
		ob.setDeliveryType(req.getParameter("deliveryType"));
		ob.setDestinationAddress(req.getParameter("destinationAddress"));
		ob.setItemCharacter(req.getParameter("itemCharacter"));
		ob.setItemName(req.getParameter("itemName"));
		ob.setSourceAddress(req.getParameter("sourceAddress"));
		ob.setDestinationAddress(req.getParameter("destinationAddress"));
		ob.setStatus(Constants.PENDING);
		ob.setWeight(req.getParameter("weight"));
		HttpSession hs=req.getSession(false);
		ob.setUserId((String)hs.getAttribute("userId"));
		int status=new UserDAO().sendCustomerOrderRequest(ob);
		if(status>0)
		{
			resp.sendRedirect("orderrequest.jsp?status=Request Successfully Send");
		}
		else
		{
			resp.sendRedirect("orderrequest.jsp?status=Failed..");
		}
		
	}

}
