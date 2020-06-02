package com.nit.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nit.dao.UserDAO;

public class CustomerAccept extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

	resp.sendRedirect("customerorderstatus.jsp?status="+new UserDAO().customerAcept(req.getParameter("id")));
	
	}
}
