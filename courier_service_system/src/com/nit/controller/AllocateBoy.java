package com.nit.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nit.dao.UserDAO;

public class AllocateBoy extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		if(req.getParameter("user")!=null)
		{
		resp.sendRedirect("showcustomeraccepted.jsp?status="+new UserDAO().allocateBoy(req.getParameter("user"),req.getParameter("aid")));
		}
		else
		{
		resp.sendRedirect("showcustomeraccepted.jsp?status=Please Select Delivery Boy");
		}
	}

}
