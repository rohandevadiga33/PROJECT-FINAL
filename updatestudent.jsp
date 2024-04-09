<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Update Student Details</title>
    <style>
        /* Styles unchanged */
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 80%;
             margin: 100px auto;
    margin-top:15vh;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            text-align: center;
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        form {
            text-align: center;
            margin-bottom: 20px;
        }
        input[type="text"], input[type="date"] {
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            width: 250px;
        }
        input[type="submit"],
        input[type="button"] {
            padding: 8px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        input[type="submit"]:hover,
        input[type="button"]:hover {
            background-color: #45a049;
        }.header {
        background-color: #007bff;
        color: #fff;
        padding: 20px 0; /* Adjusted padding */
        display: flex;
        align-items: center;
        position: fixed; /* Changed position to absolute */
        top: 0; /* Set to top */
        left: 0; /* Set to left */
        width: 100%; /* Stretch background to full width */
    }

    .header img {
        height: 70px; /* Adjusted height for larger logo */
        vertical-align: middle;
        margin-right: 20px; /* Increased spacing between the logo and text */
        margin-left: 20px; /* Added space before the logo */
    }

    .header .title {
        margin: 0;
        padding: 0;
        font-size: 24px;
        font-weight: bold; /* Added font weight */
        margin-right: 10px; /* Add some spacing between the logo and text */
    }

    .header .subtitle {
        margin: 5px 0 0;
        padding: 0;
        font-size: 18px;
        /* font-weight: bold;  */
        opacity: 0.7; /* Decreased opacity */
    }

    .navbar {
        background-color: #333; /* Dark background color for the navigation bar */
        position: fixed; /* Set navbar position to fixed */
        width: 100%; /* Set navbar width to full width */
        top: 110px; /* Align navbar below the header */
        left: 0; /* Align navbar to the left */
        z-index: 1000; /* Set z-index to be above other elements */
    }

    .navbar ul {
        list-style-type: none;
        margin: 0;
        padding: 0;
        overflow: hidden;
        display: flex; /* Make the navbar items horizontal */
    }

    .navbar li {
        margin: 0;
        padding: 0;
    }

    .navbar li a {
        display: block;
        color: white;
        text-align: center;
        padding: 14px 16px;
        text-decoration: none;
    }

    .navbar li a:hover {
        background-color: #ddd; /* Background color on hover */
        color: black;
    }

    .dropdown {
        float: right; /* Align the dropdown to the right */
    }

    .dropdown-content {
        display: none;
        position: absolute;
        background-color: #333;
        min-width: 160px;
        z-index: 1;
    }

    .dropdown-content a {
        color: white;
        padding: 12px 16px;
        text-decoration: none;
        display: block;
    }

    .dropdown-content a:hover {
        background-color: #ddd;
        color: black;
    }

    .dropdown:hover .dropdown-content {
        display: block;
    }

    h2 {
        font-size: 40px; /* Adjust the font size as needed */
        margin-left: 20px; /* Add margin bottom as needed */
    }

    p {
        top: 140px;
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
   <div class="header">
    <img src="logo.png" alt="College Logo">
    <div>
        <div class="title">Dr TMA Pai Polytechnic</div>
        <div class="subtitle">A unit of Dr. TMA Pai Foundation, Manipal</div>
    </div>
</div>

<div class="navbar">
    <ul>
    <li><a href="adminonly.html">Home</a></li>
    <li><a href="about.html" onclick="return confirmLogout()">About</a></li>
    <li><a href="courses.html" onclick="return confirmLogout()">Courses</a></li>
    <li><a href="admision.html" onclick="return confirmLogout()">Admission</a></li>
    <li><a href="viewResult.jsp" onclick="return confirmLogout()">Result</a></li>
    <li class="dropdown">
      <a href="#" class="dropbtn">Students Section</a>
      <div class="dropdown-content">
        <a href="manage-student.jsp">Manage Student</a>
        <a href="managefees.jsp">Manage Fees</a>
      </div>
    </li>
    <li><a href="manage-teacher.jsp">Teachers Section </a></li>
    <li><a href="index.html" style="color: red;" onclick="return confirmLogout()">Logout</a></li>
  </ul>
</div>

    <div class="container">
        <h1>Update Student Details</h1>
        <form action="" method="post">
            <input type="text" name="searchRegNo" placeholder="Enter Student Registration Number to Update">
            <input type="submit" value="Search">
            <input type="button" value="Back" onclick="window.location.href='manage-student.jsp';">
        </form>

        <%
            if(request.getMethod().equals("POST")) {
                String url = "jdbc:mysql://localhost:3306/finalproject";
                String username = "root";
                String dbPassword = "admin";
                
                try {
                    String regNo = request.getParameter("searchRegNo");
                    if(regNo != null && !regNo.isEmpty()) {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection(url, username, dbPassword);
                        
                        String query = "SELECT * FROM student WHERE reg_no=?";
                        PreparedStatement pstmt = con.prepareStatement(query);
                        pstmt.setString(1, regNo);
                        ResultSet rs = pstmt.executeQuery();

                        if(rs.next()) {
        %>
                            <table>
                                <tr>
                                    <th>Field</th>
                                    <th>Value</th>
                                </tr>
                                <form action="" method="post" onsubmit="return confirm('Are you sure you want to update?');">
                                    <input type="hidden" name="regNo" value="<%= rs.getString("reg_no") %>">
                                    <tr>
                                        <td>Student Name:</td>
                                        <td><input type="text" name="studentName" value="<%= rs.getString("student_name") %>"></td>
                                    </tr>
                                    <tr>
                                        <td>Father's Name:</td>
                                        <td><input type="text" name="fatherName" value="<%= rs.getString("father_name") %>"></td>
                                    </tr>
                                    <tr>
                                        <td>Date of Birth:</td>
                                        <td><input type="date" name="dateOfBirth" value="<%= rs.getString("date_of_birth") %>"></td>
                                    </tr>
                                    <tr>
                                        <td>Address:</td>
                                        <td><input type="text" name="address" value="<%= rs.getString("address") %>"></td>
                                    </tr>
                                    <tr>
                                        <td>Branch:</td>
                                        <td><input type="text" name="branch" value="<%= rs.getString("branch") %>"></td>
                                    </tr>
                                    <tr>
                                        <td>Mobile Number:</td>
                                        <td><input type="text" name="mobileNo" value="<%= rs.getString("mobile_no") %>"></td>
                                    </tr>
                                    <tr>
                                        <td>Email:</td>
                                        <td><input type="text" name="email" value="<%= rs.getString("email") %>"></td>
                                    </tr>
                                    <tr>
                                        <td colspan="2"><input type="submit" value="Update"></td>
                                    </tr>
                                </form>
                            </table>
        <%
                        } else {
        %>
                            <script>
                                alert("No record found for Registration Number <%= regNo %>");
                            </script>
        <%
                        }

                        rs.close();
                        pstmt.close();
                        con.close();
                    }
                } catch(Exception e) {
                    e.printStackTrace();
                }
            }
            
            // Check if the form is submitted for updating
            if(request.getMethod().equals("POST") && request.getParameter("regNo") != null) {
                String url = "jdbc:mysql://localhost:3306/finalproject";
                String username = "root";
                String dbPassword = "admin";
                
                try {
                    String regNo = request.getParameter("regNo");
                    String studentName = request.getParameter("studentName");
                    String fatherName = request.getParameter("fatherName");
                    String dateOfBirth = request.getParameter("dateOfBirth");
                    String address = request.getParameter("address");
                    String branch = request.getParameter("branch");
                    String mobileNo = request.getParameter("mobileNo");
                    String email = request.getParameter("email");

                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection(url, username, dbPassword);
                    
                    String updateQuery = "UPDATE student SET student_name=?, father_name=?, date_of_birth=?, address=?, branch=?,mobile_no=?, email=? WHERE reg_no=?";
                    PreparedStatement updateStmt = con.prepareStatement(updateQuery);
                    updateStmt.setString(1, studentName);
                    updateStmt.setString(2, fatherName);
                    updateStmt.setString(3, dateOfBirth);
                    updateStmt.setString(4, address);
                    updateStmt.setString(5, branch);
                    updateStmt.setString(6, mobileNo);
                    updateStmt.setString(7, email);
                    updateStmt.setString(8, regNo);
                    int rowsAffected = updateStmt.executeUpdate();

                    String message = rowsAffected + " row(s) updated successfully.";
                    updateStmt.close();
                    con.close();
        %>
                    <script>
                        alert("<%= message %>");
                        window.location.href = "updatestudent.jsp"; // Change "updatestudent.jsp" to your desired redirection page
                    </script>
        <%
                } catch(Exception e) {
                    e.printStackTrace();
                }
            }
        %>
    </div>
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

