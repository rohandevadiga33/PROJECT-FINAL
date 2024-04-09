<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.SQLException, java.sql.ResultSet" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Marks</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
        }
        .container {
            max-width: 600px;
  margin: 100px auto;
    margin-top:20vh;            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h3 {
            text-align: center;
            color: #333;
        }
        form {
            margin-top: 20px;
        }
        table {
            width: 100%;
            margin-bottom: 20px;
            border-collapse: collapse;
        }
        th, td {
            padding: 8px;
            border: 1px solid #ddd;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        input[type="text"], input[type="number"], input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            background-color: #4caf50;
            color: #fff;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
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
</head>
<body>
    <div id="headerContainer"></div>

    <div class="container">
        <h2>Update / Delete Marks</h2>
        <form method="post">
            Registration Number: <input type="text" name="reg_no" required><br>
            Semester: <input type="text" name="sem" required><br>
            <input type="submit" name="search" value="Search">
        </form>

        <%
            // Database connection details
            String url = "jdbc:mysql://localhost:3306/finalproject";
            String username = "root";
            String dbPassword = "admin";

            // Function to establish database connection
            Connection conn = null;
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(url, username, dbPassword);
            } catch (ClassNotFoundException e) {
                out.println("JDBC Driver not found: " + e.getMessage());
            } catch (SQLException e) {
                out.println("Connection failed: " + e.getMessage());
            }

            // Check if the form is submitted
            if (request.getParameter("search") != null) {
                // Retrieve form data
                String regNo = request.getParameter("reg_no");
                String sem = request.getParameter("sem");

                // Check if marks exist for the student in the specified semester
                PreparedStatement searchStmt = null;
                ResultSet resultSet = null;
                String searchQuery = "SELECT * FROM marks WHERE reg_no = ? AND sem = ?";
                try {
                    searchStmt = conn.prepareStatement(searchQuery);
                    searchStmt.setString(1, regNo);
                    searchStmt.setString(2, sem);
                    resultSet = searchStmt.executeQuery();

                    if (resultSet.next()) {
                        // Display marks if found
        %>
                            <h3>Marks for Registration Number: <%= regNo %>, Semester: <%= sem %></h3>
                            <form method="post">
                                <input type="hidden" name="reg_no" value="<%= regNo %>">
                                <input type="hidden" name="sem" value="<%= sem %>">
                                <table>
                                    <tr>
                                        <th>Subject Name</th>
                                        <th>Maximum Marks</th>
                                        <th>Obtained Marks</th>
                                    </tr>
                                    <% for (int i = 1; i <= 5; i++) { 
                                        String subName = resultSet.getString("sub" + i + "_name");
                                        if (subName != null) { %>
                                            <tr>
                                                <td><input type="text" name="sub<%= i %>_name" value="<%= subName %>"></td>
                                                <td><input type="number" name="sub<%= i %>_max_marks" value="<%= resultSet.getInt("sub" + i + "_max_marks") %>"></td>
                                                <td><input type="number" name="sub<%= i %>_obt_marks" value="<%= resultSet.getInt("sub" + i + "_obt_marks") %>"></td>
                                            </tr>
                                    <%  } } %>
                                </table>
                                <input type="submit" name="update" value="Update">
<input type="submit" name="delete" value="Delete" style="background-color: #f44336; color: white;" onclick="return confirm('Are you sure you want to delete?');">
                            </form>
        <%
                    } else {
        %>
                            <script>alert("Student not found.");</script>
        <%
                    }
                } catch (SQLException e) {
                    out.println("Error searching for marks: " + e.getMessage());
                } finally {
                    if (resultSet != null) {
                        try {
                            resultSet.close();
                        } catch (SQLException e) {
                            out.println("Error closing ResultSet: " + e.getMessage());
                        }
                    }
                    if (searchStmt != null) {
                        try {
                            searchStmt.close();
                        } catch (SQLException e) {
                            out.println("Error closing PreparedStatement: " + e.getMessage());
                        }
                    }
                }
            }

            // Update marks
            if (request.getParameter("update") != null) {
                String regNo = request.getParameter("reg_no");
                String sem = request.getParameter("sem");
                try {
                    // Update query
                    String updateQuery = "UPDATE marks SET ";
                    boolean isFirst = true;
                    for (int i = 1; i <= 5; i++) {
                        String subName = request.getParameter("sub" + i + "_name");
                        String subMaxMarksStr = request.getParameter("sub" + i + "_max_marks");
                        String subObtMarksStr = request.getParameter("sub" + i + "_obt_marks");
                        if (subName != null && subMaxMarksStr != null && subObtMarksStr != null) {
                            if (!isFirst) {
                                updateQuery += ", ";
                            }
                            updateQuery += "sub" + i + "_name = ?, sub" + i + "_max_marks = ?, sub" + i + "_obt_marks = ?";
                            isFirst = false;
                        }
                    }
                    updateQuery += " WHERE reg_no = ? AND sem = ?";
                    
                    PreparedStatement updateStmt = conn.prepareStatement(updateQuery);
                    int paramIndex = 1;
                    for (int i = 1; i <= 5; i++) {
                        String subName = request.getParameter("sub" + i + "_name");
                        String subMaxMarksStr = request.getParameter("sub" + i + "_max_marks");
                        String subObtMarksStr = request.getParameter("sub" + i + "_obt_marks");
                        if (subName != null && subMaxMarksStr != null && subObtMarksStr != null) {
                            updateStmt.setString(paramIndex++, subName);
                            updateStmt.setInt(paramIndex++, Integer.parseInt(subMaxMarksStr));
                            updateStmt.setInt(paramIndex++, Integer.parseInt(subObtMarksStr));
                        }
                    }
                    updateStmt.setString(paramIndex++, regNo);
                    updateStmt.setString(paramIndex++, sem);
                    
                    // Execute update
                    updateStmt.executeUpdate();
        %>
                    <script>alert("Marks updated successfully.");</script>
        <%
                } catch (SQLException | NumberFormatException e) {
                    out.println("Error updating marks: " + e.getMessage());
                }
            }
            
            // Delete marks
            if (request.getParameter("delete") != null) {
                String regNo = request.getParameter("reg_no");
                String sem = request.getParameter("sem");
                try {
                    // Delete query
                    String deleteQuery = "DELETE FROM marks WHERE reg_no = ? AND sem = ?";
                    
                    PreparedStatement deleteStmt = conn.prepareStatement(deleteQuery);
                    deleteStmt.setString(1, regNo);
                    deleteStmt.setString(2, sem);
                    
                    // Execute delete
                    deleteStmt.executeUpdate();
        %>
                    <script>alert("Marks deleted successfully.");</script>
        <%
                } catch (SQLException e) {
                    out.println("Error deleting marks: " + e.getMessage());
                }
            }
        %>
    </div>
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
        loadFile('headerteacher.html', 'headerContainer');
        loadFile('footer.html', 'footerContainer');
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
        <script>
  function confirmLogout() {
      return confirm("Are you sure you want to log out?");
  }
</script>
</body>
</html>
