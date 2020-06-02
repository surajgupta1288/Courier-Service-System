
<%@page import="com.nit.dao.UserDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.nit.beans.OrderBean"%>
<%@page import="com.nit.util.Constants"%>
<%@page import="com.nit.beans.RegistrationBean"%>
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
					<h2 class="h-bold">Order Status</h2>
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

						List<OrderBean> list=dao.showCustomerOrderStatus((String)session.getAttribute("userId"));
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
						
						<%if(ob.getStatus().equals(Constants.CUSTOMER_CONFIRM_PENDING)) 
						{
						%>
						<td>
						<a href="./CustomerAccept?id=<%=ob.getOrderId() %>" >
										<button type="button" class="btn btn-success btn-xs"
											style="width: 100px;" onclick="$(this).getPaymentsInfo(${cat.tno});">
							Accept
							</button></a>
							
						
						</td>
						<%
						}
						else if(ob.getStatus().equals(Constants.REJECTED))
						{%>
						<td>
						
										<button type="button" class="btn btn-danger btn-xs"
											style="width: 100px;">
							Rejected
							</button>
							
						
						</td>
						<%
						
						}
						else if(ob.getStatus().equals(Constants.BOY_ALLOCATED))
						{
						RegistrationBean b=dao.getAllocatedBoy(ob.getOrderId());
						
						%>
						<td>
						<a data-n="<%=b.getUserName() %>"  data-i="<%=b.getUserId() %>"   
						data-m="<%=b.getMail() %>"  data-ma="<%=b.getMail() %>"  
						
						title="Edit this item"
									class="open-Details">
										<button type="button" class="btn btn-info btn-xs"
											style="width: 100px;">
							Details
							</button>
							</a>
							
						
						</td>
						<%
						}
						else if(ob.getStatus().equals(Constants.DELIVERED))
						{
						%>
						<td>
						
										<button type="button" class="btn btn-success btn-xs"
											style="width: 100px;">
							Delilvered
							</button>
							
						
						</td>
						<%
						
						}
						 %>
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
	
	
	
	
	
	
	<div class="modal fade" id="details" role="dialog">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">

				<form action="./AdminAcceptOrder" method="get"
					name="myForm">
					<div class="modal-header">
						<center>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">Delivery Boy Details</h4>
					</div>
					<div class="modal-body">
						
						<font color="blue"><b>Name</b></font> <br> <input
							type="text" name="daysToDeliver" class="form-control" id="n" value="" readonly="readonly"> <br>
						
						<font color="blue"><b>Mobile</b></font> <br> <input
							type="text" name="daysToDeliver" class="form-control" id="m" value="" readonly="readonly"> <br>
						
						
						<font color="blue"><b>Mail Id</b></font> <br> <input
							type="text" name="daysToDeliver" class="form-control" id="ma" value="" readonly="readonly"> <br>
						
							 
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-seconday" data-dismiss="modal">Close</button>
						
					</div>
				</form>



			</div>
		</div>
	</div>
	
	
	
	
	
	<div class="modal fade" id="reject" role="dialog">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">

				<form action="./AdminAcceptOrder" method="get"
					name="myForm">
					<div class="modal-header">
						<center>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">Reject Order</h4>
					</div>
					<div class="modal-body">
						<input type="hidden" name="rid"  value="" id="rid">
					
						<input type="hidden" name="reject"  value="reject">
						
						<font color="blue"><b>Comment</b></font> <br> 
						<textarea rows="3" cols="4" class="form-control" name="comment" required> </textarea>
						
							 
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-seconday" data-dismiss="modal">Close</button>
						<input type="submit"  class="btn btn-primary" value="Save changes" >
					</div>
				</form>



			</div>
		</div>
	</div>




	
	<div class="modal fade" id="accept" role="dialog">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">

				<form action="./AdminAcceptOrder" method="get"
					name="myForm">
					<div class="modal-header">
						<center>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">Accept Order</h4>
					</div>
					<div class="modal-body">
						<input type="hidden" name="aid"  value="" id="aid">
						<input type="hidden" name="due"  value="" id="d">
						 <br> <font color="blue"><b>Price</b></font> <br> <input
							type="number" name="price" id=""  class="form-control"  value="" required> <br>

						<font color="blue"><b>Days To Deliver</b></font> <br> <input
							type="number" name="daysToDeliver" class="form-control" id="mi" value="" required> <br>
						
						
						
						<font color="blue"><b>Comment</b></font> <br> 
						<textarea rows="3" cols="4" class="form-control" name="comment" required> </textarea>
						
							 
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-seconday" data-dismiss="modal">Close</button>
						<input type="submit"  class="btn btn-primary" value="Save changes" >
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
	  
	    $(".open-Details").click(function(){
		   $('#i').val($(this).data('i'));
		  $('#n').val($(this).data('n'));
		  $('#m').val($(this).data('m'));
		  $('#ma').val($(this).data('ma'));
	    $("#details").modal("show");
	  });
	  
	  
});
	  
	 


</script>
<jsp:include page="footer.jsp"></jsp:include>