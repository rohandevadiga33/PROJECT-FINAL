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
    String newPassword = request.getParameter("newPassword");
    String confirmPassword = request.getParameter("confirmPassword");

    // Check if new password and confirm password match
    if (!newPassword.equals(confirmPassword)) {
        out.println("<script>alert('New password and confirm password do not match');</script>");
    } else {
        try {
            // Update password in the database
            String query = "UPDATE teacher SET password = ? WHERE teacher_id = ?";
            stmt = conn.prepareStatement(query);
            stmt.setString(1, newPassword);
            stmt.setString(2, teacherId);
            int rowsAffected = stmt.executeUpdate();
            if (rowsAffected > 0) {
                out.println("<script>alert('Password updated successfully'); window.location.href='teacher-login.jsp';</script>");
                return; // Stop execution after redirection
            } else {
                out.println("<script>alert('Failed to update password');</script>");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Close resources
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Update Password</title>
<style>
/* Your CSS styles */

.container {
    width: 400px;
    margin: 100px auto;
    margin-top:30vh;
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
    <h2>Update Password</h2>
    <form action="#" method="post">
        <div class="form-group">
            <label for="teacherId">Enter Teacher ID:</label>
            <input type="text" id="teacherId" name="teacherId" required>
        </div>
        <div class="form-group">
            <label for="newPassword">Enter New Password:</label>
            <input type="password" id="newPassword" name="newPassword" required>
        </div>
        <div class="form-group">
            <label for="confirmPassword">Confirm Password:</label>
            <input type="password" id="confirmPassword" name="confirmPassword" required>
        </div>
        <div class="form-group">
            <button type="submit">Update Password</button>
        </div>
    </form>
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
