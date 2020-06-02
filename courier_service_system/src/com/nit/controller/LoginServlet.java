package com.nit.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nit.beans.RegistrationBean;
import com.nit.dao.UserDAO;

public class LoginServlet extends HttpServlet {
	private String utype ="";
	private String username = "";

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UserDAO dao = new UserDAO();
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		RegistrationBean rb = new RegistrationBean();
		
		session.setAttribute("userId", request.getParameter("userId"));
		String target = "login.jsp?status=Internal Proublem Please Try again!";
		try
		{
		rb.setUserId(request.getParameter("userId"));
		rb.setPassword(request.getParameter("password"));
		RegistrationBean rb1 = new RegistrationBean();
		rb1 = dao.loginCheck(rb);
		
		
		utype = rb1.getRole();
		username = rb1.getUserName();
		
		System.out.println("utype===="+utype);
		
		
		
		if (utype.equals("ADMIN")) {
				/*target = "adminhome.jsp";*/
				target = "index.jsp";
				session.setAttribute("user", username);
				session.setAttribute("role", utype);
			
		
		} 
	else if (utype.equals("BOY")) {
		target = "index.jsp";
				/*target = "BoyHome.jsp";*/
				session.setAttribute("user", username);
				session.setAttribute("role", utype);
		
				

		} else if(utype.equals("CUSTOMER"))
		{
			target = "index.jsp";
		/*	target = "CustomerHome.jsp";*/
			session.setAttribute("user", username);
			session.setAttribute("role", utype);
			
		}
		
		
		else 
		{
			target = "login.jsp?status=Invalid username or password";
		}
		
		}
		catch(Exception e)
		{
			target = "login.jsp?status=Invalid username or password";
		}

		RequestDispatcher rd = request.getRequestDispatcher(target);
		rd.forward(request, response);

		out.flush();
		out.close();

	
	}
	

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		doGet(request, response);
		out.flush();
		out.close();
	}
	

}
