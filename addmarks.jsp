<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.SQLException, java.sql.ResultSet" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Insert Marks</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
        }
        .container {
               margin: 100px auto;
    margin-top:20vh;
            max-width: 600px;
           
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
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
    <script>
        // Function to show success alert
        function showSuccessAlert() {
            alert("Marks inserted successfully!");
        }

        // Function to show error alert
        function showErrorAlert(errorMessage) {
            alert(errorMessage);
            window.location.href = "addmarks.jsp"; // Redirect to addmarks.jsp
        }
        
    </script>
</head>
<body>
    <div id="headerContainer"></div>

    <div class="container">
        <h2>Insert Marks</h2>
        <form method="post">
            Registration Number: <input type="text" name="reg_no" required><br>
            Semester: <input type="text" name="sem" required><br>
            Branch: <input type="text" name="branch" required><br>
            <table>
                <tr>
                    <th>Subject Name</th>
                    <th>Maximum Marks</th>
                    <th>Obtained Marks</th>
                </tr>
                <tr>
                    <td><input type="text" name="sub1_name" required></td>
                    <td><input type="number" name="sub1_max_marks" required></td>
                    <td><input type="number" name="sub1_obt_marks" required></td>
                </tr>
                <tr>
                    <td><input type="text" name="sub2_name"></td>
                    <td><input type="number" name="sub2_max_marks"></td>
                    <td><input type="number" name="sub2_obt_marks"></td>
                </tr>
                <tr>
                    <td><input type="text" name="sub3_name"></td>
                    <td><input type="number" name="sub3_max_marks"></td>
                    <td><input type="number" name="sub3_obt_marks"></td>
                </tr>
                <tr>
                    <td><input type="text" name="sub4_name"></td>
                    <td><input type="number" name="sub4_max_marks"></td>
                    <td><input type="number" name="sub4_obt_marks"></td>
                </tr>
                <tr>
                    <td><input type="text" name="sub5_name"></td>
                    <td><input type="number" name="sub5_max_marks"></td>
                    <td><input type="number" name="sub5_obt_marks"></td>
                </tr>
            </table>
            <input type="submit" name="submit" value="Submit">
        </form>
    </div>

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
    if (request.getParameter("submit") != null) {
        // Retrieve form data
        String regNo = request.getParameter("reg_no");
        String sem = request.getParameter("sem");

        // Check if marks already exist for the student in the specified semester
        PreparedStatement checkStmt = null;
        ResultSet resultSet = null;
        String checkQuery = "SELECT * FROM marks WHERE reg_no = ? AND sem = ?";
        try {
            checkStmt = conn.prepareStatement(checkQuery);
            checkStmt.setString(1, regNo);
            checkStmt.setString(2, sem);
            resultSet = checkStmt.executeQuery();
            if (resultSet.next()) {
%>
                <script>showErrorAlert("Marks already exist for the student in this semester.");</script>
<%
                return; // Exit the script if marks already exist
            }
        } catch (SQLException e) {
            out.println("Error checking existing marks: " + e.getMessage());
            return;
        } finally {
            if (resultSet != null) {
                try {
                    resultSet.close();
                } catch (SQLException e) {
                    out.println("Error closing ResultSet: " + e.getMessage());
                }
            }
            if (checkStmt != null) {
                try {
                    checkStmt.close();
                } catch (SQLException e) {
                    out.println("Error closing PreparedStatement: " + e.getMessage());
                }
            }
        }
        
        // If marks don't exist, proceed to insert new marks
        String branch = request.getParameter("branch");
        String sub1_name = request.getParameter("sub1_name");
        String sub1_max_marks = request.getParameter("sub1_max_marks");
        String sub1_obt_marks = request.getParameter("sub1_obt_marks");
        String sub2_name = request.getParameter("sub2_name");
        String sub2_max_marks = request.getParameter("sub2_max_marks");
        String sub2_obt_marks = request.getParameter("sub2_obt_marks");
        String sub3_name = request.getParameter("sub3_name");
        String sub3_max_marks = request.getParameter("sub3_max_marks");
        String sub3_obt_marks = request.getParameter("sub3_obt_marks");
        String sub4_name = request.getParameter("sub4_name");
        String sub4_max_marks = request.getParameter("sub4_max_marks");
        String sub4_obt_marks = request.getParameter("sub4_obt_marks");
        String sub5_name = request.getParameter("sub5_name");
        String sub5_max_marks = request.getParameter("sub5_max_marks");
        String sub5_obt_marks = request.getParameter("sub5_obt_marks");

        // Insert data into the database
        PreparedStatement pstmt = null;
        String insertQuery = "INSERT INTO marks (reg_no, sem, branch, sub1_name, sub1_max_marks, sub1_obt_marks, sub2_name, sub2_max_marks, sub2_obt_marks, sub3_name, sub3_max_marks, sub3_obt_marks, sub4_name, sub4_max_marks, sub4_obt_marks, sub5_name, sub5_max_marks, sub5_obt_marks) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            pstmt = conn.prepareStatement(insertQuery);
            pstmt.setString(1, regNo);
            pstmt.setString(2, sem);
            pstmt.setString(3, branch);
            pstmt.setString(4, sub1_name);
            pstmt.setString(5, sub1_max_marks);
            pstmt.setString(6, sub1_obt_marks);
            pstmt.setString(7, sub2_name.isEmpty() ? null : sub2_name);
            pstmt.setString(8, sub2_max_marks.isEmpty() ? null : sub2_max_marks);
            pstmt.setString(9, sub2_obt_marks.isEmpty() ? null : sub2_obt_marks);
            pstmt.setString(10, sub3_name.isEmpty() ? null : sub3_name);
            pstmt.setString(11, sub3_max_marks.isEmpty() ? null : sub3_max_marks);
            pstmt.setString(12, sub3_obt_marks.isEmpty() ? null : sub3_obt_marks);
            pstmt.setString(13, sub4_name.isEmpty() ? null : sub4_name);
            pstmt.setString(14, sub4_max_marks.isEmpty() ? null : sub4_max_marks);
            pstmt.setString(15, sub4_obt_marks.isEmpty() ? null : sub4_obt_marks);
            pstmt.setString(16, sub5_name.isEmpty() ? null : sub5_name);
            pstmt.setString(17, sub5_max_marks.isEmpty() ? null : sub5_max_marks);
            pstmt.setString(18, sub5_obt_marks.isEmpty() ? null : sub5_obt_marks);
            
            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
%>
                <script>showSuccessAlert();</script>
<%
            } else {
%>
                <script>showErrorAlert("Error inserting marks. Please try again later.");</script>
<%
            }
        } catch (SQLException e) {
            out.println("Error inserting marks: " + e.getMessage());
%>
            <script>showErrorAlert("Error inserting marks. Student not exist.");</script>
<%
        } finally {
            if (pstmt != null) {
                try {
                    pstmt.close();
                } catch (SQLException e) {
                    out.println("Error closing PreparedStatement: " + e.getMessage());
                }
            }
        }
    }
%>
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
        loadFile('headerteacher.html', 'headerContainer');
     //   loadFile('footer.html', 'footerContainer');
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
      return confirm("Are you sure you want to log out?");
  }
</script>
</body>
</html>
