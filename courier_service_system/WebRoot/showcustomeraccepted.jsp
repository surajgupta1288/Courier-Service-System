
<%@page import="com.nit.dao.UserDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.nit.beans.OrderBean"%>
<%@page import="com.nit.util.Constants"%>
<%@page import="com.nit.beans.RegistrationBean"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="header.jsp"></jsp:include>
<%
String user=(String)session.getAttribute("userId");
if(user==null)
{
response.sendRedirect("login.jsp?status=Please Enter username and password");
}
 %>

 <section id="contact" class="home-section nopadd-bot color-dark bg-white text-center">
		<div class="container marginbot-50">
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2">
					<div class="wow flipInY" data-wow-offset="0" data-wow-delay="0.4s">
					<div class="section-heading text-center">
					<h2 class="h-bold">Customer Accepted Orders</h2>
					<div class="divider-header"></div>
					<font color="red"><b>
					<p>
					<%
					String status=request.getParameter("status");
					if(status!=null)
					{
				out.println("<div class='alert alert-success'>"+status+" </div>");
					}
					
					 %>
					</p></b></font>
					</div>
					</div>
				</div>
			</div>

		</div>
		
		<div class="container">
<%UserDAO dao=new UserDAO();

						List<OrderBean> list=dao.showCustomerAcceptedOrders();
						if(!list.isEmpty())
						{
						%>
						<table class="table" width="1000">
						<tr>
						<th>Name</th>
						<th>Character</th>
						<th>Weight</th>
						<th>Source Add</th>
						<th>Dest Add</th>
						<th>Deliv Type</th>
						<th>Price</th>
						<th>Days</th>
						<th>Comment</th>
						
						<th></th>
						</tr>
						


						<%
						for(OrderBean ob:list)
						{
						%>
						
						<tr><td><%=ob.getItemName() %></td>
						<td><%=ob.getItemCharacter() %></td>
						<td><%=ob.getWeight() %></td>
						<td><%=ob.getSourceAddress() %></td>
						<td><%=ob.getDestinationAddress() %></td>
						<td><%=ob.getDeliveryType() %></td>
						<td><%=ob.getPrice()%></td>
						<td><%=ob.getNoOfDays() %></td>
						<td><%=ob.getComment() %></td>
						
					
						<td>
					<a data-id="<%=ob.getOrderId() %>"   title="Edit this item"
									class="open-Accept">
										<button type="button" class="btn btn-success btn-xs"
											style="width: 125px;" onclick="$(this).getPaymentsInfo(${cat.tno});">
							Allocate Boy
							</button></a>
							
						
						</td>
						
						
					
						</tr>
						<%
						}
						}
						 %>
						</table>
			<div class="row marginbot-80">
				<div class="col-md-8 col-md-offset-2">
						
						
						
				</div>
			</div>	


		</div>
	</section>
	
	
	
	
	
	
	
	
	
	


	
	<div class="modal fade" id="accept" role="dialog">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">

					<form action="./AllocateBoy" method="get" name="myForm">
					<div class="modal-header">
						<center>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">Allocate Delivery Boy</h4>
					</div>
					<div class="modal-body">
						
						<input type="hidden" name="aid" id="aid"/>
						
						<table width="1000px;" class="table">
						
					
						<%
						List<RegistrationBean> boysList=dao.getBoys();
						 
						
						if(!boysList.isEmpty())
						{
						
						for(RegistrationBean r:boysList)
						{
						%>
						
					
					
					<tr>
				<td><input type="radio" name="user" value="<%=r.getUserId() %>"/> </td>
					<td>
					<input type="hidden" name="bid"  value="<%=r.getUserId() %>"/>
					<font color="blue"><b>Name</b></font> : <%=r.getUserName() %></td>
						 <Td><font color="blue"><b>Mobile</b></font> : <%=r.getMobile() %></Td>
						
						</tr>
						
						
						<%
						}
						}
						 %>
						
						
							</table>
						
							 
					</div>

					<div class="modal-footer">
						<button type="submit" class="btn btn-seconday" data-dismiss="modal">Close</button>
						<input type="submit"  class="btn btn-primary" value="Allocate" >
					</div>
				</form>



			</div>
		</div>
	</div>


	

	
	
	


	<script type="text/javascript">

$(function(){


 $(".open-Reject").click(function(){
		   $('#rid').val($(this).data('id'));
		  
	    $("#reject").modal("show");
	  });
	  
	  
	  
	  $(".open-Accept").click(function(){
		   $('#aid').val($(this).data('id'));
		  
	    $("#accept").modal("show");
	  });
	  
	  
	  
	  
});
	  
	 


</script>
<jsp:include page="footer.jsp"></jsp:include>