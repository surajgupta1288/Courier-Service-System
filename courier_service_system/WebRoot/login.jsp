<jsp:include page="header.jsp"></jsp:include>


 <section id="contact" class="home-section nopadd-bot color-dark bg-white text-center">
		<div class="container marginbot-50">
			<div class="row">
				<div class="col-lg-8 col-lg-offset-2">
					<div class="wow flipInY" data-wow-offset="0" data-wow-delay="0.4s">
					<div class="section-heading text-center">
					<h2 class="h-bold">Login Form</h2>
					<div class="divider-header"></div>
					<font color="red"><b>
					<p>
				
 
					<%
					String status=request.getParameter("status");
					if(status!=null)
					{
					out.println("<div class='alert alert-danger'>"+status+" </div>");
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
						<form id="contact-form" class="wow bounceInUp" data-wow-offset="10" data-wow-delay="0.2s" action="./LoginServlet">
						
						<div class="row">
							<div class="col-md-12">
								<div class="form-group">
										<input type="text" class="form-control input-lg" id="subject" placeholder="user id" name="userId" required="required" />
								</div>
								<div class="form-group">
										<input type="password" class="form-control input-lg" id="subject" placeholder="password" name="password" required="required" />
								</div>						
								<button type="submit" class="btn btn-skin btn-lg btn-block" id="btnContactUs">
									Login</button>
							</div>
						</div>
						</form>
				</div>
			</div>	


		</div>
	</section>

<jsp:include page="footer.jsp"></jsp:include>