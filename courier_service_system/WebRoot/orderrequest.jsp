<script type="text/javascript">
function val()
{
if(document.myForm.itemCharacter.value=="1")
{
alert("Select Item Character");
return false;
}

if(document.myForm.deliveryType.value=="1")
{
alert("Select Item Delivery Type");
return false;
}


}

</script>
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
					<h2 class="h-bold">Order Request Form</h2>
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

			<div class="row marginbot-80">
				<div class="col-md-8 col-md-offset-2">
				
						<form id="contact-form" class="wow bounceInUp" data-wow-offset="10" data-wow-delay="0.2s" action="./CustomerOrderRequest" onsubmit="return val();" name="myForm">
						
						
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<input type="text" class="form-control input-lg" id="subject" name="itemName" placeholder="Item Name" required="required" />
								</div>
													
								
							</div>
						</div>
						
						<div class="row marginbot-20">
							<div class="col-md-6 xs-marginbot-20">
								
								<select name="itemCharacter" class="form-control input-lg" >
								<option value="1">Select Item Chracter</option>
								<option>Delicate</option>
								<option>Not Delicate</option>
								</select>
							</div>
							<div class="col-md-6">
								<input type="text" class="form-control input-lg" id="email" placeholder="Weight"  name="weight" required="required" />
							</div>
						</div>
						
						
						
						
						<div class="row">
							<div class="col-md-12">
								
								<div class="form-group">
									<textarea id="message" name="sourceAddress" class="form-control" rows="4" cols="25" required="required"
										placeholder="Source Address"></textarea>
								</div>		
								
								<div class="form-group">
									<textarea name="destinationAddress" id="message" class="form-control" rows="4" cols="25" required="required"
										placeholder="destination Address"></textarea>
								</div>
										
									
								
								
								<div class="row">
							<div class="col-md-12">
								<div class="form-group">
								
								<select name="deliveryType" class="form-control input-lg" >
								<option value="1">Select Delivery Type</option>
								<option>Normal Delivery</option>
								<option>Quick Delivery</option>
								</select>
								
								</div>
													
								
							</div>
						</div>
								
								
							</div>		
								<button type="submit" class="btn btn-skin btn-lg btn-block" id="btnContactUs">
									Register</button>
							</div>
						</div>
						</form>
				</div>
			</div>	


		</div>
	</section>

<jsp:include page="footer.jsp"></jsp:include>