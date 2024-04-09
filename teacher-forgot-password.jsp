<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.io.*" %>

<%
// Establish database connection
String url = "jdbc:mysql://localhost:3306/finalproject";
String username = "root";
String dbPassword = "admin";
Connection conn = null;
PreparedStatement stmt = null;
ResultSet rs = null;

try {
    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection(url, username, dbPassword);
} catch (ClassNotFoundException | SQLException e) {
    e.printStackTrace();
}

if (conn == null) {
    out.println("Failed to make connection!");
}

// Check if form is submitted
if ("POST".equalsIgnoreCase(request.getMethod())) {
    // Collect form data
    String teacherId = request.getParameter("teacherId");
    String mobileNumber = request.getParameter("mobileNumber");
    String email = request.getParameter("email");

    try {
        // Check if the teacher id exists in the database
        String query = "SELECT * FROM teacher WHERE teacher_id = ?";
        stmt = conn.prepareStatement(query);
        stmt.setString(1, teacherId);
        rs = stmt.executeQuery();

        if (rs.next()) {
            // If teacher id exists, check if mobile number and email match
            String dbMobileNumber = rs.getString("mobile_no");
            String dbEmail = rs.getString("email");
            if (mobileNumber.equals(dbMobileNumber) && email.equals(dbEmail)) {
                // Redirect to teacher-change-password.jsp if details match
                response.sendRedirect("teacher-change-password.jsp");
                return;
            } else {
                // Display error message if details don't match
                out.println("<script>alert('Entered details do not match our records');</script>");
            }
        } else {
            // Display error message if teacher id is not valid
            out.println("<script>alert('Invalid teacher ID');</script>");
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        // Close resources
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

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Forgot Password</title>
<style>
body {
    font-family: Arial, sans-serif;
    background-color: #f0f0f0;
    margin: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

.container {
    width: 400px;
    background-color: #fff;
    padding: 30px;
    border-radius: 5px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h2 {
    text-align: center;
}

.form-group {
    margin-bottom: 20px;
}

.form-group label {
    display: block;
    margin-bottom: 5px;
}

.form-group input {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

.form-group button {
    width: 100%;
    padding: 10px;
    background-color: #007bff;
    color: #fff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

.form-group button:hover {
    background-color: #0056b3;
}

.back-button {
    display: block;
    margin-top: 20px;
    text-align: center;
}

.back-button a {
    color: #007bff;
    text-decoration: none;
}

.back-button a:hover {
    text-decoration: underline;
}


/* Styles for the footer */
.footer {
    background-color: #333; /* Dark background color */
    color: #fff; /* Text color */
    padding: 20px; /* Padding for the footer */
    text-align: center; /* Center align text */
    display: flex; /* Use flexbox for layout */
    justify-content: space-between; /* Space elements evenly */
    align-items: center; /* Center align vertically */
    position: fixed; /* Fixed position */
    bottom: 0; /* Stick to the bottom */
    left: 0; /* Stick to the left */
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
    margin: 0 10px; /* Margin between links */
}

.footer .social-links img {
    width: 30px; /* Adjust size of social media icons */
    height: 30px;
    border-radius: 50%; /* Make icons round */
    margin-right: 40px;
}

.copy-right {
    color: #fff; /* Text color */
    font-size: 14px; /* Font size */
    margin-top: 20px; /* Margin from the top */
    position: absolute; /* Position absolutely */
    bottom: 0; /* Place at the bottom */
    left: 50%; /* Center horizontally */
    transform: translateX(-50%); /* Center horizontally */
}
</style>
</head>
<body>
 <div id="headerContainer"></div>
<div class="container">
    <h2>Forgot Password</h2>
    <form action="#" method="post">
        <div class="form-group">
            <label for="teacherId">Enter Teacher ID:</label>
            <input type="text" id="teacherId" name="teacherId" required>
        </div>
        <div class="form-group">
            <label for="mobileNumber">Enter Mobile Number:</label>
            <input type="text" id="mobileNumber" name="mobileNumber" required>
        </div>
        <div class="form-group">
            <label for="email">Enter Email:</label>
            <input type="email" id="email" name="email" required>
        </div>
        <div class="form-group">
            <button type="submit">Submit</button>
        </div>
    </form>
    <div class="back-button">
        <a href="teacher-login.jsp">Back to Login</a>
    </div>
</div>


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
        loadFile('header.html', 'headerContainer');
        loadFile('footer.html', 'footerContainer');
    </script>
</body>
</html>
