<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.DateFormat"%>
<%@ page import="java.text.SimpleDateFormat"%>

<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<link href="./css/renting.css" rel="stylesheet">
<title>Mehtallica</title>
</head>

	<%!
		public String username;
	%>

	<% 
		username = request.getParameter("username");
	%>

	<%! 
		public int sedanInventory;
		public void success(JspWriter out) throws IOException {
			out.print("<div class=\"alert alert-success alert-dismissible fade show\" role=\"alert\" style=\"position: absolute; top: 0px;\">");
			out.print("<strong>Booking Successful</strong>");
			out.print("<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">");
			out.print("<span aria-hidden=\"true\">&times;</span>");   
			out.print("</button>");
			out.print("</div>");
		}
		public void failure(JspWriter out) throws IOException {
			out.print("<div class=\"alert alert-danger alert-dismissible fade show\" role=\"alert\" style=\"position: absolute; top: 0px;\">");
			out.print("<strong>Booking Failed.</strong> Please try again!");
			out.print("<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">");
			out.print("<span aria-hidden=\"true\">&times;</span>");   
			out.print("</button>");
			out.print("</div>");
		}
		public void outOfStock(JspWriter out) throws IOException {
			out.print("<div class=\"alert alert-danger alert-dismissible fade show\" role=\"alert\" style=\"position: absolute; top: 0px;\">");
			out.print("<strong>Booking Failed - Out of Stock.</strong>");
			out.print("<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">");
			out.print("<span aria-hidden=\"true\">&times;</span>");   
			out.print("</button>");
			out.print("</div>");
		}
		public void criteria(JspWriter out) throws IOException {
			out.print("<div class=\"alert alert-danger alert-dismissible fade show\" role=\"alert\" style=\"position: absolute; top: 0px;\">");
			out.print("<strong>Booking Failed - 2 Cars already rented.</strong>");
			out.print("<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">");
			out.print("<span aria-hidden=\"true\">&times;</span>");   
			out.print("</button>");
			out.print("</div>");
		}
		public void ageNotMet(JspWriter out) throws IOException {
			out.print("<div class=\"alert alert-danger alert-dismissible fade show\" role=\"alert\" style=\"position: absolute; top: 0px;\">");
			out.print("<strong>Booking Failed - Must be 25 years old.</strong>");
			out.print("<button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\">");
			out.print("<span aria-hidden=\"true\">&times;</span>");   
			out.print("</button>");
			out.print("</div>");
		}
	%>

<% if (username != null) { %>
<body>
	<div class="pricing-""e""
				<div class="card-header">
					<h4 class="my-0 font-weight-normal">Coupe</h4>
				</div>
				<img class="card-img-top" src="./images/coupe.png"
					alt="Card image coupe">
				<div class="card-body">
					<h1 class="card-title pricing-card-title">
						$60 <small class="text-muted">/ day</small>
					</h1>
					<ul class="list-unstyled mt-3 mb-4">
						<li>Up to 3 passengers</li>
						<li>Automatic or Manual Drive</li>
						<li>For sporty commutes</li>
						<li>Up to 300 HP</li>
					</ul>
					<form role="form" method="post">
						<button type="submit" class="btn btn-lg btn-block btn-primary"
							name="coupeSelect">Select</button>
					</form>
				</div>
			</div>
			<div class="card mb-4 box-shadow">
				<div class="card-header">
					<h4 class="my-0 font-weight-normal">SUV</h4>
				</div>
				<img class="card-img-top" src="./images/suv.png"
					alt="Card image coupe">
				<div class="card-body">
					<h1 class="card-title pricing-card-title">
						$75 <small class="text-muted">/ day</small>
					</h1>
					<ul class="list-unstyled mt-3 mb-4">
						<li>Up to 4 passengers</li>
						<li>Automatic Drive</li>
						<li>For comfortable commutes</li>
						<li>Up to 250 HP</li>
					</ul>
					<form role="form" method="post">
						<button type="submit" class="btn btn-lg btn-block btn-primary"
							name="SUVSelect">Select</button>
					</form>
				</div>
			</div>
			<div class="card mb-4 box-shadow">
				<div class="card-header">
					<h4 class="my-0 font-weight-normal">Minivan</h4>
				</div>
				<img class="card-img-top" src="./images/minivan.png"
					alt="Card image coupe">
				<div class="card-body">
					<h1 class="card-title pricing-card-title">
						$90 <small class="text-muted">/ day</small>
					</h1>
					<ul class="list-unstyled mt-3 mb-4">
						<li>Up to 6 passengers</li>
						<li>Automatic Drive</li>
						<li>For spacious commutes</li>
						<li>Up to 225 HP</li>
					</ul>
					<form role="form" method="post">
						<button type="submit" class="btn btn-lg btn-block btn-primary"
							name="minivanSelect">Select</button>
					</form>
				</div>
			</div>
			<div class="card mb-4 box-shadow">
				<div class="card-header">
					<h4 class="my-0 font-weight-normal">Pick-up Truck</h4>
				</div>
				<img class="card-img-top" src="./images/pickup.png"
					alt="Card image coupe">
				<div class="card-body">
					<h1 class="card-title pricing-card-title">
						$115 <small class="text-muted">/ day</small>
					</h1>
					<ul class="list-unstyled mt-3 mb-4">
						<li>Up to 4 passengers</li>
						<li>Automatic or Manual Drive</li>
						<li>For tough jobs</li>
						<li>Up to 450 HP</li>
					</ul>
					<form role="form" method="post">
						<button type="submit" class="btn btn-lg btn-block btn-primary"
							name="pickupSelect">Select</button>
					</form>
				</div>
			</div>
			<div class="card mb-4 box-shadow">
				<div class="card-header">
					<h4 class="my-0 font-weight-normal">Luxury</h4>
				</div>
				<img class="card-img-top" src="./images/luxury.png"
					alt="Card image coupe">
				<div class="card-body">
					<h1 class="card-title pricing-card-title">
						$150+ <small class="text-muted">/ day</small>
					</h1>
					<ul class="list-unstyled mt-3 mb-4">
						<li>Up to 1 passengers</li>
						<li>Automatic or Manual Drive</li>
						<li>For the ultimate experience</li>
						<li>Up to 600 HP</li>
					</ul>
					<button type="button" class="btn btn-lg btn-block btn-primary"
						data-toggle="modal" data-target="#luxuryModal">Contact us</button>
				</div>
			</div>
		</div>
	</div>
	
	<!--Luxury Modal -->
	<div class="modal fade" id="luxuryModal" tabindex="-1" role="dialog" aria-labelledby="luxuryModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="luxuryModalLabel">Luxury Option</h5>
	        
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	      	<p class="lead">Please contact us at: (732)-997-9395 to book a Luxury Rental.</p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	      </div>
	    </div>
	  </div>
	</div>

	<%
    		if (request.getParameter("sedanSelect") != null) {
    			try {
    				//Get the database connection
	    			ApplicationDB db = new ApplicationDB();
	    			Connection con = db.getConnection();

	    			//Create a SQL statement
	    			Statement stmt = con.createStatement();
	    			String str = "SELECT inventory FROM Car WHERE Car.car_id=\"sedanforrent11111\"";
	    			//Run the query against the database.
	    			ResultSet result = stmt.executeQuery(str);
	    			
	    			result.next();
	    			int inventory = Integer.parseInt(result.getString("inventory"));
	    			
	    			str = "SELECT COUNT(renter_id) As Total FROM Rental WHERE renter_id='"+username+"'";
	    			result = stmt.executeQuery(str);
	    			result.next();
	    			int rent_count = Integer.parseInt(result.getString("Total"));
	    			
	    			str = "SELECT age FROM User WHERE username='"+username+"'";
	    			result = stmt.executeQuery(str);
	    			result.next();
	    			int age = Integer.parseInt(result.getString("age"));
    				
	    			if (inventory > 0 && rent_count < 2 && age > 24) {
		    			String rentalInsert = "INSERT INTO Rental(rental_num, car_id, renter_id, out_date) VALUES(?, ?, ?, ?)";
		    			PreparedStatement ps = con.prepareStatement(rentalInsert);
		    			
		    			String counter = "SELECT COUNT(rental_num) As Counter FROM Rental";
					ResultSet countInit = stmt.executeQuery(counter);
					countInit.next();
					int rent_num = Integer.parseInt(countInit.getString("Counter"));
					rent_num++;
		    			
		    			ps.setString(1, Integer.toString(rent_num));
		    			ps.setString(2, "sedanforrent11111");
		    			ps.setString(3, username);
		    			DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
					Date date = new Date();
					ps.setString(4, dateFormat.format(date)); //2016/11/16
		    			ps.executeUpdate();
					
		    			str = "UPDATE Car Set inventory = inventory - 1 WHERE Car.car_id=\"sedanforrent11111\"";
		    			//Run the query against the database.
		    			stmt.executeUpdate(str);
		    			
		    			success(out);
	    			}
	    			else if (inventory == 0) {
	    				outOfStock(out);
	    			}
	    			else if (rent_count > 1) {
	    				criteria(out);
	    			}
	    			else if (age < 24) {
	    				ageNotMet(out);
	    			}
	    			
	    			//close the connection.
	    			con.close();

	    		} catch (Exception e) {
	    			failure(out);
	    			System.out.println(e);
	    		}
    		}
    %>
    
    <%
    		if (request.getParameter("coupeSelect") != null) {
    			try {
    				//Get the database connection
	    			ApplicationDB db = new ApplicationDB();
	    			Connection con = db.getConnection();

	    			//Create a SQL statement
	    			Statement stmt = con.createStatement();
	    			String str = "SELECT inventory FROM Car WHERE Car.car_id=\"coupeforrent22222\"";
	    			//Run the query against the database.
	    			ResultSet result = stmt.executeQuery(str);
	    			
	    			result.next();
	    			int inventory = Integer.parseInt(result.getString("inventory"));
	    			
	    			str = "SELECT COUNT(renter_id) As Total FROM Rental WHERE renter_id='"+username+"'";
	    			result = stmt.executeQuery(str);
	    			result.next();
	    			int rent_count = Integer.parseInt(result.getString("Total"));
	    			
	    			str = "SELECT age FROM User WHERE username='"+username+"'";
	    			result = stmt.executeQuery(str);
	    			result.next();
	    			int age = Integer.parseInt(result.getString("age"));
    				
	    			if (inventory > 0 && rent_count < 2 && age > 24) {
		    			String rentalInsert = "INSERT INTO Rental(rental_num, car_id, renter_id, out_date) VALUES(?, ?, ?, ?)";
		    			PreparedStatement ps = con.prepareStatement(rentalInsert);
		    			
		    			String counter = "SELECT COUNT(rental_num) As Counter FROM Rental";
					ResultSet countInit = stmt.executeQuery(counter);
					countInit.next();
					int rent_num = Integer.parseInt(countInit.getString("Counter"));
					rent_num++;
		    			
		    			ps.setString(1, Integer.toString(rent_num));
		    			ps.setString(2, "coupeforrent22222");
		    			ps.setString(3, username);
		    			DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
					Date date = new Date();
					ps.setString(4, dateFormat.format(date)); //2016/11/16
		    			ps.executeUpdate();
					
		    			str = "UPDATE Car Set inventory = inventory - 1 WHERE Car.car_id=\"coupeforrent22222\"";
		    			//Run the query against the database.
		    			stmt.executeUpdate(str);
		    			
		    			success(out);
	    			}
	    			else if (inventory == 0) {
	    				outOfStock(out);
	    			}
	    			else if (rent_count > 1) {
	    				criteria(out);
	    			}
	    			else if (age < 24) {
	    				ageNotMet(out);
	    			}
	    			
	    			//close the connection.
	    			con.close();

	    		} catch (Exception e) {
	    			failure(out);
	    			System.out.println(e);
	    		}
    		}
    %>
    
    <%
    		if (request.getParameter("SUVSelect") != null) {
    			try {
    				//Get the database connection
	    			ApplicationDB db = new ApplicationDB();
	    			Connection con = db.getConnection();

	    			//Create a SQL statement
	    			Statement stmt = con.createStatement();
	    			String str = "SELECT inventory FROM Car WHERE Car.car_id=\"SUVforrent3333333\"";
	    			//Run the query against the database.
	    			ResultSet result = stmt.executeQuery(str);
	    			
	    			result.next();
	    			int inventory = Integer.parseInt(result.getString("inventory"));
	    			
	    			str = "SELECT COUNT(renter_id) As Total FROM Rental WHERE renter_id='"+username+"'";
	    			result = stmt.executeQuery(str);
	    			result.next();
	    			int rent_count = Integer.parseInt(result.getString("Total"));
	    			
	    			str = "SELECT age FROM User WHERE username='"+username+"'";
	    			result = stmt.executeQuery(str);
	    			result.next();
	    			int age = Integer.parseInt(result.getString("age"));
    				
	    			if (inventory > 0 && rent_count < 2 && age > 24) {
		    			String rentalInsert = "INSERT INTO Rental(rental_num, car_id, renter_id, out_date) VALUES(?, ?, ?, ?)";
		    			PreparedStatement ps = con.prepareStatement(rentalInsert);
		    			
		    			String counter = "SELECT COUNT(rental_num) As Counter FROM Rental";
					ResultSet countInit = stmt.executeQuery(counter);
					countInit.next();
					int rent_num = Integer.parseInt(countInit.getString("Counter"));
					rent_num++;
		    			
		    			ps.setString(1, Integer.toString(rent_num));
		    			ps.setString(2, "SUVforrent3333333");
		    			ps.setString(3, username);
		    			DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
					Date date = new Date();
					ps.setString(4, dateFormat.format(date)); //2016/11/16
		    			ps.executeUpdate();
					
		    			str = "UPDATE Car Set inventory = inventory - 1 WHERE Car.car_id=\"SUVforrent3333333\"";
		    			//Run the query against the database.
		    			stmt.executeUpdate(str);
		    			
		    			success(out);
	    			}
	    			else if (inventory == 0) {
	    				outOfStock(out);
	    			}
	    			else if (rent_count > 1) {
	    				criteria(out);
	    			}
	    			else if (age < 24) {
	    				ageNotMet(out);
	    			}
	    			
	    			//close the connection.
	    			con.close();

	    		} catch (Exception e) {
	    			failure(out);
	    			System.out.println(e);
	    		}
    		}
    %>

	<%
    		if (request.getParameter("minivanSelect") != null) {
    			try {
    				//Get the database connection
	    			ApplicationDB db = new ApplicationDB();
	    			Connection con = db.getConnection();

	    			//Create a SQL statement
	    			Statement stmt = con.createStatement();
	    			String str = "SELECT inventory FROM Car WHERE Car.car_id=\"minivanforrent444\"";
	    			//Run the query against the database.
	    			ResultSet result = stmt.executeQuery(str);
	    			
	    			result.next();
	    			int inventory = Integer.parseInt(result.getString("inventory"));
	    			
	    			str = "SELECT COUNT(renter_id) As Total FROM Rental WHERE renter_id='"+username+"'";
	    			result = stmt.executeQuery(str);
	    			result.next();
	    			int rent_count = Integer.parseInt(result.getString("Total"));
	    			
	    			str = "SELECT age FROM User WHERE username='"+username+"'";
	    			result = stmt.executeQuery(str);
	    			result.next();
	    			int age = Integer.parseInt(result.getString("age"));
    				
	    			if (inventory > 0 && rent_count < 2 && age > 24) {
		    			String rentalInsert = "INSERT INTO Rental(rental_num, car_id, renter_id, out_date) VALUES(?, ?, ?, ?)";
		    			PreparedStatement ps = con.prepareStatement(rentalInsert);
		    			
		    			String counter = "SELECT COUNT(rental_num) As Counter FROM Rental";
					ResultSet countInit = stmt.executeQuery(counter);
					countInit.next();
					int rent_num = Integer.parseInt(countInit.getString("Counter"));
					rent_num++;
		    			
		    			ps.setString(1, Integer.toString(rent_num));
		    			ps.setString(2, "minivanforrent444");
		    			ps.setString(3, username);
		    			DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
					Date date = new Date();
					ps.setString(4, dateFormat.format(date)); //2016/11/16
		    			ps.executeUpdate();
					
		    			str = "UPDATE Car Set inventory = inventory - 1 WHERE Car.car_id=\"minivanforrent444\"";
		    			//Run the query against the database.
		    			stmt.executeUpdate(str);
		    			
		    			success(out);
	    			}
	    			else if (inventory == 0) {
	    				outOfStock(out);
	    			}
	    			else if (rent_count > 1) {
	    				criteria(out);
	    			}
	    			else if (age < 24) {
	    				ageNotMet(out);
	    			}
	    			
	    			//close the connection.
	    			con.close();

	    		} catch (Exception e) {
	    			failure(out);
	    			System.out.println(e);
	    		}
    		}
    %>
    
    <%
    		if (request.getParameter("pickupSelect") != null) {
    			try {
    				//Get the database connection
	    			ApplicationDB db = new ApplicationDB();
	    			Connection con = db.getConnection();

	    			//Create a SQL statement
	    			Statement stmt = con.createStatement();
	    			String str = "SELECT inventory FROM Car WHERE Car.car_id=\"pickupforrent5555\"";
	    			//Run the query against the database.
	    			ResultSet result = stmt.executeQuery(str);
	    			
	    			result.next();
	    			int inventory = Integer.parseInt(result.getString("inventory"));
	    			
	    			str = "SELECT COUNT(renter_id) As Total FROM Rental WHERE renter_id='"+username+"'";
	    			result = stmt.executeQuery(str);
	    			result.next();
	    			int rent_count = Integer.parseInt(result.getString("Total"));
	    			
	    			str = "SELECT age FROM User WHERE username='"+username+"'";
	    			result = stmt.executeQuery(str);
	    			result.next();
	    			int age = Integer.parseInt(result.getString("age"));
    				
	    			if (inventory > 0 && rent_count < 2 && age > 24) {
		    			String rentalInsert = "INSERT INTO Rental(rental_num, car_id, renter_id, out_date) VALUES(?, ?, ?, ?)";
		    			PreparedStatement ps = con.prepareStatement(rentalInsert);
		    			
		    			String counter = "SELECT COUNT(rental_num) As Counter FROM Rental";
					ResultSet countInit = stmt.executeQuery(counter);
					countInit.next();
					int rent_num = Integer.parseInt(countInit.getString("Counter"));
					rent_num++;
		    			
		    			ps.setString(1, Integer.toString(rent_num));
		    			ps.setString(2, "pickupforrent5555");
		    			ps.setString(3, username);
		    			DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
					Date date = new Date();
					ps.setString(4, dateFormat.format(date)); //2016/11/16
		    			ps.executeUpdate();
					
		    			str = "UPDATE Car Set inventory = inventory - 1 WHERE Car.car_id=\"pickupforrent5555\"";
		    			//Run the query against the database.
		    			stmt.executeUpdate(str);
		    			
		    			success(out);
	    			}
	    			else if (inventory == 0) {
	    				outOfStock(out);
	    			}
	    			else if (rent_count > 1) {
	    				criteria(out);
	    			}
	    			else if (age < 24) {
	    				ageNotMet(out);
	    			}
	    			
	    			//close the connection.
	    			con.close();

	    		} catch (Exception e) {
	    			failure(out);
	    			System.out.println(e);
	    		}
    		}
    %>
    <% } else { %>
    
    
    <body class="text-center" style="height: 100%; display: -ms-flexbox;
		  display: -webkit-box;
		  display: flex;
		  -ms-flex-align: center;
		  -ms-flex-pack: center;
		  -webkit-box-align: center;
		  align-items: center;
		  -webkit-box-pack: center;
		  justify-content: center;
		  padding-top: 40px;
		  padding-bottom: 40px;
		  background-color: #f5f5f5;">
  	<form class="form-signin" method="post" action="index.jsp">
      <h1 class="h3 mb-3 font-weight-normal">Please log in before renting</h1>
      <button class="btn btn-lg btn-primary btn-block" type="submit">Click here to log in</button>
    </form>
    
    
    <% } %>

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
</body>
</html>