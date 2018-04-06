<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<title>My Cars</title>
</head>

	<%!
		public String username;
	%>
	
	<% 
		username = request.getParameter("username");
	%>

<body>

<div class="container">
		<div class="row" style="margin-top: 20px">
			<div class="col-xs-12 col-sm-8 col-md-12 col-sm-offset-2 col-md-offset-3">
				<h1>My Cars</h1>
				
			
				<% 
				try{
					//Get the database connection
					ApplicationDB db = new ApplicationDB();
					Connection con = db.getConnection();

					//Create a SQL statement
					Statement stmt = con.createStatement();
					
					String str = "SELECT C.car_id, C.make, C.model, C.color, C.carYear, C.cond, C.carType, L.sale_num, L.price, L.date_posted ";
					str += "FROM Car As C, Listing As L WHERE C.car_id = L.car_id AND L.seller_id = \"";
					str += username + "\" ORDER BY date_posted";
					
					ResultSet result = stmt.executeQuery(str);
					
					out.print("<table class=\"table\">");
					out.print("<thead>");
					out.print("<tr>");
					out.print("<th scope=\"col\">Listing Number</th>");
					out.print("<th scope=\"col\">VIN Number</th>");
					out.print("<th scope=\"col\">Make</th>");
					out.print("<th scope=\"col\">Model</th>");
					out.print("<th scope=\"col\">Color</th>");
					out.print("<th scope=\"col\">Year</th>");
					out.print("<th scope=\"col\">Condition</th>");
					out.print("<th scope=\"col\">Type</th>");
					out.print("<th scope=\"col\">Price</th>");
					out.print("<th scope=\"col\">Date Posted</th>");
					out.print("</tr></thead>");
					
					out.print("<tbody>");
					while(result.next()){
						//Row
						out.print("<tr>");
						//Columns
						out.print("<td>");
						out.print(result.getString("sale_num"));
						out.print("</td>");
						
						out.print("<td>");
						out.print(result.getString("car_id"));
						out.print("</td>");
						
						out.print("<td>");
						out.print(result.getString("make"));
						out.print("</td>");
						
						out.print("<td>");
						out.print(result.getString("model"));
						out.print("</td>");
						
						out.print("<td>");
						out.print(result.getString("color"));
						out.print("</td>");
						
						out.print("<td>");
						out.print(result.getString("carYear"));
						out.print("</td>");
						
						out.print("<td>");
						out.print(result.getString("cond"));
						out.print("</td>");
						
						out.print("<td>");
						out.print(result.getString("carType"));
						out.print("</td>");
						
						out.print("<td>");
						out.print(result.getString("price"));
						out.print("</td>");
						
						out.print("<td>");
						out.print(result.getString("date_posted"));
						out.print("</td>");
						
						out.print("</tr>");
					}
					out.print("</tbody></table>");
					con.close();
				}catch (Exception e) {
					out.print("<div class=\"container\">");
					out.print("<div class=\"row\" style=\"margin-top: 20px\">");
					out.print("<div class=\"col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3\">");
					out.print("<div class=\"alert alert-danger alert-dismissible fade show\" role=\"alert\">");
					out.print("<strong>No cars to display!</strong>!");
					out.print(e);
					out.print("<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">");
					out.print("<span aria-hidden=\"true\">&times;</span>");   
					out.print("</button>");
					out.print("</div>");
					out.print("</div>");
					out.print("</div>");
					out.print("</div>");
				}
				
				
				%>
				
				
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row" style="margin-top: 20px">
			<div class="col-xs-12 col-sm-8 col-md-12 col-sm-offset-2 col-md-offset-3">
				<form role="form" method="post">
					<fieldset>
						<h3>Enter the Listing Number you wish to delete below:</h3>
						<div class="row">
							<div class="col-xs-6 col-sm-6 col-md-6">
								<div class="form-group">
									<input type="text" class="form-control input-lg" id="sale_num" name="sale_num" placeholder="Listing Number" pattern= "^.{1,}$" required/>
								</div>
							</div>
							
							<div class="col-xs-6 col-sm-6 col-md-6">
								<input type="submit" name="delete" class="btn btn-sm btn-danger btn-block" value="Delete">
							</div>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
	<%
		if(request.getParameter("delete") != null){
			try{
				//Get the database connection
				ApplicationDB db = new ApplicationDB();
				Connection con = db.getConnection();
	
				//Create a SQL statement
				
				
				String saleNum = request.getParameter("sale_num");
				String deletion = "DELETE FROM Car WHERE Car.car_id IN (SELECT car_id FROM Listing WHERE sale_num = ? AND seller_id = ?)";
				
				PreparedStatement ps = con.prepareStatement(deletion);
				
				ps.setInt(1, Integer.parseInt(saleNum));
				ps.setString(2, username);
				
				ps.executeUpdate();
				
				out.print("<div class=\"container\">");
				out.print("<div class=\"row\" style=\"margin-top: 20px\">");
				out.print("<div class=\"col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3\">");
				out.print("<div class=\"alert alert-success alert-dismissible fade show\" role=\"alert\">");
				out.print("<strong>Deletion Successful</strong>! Click <a href=\"index.jsp\" class=\"alert-link\">here</a> to log in.");
				out.print("<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">");
				out.print("<span aria-hidden=\"true\">&times;</span>");   
				out.print("</button>");
				out.print("</div>");
				out.print("</div>");
				out.print("</div>");
				out.print("</div>");
				
				con.close();
			}catch(Exception e){
				out.print("<div class=\"container\">");
				out.print("<div class=\"row\" style=\"margin-top: 20px\">");
				out.print("<div class=\"col-xs-12 col-sm-8 col-md-6 col-sm-offset-2 col-md-offset-3\">");
				out.print("<div class=\"alert alert-danger alert-dismissible fade show\" role=\"alert\">");
				out.print("<strong>Deletion Failed</strong>!");
				out.print(e);
				out.print("<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">");
				out.print("<span aria-hidden=\"true\">&times;</span>");   
				out.print("</button>");
				out.print("</div>");
				out.print("</div>");
				out.print("</div>");
				out.print("</div>");
			}
		}
	
	%>
	

	<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</body>
</html>