<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Fees Details</title>
<style>
    body {
        text-align: center;
    }
    .container {
    
        border: 3px solid red;
        padding: 20px;
        margin: 100px auto;
    margin-top:5vh;
        width: 60%; /* Adjust the width as needed */
    }
    table {
        width: 100%;
        border-collapse: collapse;
    }
    th, td {
        padding: 8px;
        text-align: left;
    }
   
    th {
        background-color: #4CAF50; /* Green */
        color: white;
    }
    .total-row {
        background-color: #f44336; /* Red */
        color: white;
        font-weight: bold;
    }
    p {
        text-align: left;
        font-weight: bold;
    }
    .proceed-button {
        background-color: #4CAF50; /* Green */
        color: white;
        border: none;
        padding: 10px 20px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        margin-top: 20px;
        cursor: pointer;
    }
    #qrCodeImage {
        display: none; /* Initially hide the QR code image */
        max-width: 20%; /* Set maximum width for the QR code */
        margin: auto; /* Center the image horizontally */
    }
     .go-back-button {
        background-color: #f44336; /* Red */
        color: white;
        border: none;
        padding: 10px 20px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        margin-top: 20px;
        cursor: pointer;
    }
</style>
</head>
<body>
    <div class="container">
        <h1> Fees Details</h1>
        <form action="" method="post">
            <label for="regNo">Enter Registration Number:</label>
            <input type="text" id="regNo" name="regNo">
            <input type="submit" value="Search">
        </form>
        <br>
        <%
            String url = "jdbc:mysql://localhost:3306/finalproject";
            String username = "root";
            String dbPassword = "admin";
            
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            
            try {
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection(url, username, dbPassword);
                
                String regNo = request.getParameter("regNo");
                String query = "SELECT fees.*, student.student_name, student.branch, student.father_name FROM fees INNER JOIN student ON fees.reg_no = student.reg_no WHERE fees.reg_no=?";
                pstmt = conn.prepareStatement(query);
                pstmt.setString(1, regNo);
                rs = pstmt.executeQuery();
                
                if (rs.next()) {
                    double totalPendingFees = rs.getDouble("sem1_pending_fees") + rs.getDouble("sem2_pending_fees") +
                                               rs.getDouble("sem3_pending_fees") + rs.getDouble("sem4_pending_fees") +
                                               rs.getDouble("sem5_pending_fees") + rs.getDouble("sem6_pending_fees") +
                                               rs.getDouble("library_pending_fees");
        %>
        <p>Registration Number: <%= rs.getString("reg_no") %></p>
        <p>Student Name: <%= rs.getString("student_name") %></p>
        <p>Branch: <%= rs.getString("branch") %></p>
        <p>Father's Name: <%= rs.getString("father_name") %></p>
        <table border="1">
            <tr class="header">
                <th>Description</th>
                <th>Amount</th>
            </tr>
            <tr>
                <td>Semester 1 Pending Fees</td>
                <td><%= rs.getString("sem1_pending_fees") %></td>
            </tr>
            <tr>
                <td>Semester 2 Pending Fees</td>
                <td><%= rs.getString("sem2_pending_fees") %></td>
            </tr>
            <tr>
                <td>Semester 3 Pending Fees</td>
                <td><%= rs.getString("sem3_pending_fees") %></td>
            </tr>
            <tr>
                <td>Semester 4 Pending Fees</td>
                <td><%= rs.getString("sem4_pending_fees") %></td>
            </tr>
            <tr>
                <td>Semester 5 Pending Fees</td>
                <td><%= rs.getString("sem5_pending_fees") %></td>
            </tr>
            <tr>
                <td>Semester 6 Pending Fees</td>
                <td><%= rs.getString("sem6_pending_fees") %></td>
            </tr>
            <tr>
                <td>Library Pending Fees</td>
                <td><%= rs.getString("library_pending_fees") %></td>
            </tr>
            <tr class="total-row">
                <td>Total Pending Fees</td>
                <td><%= totalPendingFees %></td>
            </tr>
        </table>
         
        <button class="go-back-button" onclick="goBack()">Go Back</button>
        
        <button class="proceed-button" onclick="proceedToPayment()">Proceed to Payment</button>
        <img id="qrCodeImage" src="" alt="QR Code Image">
        <%
                } else {
        %>
        <h3 style="color: red;">No records found for the given registration number.</h3>
           <div class="link-container">
      <a href="studentonly.html">Back to Home Page</a>
    </div> <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (rs != null) {
                    try {
                        rs.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
                if (pstmt != null) {
                    try {
                        pstmt.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
                if (conn != null) {
                    try {
                        conn.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            }
        %>
    </div>
    <script>
        function proceedToPayment() {
            alert("Pending amount will be updated after 24hrs of successful payment.");
            var qrImagePath = "qrcode.jpeg";
            var qrImage = document.getElementById("qrCodeImage");
            qrImage.src = qrImagePath;
            qrImage.style.display = "block"; // Display the QR code image
        }

        function goBack() {
            window.location.href = "studentonly.html"; // Redirect to studentonly.html
        }
    </script>
</body>
</html>
