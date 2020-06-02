package com.nit.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nit.beans.RegistrationBean;
import com.nit.dao.UserDAO;

public class RegistrationServlet extends HttpServlet 
{
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException 
			{
		/*response.getWriter().print("hello...");*/
		
		UserDAO dao = new UserDAO();

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		RegistrationBean rb = new RegistrationBean();
	
		
		rb.setUserId(request.getParameter("userId"));
		rb.setUserName(request.getParameter("userName"));
		rb.setPassword(request.getParameter("password"));
		rb.setMobile(request.getParameter("mobile"));
		rb.setMail(request.getParameter("mail"));
		int i=0;
		rb.setAddress(request.getParameter("address"));
		if(request.getParameter("boy")!=null && request.getParameter("boy").equals("1"))
		{
			i=1;
			rb.setRole("BOY");
		}
		else
		{
		rb.setRole("CUSTOMER");
		}
		
		System.out.println("address---"+rb.getAddress());
		String target = "registration.jsp?status=Registration Failed  !!!!!";
		
		boolean flag1 = dao.checkLoginIDExisted(request.getParameter("userId"));
		if (flag1 == true) {
			target = "registration.jsp?status=" + request.getParameter("userId")
					+ "  Already Registered";
		} else {

			boolean f1 = dao.insertUserInfo(rb);
	
			if (f1 == true) {
				if(i!=1)
				{
				target = "login.jsp?status="+request.getParameter("userId")+" Account created successfully";
				
				}
				else
				{
					target = "uploadboy.jsp?status="+request.getParameter("userId")+" Account created successfully";
					
				}
			} else {
				target = "registration.jsp?status=Registration Failed  !!!!!";
			}
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
