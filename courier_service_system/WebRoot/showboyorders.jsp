
<%@page import="com.nit.dao.UserDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.nit.beans.OrderBean"%>
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
					<h2 class="h-bold">Order Request</h2>
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
						List<OrderBean> list=dao.shoBoyOrders((String)session.getAttribute("userId"));
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
						<th>Days To Deliver</th>
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
						<td><%=ob.getNoOfDays() %></td>
						<td>
						<a data-ad="<%=ob.getRb().getAddress() %>" data-mo="<%=ob.getRb().getMobile() %>" data-ma="<%=ob.getRb().getMail() %>" data-us="<%=ob.getRb().getUserName() %>"  title="Edit this item"
									class="open-Accept">
										<button type="button" class="btn btn-success btn-xs"
											style="width: 100px;">
							Customer
							</button></a>
							<a data-id="<%=ob.getOrderId() %>"   title="Edit this item"
									class="open-Reject">
										<button type="button" class="btn btn-danger btn-xs"
											style="width: 100px;">
							Status
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
	
	
	
	
	
	
	
	
	
	
	<div class="modal fade" id="reject" role="dialog">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">

				<form action="./BoyOrderStatus" method="get"
					name="myForm">
					<div class="modal-header">
						<center>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">Order Status</h4>
					</div>
					<div class="modal-body">
						<input type="hidden" name="rid"  value="" id="rid">
					
						
						<font color="blue"><b>Status</b></font> <br> 
				<select name="status" class="form-control">
				<option value="ON THE WAY">On the Way</option>
				<option value="DELIVERED">Delivered</option>
				</select>
						
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
							<h4 class="modal-title">Customer Details</h4>
					</div>
					<div class="modal-body">
						<input type="hidden" name="aid"  value="" id="aid">
						<input type="hidden" name="due"  value="" id="d">
						 <br> <font color="blue"><b>Customer Name</b></font> <br> <input
							type="text" name="price" id="us"  class="form-control"  value="" readonly="readonly"> <br>

						<font color="blue"><b>Mobile</b></font> <br> <input
							type="text" name="daysToDeliver" class="form-control" id="mo" value="" readonly="readonly"> <br>
						
							<font color="blue"><b>Mail Id</b></font> <br> <input
							type="text" name="daysToDeliver" class="form-control" id="ma" value="" readonly="readonly"> <br>
						
						
						
						<font color="blue"><b>Address</b></font> <br> 
						<textarea rows="3" cols="4" class="form-control" name="comment" id="ad" readonly="readonly"> </textarea>
						
							 
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-seconday" data-dismiss="modal">Close</button>
						<input type="submit"  class="btn btn-primary" value="Send" >
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
		   $('#mo').val($(this).data('mo'));
		   $('#us').val($(this).data('us'));
		   $('#ma').val($(this).data('ma'));
		   $('#ad').val($(this).data('ad'));
		  
	    $("#accept").modal("show");
	  });
	  
	  
	  
	  
});
	  
	 


</script>
<jsp:include page="footer.jsp"></jsp:include>