<jsp:include page="header.jsp"></jsp:include>

Registration Form

String status=request.getParameter("status"); if(status!=null) { out.println(status); }
Register


 <section id="contact" class="home-section nopadd-bot color-dark bg-white text-center">
		<div class="container marginbot-50">
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2">
					<div class="wow flipInY" data-wow-offset="0" data-wow-delay="0.4s">
					<div class="section-heading text-center">
					<h2 class="h-bold">Registration Form</h2>
					<div class="divider-header"></div>
					<font color="red"><b>
					<p>
					<%
					String status=request.getParameter("status");
					if(status!=null)
					{
					out.println(status);
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
				
						<form id="contact-form" class="wow bounceInUp" data-wow-offset="10" data-wow-delay="0.2s" action="./RegistrationServlet">
						
						
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
									<input type="text" class="form-control input-lg" id="subject" name="userName" placeholder="User Name" required="required" />
								</div>
													
								
							</div>
						</div>
						
						<div class="row marginbot-20">
							<div class="col-md-6 xs-marginbot-20">
								<input type="text" class="form-control input-lg" id="name" placeholder="User Id" name="userId" required="required" />
							</div>
							<div class="col-md-6">
								<input type="password" class="form-control input-lg" id="email" placeholder="Password"  name="password" required="required" />
							</div>
						</div>
						
						
						<div class="row marginbot-20">
							<div class="col-md-6 xs-marginbot-20">
								<input type="text" class="form-control input-lg" id="name" placeholder="Mobile" pattern="{1}[9-6]{9}[0-9]"  name="mobile" required="required" />
							</div>
							<div class="col-md-6">
								<input type="email" class="form-control input-lg" id="email" placeholder="Email" name="mail" required="required" />
							</div>
						</div>
						
						<div class="row">
							<div class="col-md-12">
								
								<div class="form-group">
									<textarea  id="message" name="address" class="form-control" rows="4" cols="25" required="required"
										placeholder="Address"></textarea>
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