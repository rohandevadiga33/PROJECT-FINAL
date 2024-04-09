<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Fees Details</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
    }
    .container {
        max-width: 80%;
         margin: 100px auto;
    margin-top:18vh;        padding: 20px;
        background-color: #FFFDD0;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    h2 {
        text-align: center;
    }
    table {
        width: 100%;
        border-collapse: collapse;
    }
    th, td {
        padding: 10px;
        text-align: left;
        border-bottom: 1px solid #ddd;
    }
    th {
        background-color: #f2f2f2;
    }
    input[type="text"]{
        padding: 8px;
        margin-bottom: 10px;
        width: 100%;
        box-sizing: border-box;
    }
     input[type="button"] {
        padding: 8px;
        margin-bottom: 10px;
                box-sizing: border-box;
        align-items: center;
        width:10%;
     }
    .small-button {
        padding: 5px 10px;
        font-size: 14px;
        border: none;
        border-radius: 5px;
        background-color: #4CAF50; /* Green */
        color: white;
        cursor: pointer;
    }
    .back-button {
        padding: 5px 10px;
        font-size: 14px;
        border: none;
        border-radius: 5px;
        background-color: #f44336; /* Red */
        color: white;
        cursor: pointer;
    }
     body, html {
        margin: 0; /* Remove default margin */
        padding: 0; /* Remove default padding */
        height: 100%; /* Ensure full height */
    }

    .wrapper {
        min-height: 100%; /* Ensure wrapper takes full height */
        position: relative; /* Set position to relative */
    }

    .footer {
        background-color: #333; /* Dark background color */
        color: #fff; /* Text color */
        padding: 20px; /* Padding for the footer */
        text-align: center; /* Center align text */
        display: flex; /* Use flexbox for layout */
        justify-content: space-between; /* Space elements evenly */
        align-items: center; /* Center align vertically */
        position: absolute; /* Absolute positioning */
        bottom: 0; /* Stick to the bottom */
        width: 100%; /* Full width */
    }

    .footer p {
        margin: 10px 0; /* Margin for each paragraph */
    }

    .footer a {
        color: #fff; /* Link color */
        text-decoration: none; /* Remove underline */
    }

    .footer a:hover {
        text-decoration: underline; /* Add underline on hover */
    }

    .footer .affiliation img {
        width: 100px; /* Adjust size of affiliation image */
    }

    .footer .social-links a {
        display: inline-block; /* Display links inline */
        margin: 0 8px; /* Margin between links */
    }

    .footer .social-links img {
        width: 30px; /* Adjust size of social media icons */
        height: 30px;
        border-radius: 50%; /* Make icons round */
    }

    .footer .social-links a:first-child {
        margin-left: 0; /* Remove left margin for the first social link */
    }

    .footer .social-links a:last-child {
        margin-right: 80px; /* Remove right margin for the last social link */
    }

    .copy-right {
        color: #fff; /* Text color */
        font-size: 14px; /* Font size */
        margin-top: 20px; /* Margin from the top */
    }
</style>
<script>
    function searchStudent() {
        document.getElementById("searchForm").submit();
    }

    function updateFees() {
        document.getElementById("updateForm").submit();
    }

    function goBack() {
        window.location.href = "managefees.jsp"; // Redirect to managefees.jsp
    }

    function showAlertAndRedirect(message) {
        alert(message);
        window.location.href = "updatefees.jsp"; // Redirect to updatefees.jsp
    }
   
</script>
</head>
<body>
    <div id="headerContainer"></div>

    <div class="container">
        <h2>Update Fees Details</h2>
        <form action="" method="get" id="searchForm">
            <label for="reg_no">Search by Registration Number:</label>
            <input type="text" id="reg_no" name="reg_no">
            <input type="button" class="small-button" value="Search" onclick="searchStudent()">
            <input type="button" class="back-button" value="Back" onclick="goBack()">
        </form>

        <% 
            String regNo = request.getParameter("reg_no");
            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;

            // Establishing database connection
            String url = "jdbc:mysql://localhost:3306/finalproject";
            String username = "root";
            String dbPassword = "admin";

            try {
                Class.forName("com.mysql.jdbc.Driver");
                conn = DriverManager.getConnection(url, username, dbPassword);

                if (regNo != null && !regNo.isEmpty()) {
                    // Fetching student details if registration number is provided
                    stmt = conn.prepareStatement("SELECT * FROM fees WHERE reg_no = ?");
                    stmt.setString(1, regNo);
                    rs = stmt.executeQuery();

                    if (rs.next()) {
        %>
        <form action="" method="post" id="updateForm">
            <table border="1">
                <tr>
                    <th>Registration Number</th>
                    <th>Semester 1 Pending Fees</th>
                    <th>Semester 2 Pending Fees</th>
                    <th>Semester 3 Pending Fees</th>
                    <th>Semester 4 Pending Fees</th>
                    <th>Semester 5 Pending Fees</th>
                    <th>Semester 6 Pending Fees</th>
                    <th>Library Pending Fees</th>
                </tr>
                <tr>
                    <td><%= rs.getString("reg_no") %></td>
                    <td><input type="text" name="sem1_pending_fees" value="<%= rs.getString("sem1_pending_fees") %>"></td>
                    <td><input type="text" name="sem2_pending_fees" value="<%= rs.getString("sem2_pending_fees") %>"></td>
                    <td><input type="text" name="sem3_pending_fees" value="<%= rs.getString("sem3_pending_fees") %>"></td>
                    <td><input type="text" name="sem4_pending_fees" value="<%= rs.getString("sem4_pending_fees") %>"></td>
                    <td><input type="text" name="sem5_pending_fees" value="<%= rs.getString("sem5_pending_fees") %>"></td>
                    <td><input type="text" name="sem6_pending_fees" value="<%= rs.getString("sem6_pending_fees") %>"></td>
                    <td><input type="text" name="library_pending_fees" value="<%= rs.getString("library_pending_fees") %>"></td>
                </tr>
            </table>
            <input type="hidden" name="reg_no" value="<%= rs.getString("reg_no") %>">
            <input type="button" class="small-button" value="Update" onclick="updateFees()">
        </form>
        <% 
                    } else {
                        // If no student found with given registration number
                        out.println("<script>alert('Student not found.');</script>");
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                // Closing database resources
                try {
                    if (rs != null) rs.close();
                    if (stmt != null) stmt.close();
                    if (conn != null) conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        %>

        <% 
            if (request.getMethod().equalsIgnoreCase("post")) {
                try {
                    // Re-establish database connection
                    conn = DriverManager.getConnection(url, username, dbPassword);

                    String sem1PendingFees = request.getParameter("sem1_pending_fees");
                    String sem2PendingFees = request.getParameter("sem2_pending_fees");
                    String sem3PendingFees = request.getParameter("sem3_pending_fees");
                    String sem4PendingFees = request.getParameter("sem4_pending_fees");
                    String sem5PendingFees = request.getParameter("sem5_pending_fees");
                    String sem6PendingFees = request.getParameter("sem6_pending_fees");
                    String libraryPendingFees = request.getParameter("library_pending_fees");

                    // Update query
                    String updateSql = "UPDATE fees SET sem1_pending_fees=?, sem2_pending_fees=?, sem3_pending_fees=?, sem4_pending_fees=?, sem5_pending_fees=?, sem6_pending_fees=?, library_pending_fees=? WHERE reg_no=?";
                    stmt = conn.prepareStatement(updateSql);
                    stmt.setString(1, sem1PendingFees);
                    stmt.setString(2, sem2PendingFees);
                    stmt.setString(3, sem3PendingFees);
                    stmt.setString(4, sem4PendingFees);
                    stmt.setString(5, sem5PendingFees);
                    stmt.setString(6, sem6PendingFees);
                    stmt.setString(7, libraryPendingFees);
                    stmt.setString(8, regNo);

                    // Execute update
                    int rowsAffected = stmt.executeUpdate();
                    
                    if (rowsAffected > 0) {
                        out.println("<script>showAlertAndRedirect('Fees details updated successfully.');</script>");
                    } else {
                        out.println("<script>showAlertAndRedirect('Failed to update fees details.');</script>");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    // Closing database resources
                    try {
                        if (stmt != null) stmt.close();
                        if (conn != null) conn.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            }
        %>
    </div>
         <div id="footerContainer"></div>

    <script>
        // Function to load external file contents
        function loadFile(url, containerId) {
            var container = document.getElementById(containerId);
            var xhr = new XMLHttpRequest();
            xhr.open('GET', url, true);
            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    container.innerHTML = xhr.responseText;
                }
            };
            xhr.send();
        }

        // Load header and footer
        loadFile('headeradmin.html', 'headerContainer');
       // loadFile('footer1.html', 'footerContainer');
    </script>
      <div class="wrapper">
        <footer class="footer">
            <div class="affiliation">
                <img src="karnataka.png" alt="Karnataka Affiliation">
                <p>Department of Technical Education, Karnataka</p>
            </div>
            <div class="contact-info">
                <p>Dr. TMA Pai Polytechnic</p>
                <p>MIT Campus Eshwar Nagar Manipal 576104, Karnataka</p>
                <p>Email: manipal.polytech@gmail.com</p>
                <p>Phone: 9901476678</p>
                <p>&copy; 2024 College Name. All rights reserved</p>
            </div>
            <div class="social-links">
                <a href="https://www.instagram.com/tmapaipolytechnic/" target="_blank"><img src="instalogo.jpg" alt="Instagram"></a>
                <a href="https://www.facebook.com/p/DrT-M-A-Pai-Polytechnic-Manipal-100066598946326/" target="_blank"><img src="facebooklogo.png" alt="Facebook"></a>
                <a href="https://www.linkedin.com/company/drtmapaipolytechnic" target="_blank"><img src="linkedinlogo.jpg" alt="LinkedIn"></a>
            </div>
        </footer>
    </div>
    <script>
  function confirmLogout() {
      return confirm("You are loging out!");
  }
</script>
</body>
</html>
