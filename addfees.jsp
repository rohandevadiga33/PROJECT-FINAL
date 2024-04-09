<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Fees Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 500px;
         margin: 100px auto;
    margin-top:20vh;            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        input[type="text"],
        input[type="number"],
        input[type="submit"] {
            padding: 10px;
            margin-bottom: 20px;
            width: 100%;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        .button-container {
            text-align: center;
            margin-top: 20px;
        }

        .back-button {
            padding: 10px 20px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            background-color: #f44336;
            color: white;
            cursor: pointer;
            text-decoration: none;
        }

        .back-button:hover {
            background-color: #d32f2f;
        }
           /* Styles for the footer */
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
</head>
<body>
    <div id="headerContainer"></div>

    <div class="container">
        <h2>Add Fees Details</h2>
        <form action="" method="post">
            <label for="reg_no">Registration Number:</label>
            <input type="text" id="reg_no" name="reg_no" required>

            <label for="sem1_pending_fees">Semester 1 Pending Fees:</label>
            <input type="number" id="sem1_pending_fees" name="sem1_pending_fees" required>

            <label for="sem2_pending_fees">Semester 2 Pending Fees:</label>
            <input type="number" id="sem2_pending_fees" name="sem2_pending_fees" required>

            <label for="sem3_pending_fees">Semester 3 Pending Fees:</label>
            <input type="number" id="sem3_pending_fees" name="sem3_pending_fees" required>

            <label for="sem4_pending_fees">Semester 4 Pending Fees:</label>
            <input type="number" id="sem4_pending_fees" name="sem4_pending_fees" required>

            <label for="sem5_pending_fees">Semester 5 Pending Fees:</label>
            <input type="number" id="sem5_pending_fees" name="sem5_pending_fees" required>

            <label for="sem6_pending_fees">Semester 6 Pending Fees:</label>
            <input type="number" id="sem6_pending_fees" name="sem6_pending_fees" required>

            <label for="library_pending_fees">Library Pending Fees:</label>
            <input type="number" id="library_pending_fees" name="library_pending_fees" required>

            <input type="submit" value="Submit">
        </form>

        <div class="button-container">
            <a href="managefees.jsp" class="back-button">Back</a>
        </div>
    </div>
    
    <% 
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String regNo = request.getParameter("reg_no");
        int sem1PendingFees = Integer.parseInt(request.getParameter("sem1_pending_fees"));
        int sem2PendingFees = Integer.parseInt(request.getParameter("sem2_pending_fees"));
        int sem3PendingFees = Integer.parseInt(request.getParameter("sem3_pending_fees"));
        int sem4PendingFees = Integer.parseInt(request.getParameter("sem4_pending_fees"));
        int sem5PendingFees = Integer.parseInt(request.getParameter("sem5_pending_fees"));
        int sem6PendingFees = Integer.parseInt(request.getParameter("sem6_pending_fees"));
        int libraryPendingFees = Integer.parseInt(request.getParameter("library_pending_fees"));

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        // Database connection parameters
        String url = "jdbc:mysql://localhost:3306/finalproject";
        String username = "root";
        String dbPassword = "admin";

        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(url, username, dbPassword);

            // Check if reg_no already exists in the fees table
            stmt = conn.prepareStatement("SELECT reg_no FROM fees WHERE reg_no = ?");
            stmt.setString(1, regNo);
            rs = stmt.executeQuery();

            if (rs.next()) {
                out.println("<script>alert('Registration number already exists in the database.');</script>");
            } else {
                // If reg_no does not exist, insert the new fees details into the database
                stmt.close();
                stmt = conn.prepareStatement("INSERT INTO fees (reg_no, sem1_pending_fees, sem2_pending_fees, sem3_pending_fees, sem4_pending_fees, sem5_pending_fees, sem6_pending_fees, library_pending_fees) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
                stmt.setString(1, regNo);
                stmt.setInt(2, sem1PendingFees);
                stmt.setInt(3, sem2PendingFees);
                stmt.setInt(4, sem3PendingFees);
                stmt.setInt(5, sem4PendingFees);
                stmt.setInt(6, sem5PendingFees);
                stmt.setInt(7, sem6PendingFees);
                stmt.setInt(8, libraryPendingFees);

                int rowsAffected = stmt.executeUpdate();
                
                if (rowsAffected > 0) {
                    out.println("<script>alert('Fees details added successfully.');</script>");
                } else {
                    out.println("<script>alert('Student record not found.');</script>");
                }
            }
        } catch (Exception e) {
            out.println("<script>alert('Student record not found.');</script>");
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
    }
    %>
        <!-- Container for footer -->
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
    //    loadFile('footer.html', 'footerContainer');
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
