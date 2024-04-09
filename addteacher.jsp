<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Add Teacher Details</title>
    <style>
        /* Styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }
        .container {
            margin: 100px auto;
    margin-top:25vh;
            width: 80%;
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
        input[type="text"], input[type="date"] ,input[type="password"]{
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            width: 250px;
        }
        input[type="submit"] {
            padding: 8px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        #goBackButton {
        padding: 8px 20px;
        background-color: #4CAF50;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }

    #goBackButton:hover {
        background-color: #45a049;
    }
    </style>
</head>
<body>
 <div id="headerContainer"></div>

    <div class="container">
        <h1>Add Teacher Details</h1>
        <form action="" method="post">
            <table>
                <tr>
                    <td>Teacher ID:</td>
                    <td><input type="text" name="teacherId" required></td>
                </tr>
                <tr>
                    <td>Teacher Name:</td>
                    <td><input type="text" name="teacherName" required></td>
                </tr>
                <tr>
                    <td>Date of Birth:</td>
                    <td><input type="date" name="dateOfBirth" required></td>
                </tr>
                <tr>
                    <td>Address:</td>
                    <td><input type="text" name="address" required></td>
                </tr>
                <tr>
                    <td>Branch:</td>
                    <td><input type="text" name="branch" required></td>
                </tr>
                <tr>
                    <td>Mobile Number:</td>
                    <td><input type="text" name="mobileNo" required></td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td><input type="text" name="email" required></td>
                </tr>
                <tr>
                    <td>Date of Joining:</td>
                    <td><input type="date" name="dateOfJoining" required></td>
                </tr>
                 
                <tr>
                    <td colspan="2"><input type="submit" value="Add"></td>
                            <td colspan="2"><button type="button" id="goBackButton">GO Back</button></td>
                    
                </tr>
            </table>
        </form>

        <%
            if(request.getMethod().equals("POST")) {
                String url = "jdbc:mysql://localhost:3306/finalproject";
                String username = "root";
                String dbPassword = "admin";
                
                try {
                    String teacherId = request.getParameter("teacherId");
                    String teacherName = request.getParameter("teacherName");
                    String dateOfBirth = request.getParameter("dateOfBirth");
                    String address = request.getParameter("address");
                    String branch = request.getParameter("branch");
                    String mobileNo = request.getParameter("mobileNo");
                    String email = request.getParameter("email");
                    String dateOfJoining = request.getParameter("dateOfJoining");
                    

                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection(url, username, dbPassword);
                    
                    // Check if teacher ID already exists
                    String checkQuery = "SELECT * FROM teacher WHERE teacher_id = ?";
                    PreparedStatement checkStmt = con.prepareStatement(checkQuery);
                    checkStmt.setString(1, teacherId);
                    ResultSet resultSet = checkStmt.executeQuery();

                    if(resultSet.next()) {
        %>
                        <script>
                            alert("Teacher ID already exists.");
                        </script>
        <%
                    } else {
                        // If teacher ID doesn't exist, proceed with insertion
                        String insertQuery = "INSERT INTO teacher (teacher_id, teacher_name, date_of_birth, address, branch, mobile_no, email, date_of_joining) VALUES ( ?, ?, ?, ?, ?, ?, ?,?)";
                        PreparedStatement insertStmt = con.prepareStatement(insertQuery);
                        insertStmt.setString(1, teacherId);
                        insertStmt.setString(2, teacherName);
                        insertStmt.setString(3, dateOfBirth);
                        insertStmt.setString(4, address);
                        insertStmt.setString(5, branch);
                        insertStmt.setString(6, mobileNo);
                        insertStmt.setString(7, email);
                        insertStmt.setString(8, dateOfJoining);
                        
                        int rowsAffected = insertStmt.executeUpdate();

                        String message = rowsAffected + " row(s) inserted successfully.";
                        insertStmt.close();
                        
                        // Alert for successful insertion
                        %>
                        <script>
                            alert("Teacher added successfully.");
                            window.location.href = "addteacher.jsp"; // Change "addteacher.jsp" to your desired redirection page
                        </script>
                        <%
                    }
                    resultSet.close();
                    checkStmt.close();
                    con.close();
        %>
        <%
                } catch(Exception e) {
                    e.printStackTrace();
                }
            }
        %>
    </div>
    <div id="footerContainer"></div>
        <script>
    // JavaScript to handle button click event
    document.getElementById('goBackButton').addEventListener('click', function() {
        window.location.href = 'manage-teacher.jsp'; // Change the URL as needed
    });
    </script>
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
loadFile('footer.html', 'footerContainer');// JavaScript section unchanged
</script>
<script>
  function confirmLogout() {
      return confirm("You are loging out!");
  }
</script>
</body>
</html>
