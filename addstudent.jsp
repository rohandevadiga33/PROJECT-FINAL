<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Add Student Details</title>
    <style>
        /* Styles */
        body {
            font-family: Arial, sans-serif;
            background-color:#FFFF99;
            margin: 0;
            padding: 0;
        }
        .container {
        margin-top:180px;
            width: 70%;
          margin: 100px auto;
    margin-top:30vh;
            padding: 20px;
            background-color: #EAECD6;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                font-weight: bold;
            
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
                font-weight: bold;
            
        }
        th {
            background-color: #f2f2f2;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
            width:100%;
        }
        form {
            text-align: center;
            margin-bottom: 20px;
        }
        input[type="text"], input[type="date"], input[type="password"]  {
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
           /* Styles */
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
        <h1>Add Student Details</h1>
        <form action="" method="post">
            <table>
                <tr>
                    <td>Registration Number:</td>
                    <td><input type="text" name="regNo" required></td>
                </tr>
                <tr>
                    <td>Student Name:</td>
                    <td><input type="text" name="studentName" required></td>
                </tr>
                <tr>
                    <td>Father's Name:</td>
                    <td><input type="text" name="fatherName" required></td>
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
                    <td colspan="2"><input type="submit" value="Add"></td>
        <td colspan="2"><button type="button" id="goBackButton">GO Back</button></td>
                </tr>
                  
            </table>
        </form>

        <%@ page import="java.io.*,java.util.*,java.sql.*" %>
        <%
            if(request.getMethod().equals("POST")) {
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
                    
                    // Check if registration number already exists
                    String checkQuery = "SELECT * FROM student WHERE reg_no = ?";
                    PreparedStatement checkStmt = con.prepareStatement(checkQuery);
                    checkStmt.setString(1, regNo);
                    ResultSet resultSet = checkStmt.executeQuery();

                    if(resultSet.next()) {
        %>
                        <script>
                            alert("Student Registration Number already exists.");
                        </script>
        <%
                    } else {
                        // If registration number doesn't exist, proceed with insertion
                        String insertQuery = "INSERT INTO student (reg_no, student_name, father_name, date_of_birth, address, branch, mobile_no, email) VALUES ( ?, ?, ?, ?, ?, ?,?,?)";
                        PreparedStatement insertStmt = con.prepareStatement(insertQuery);
                        insertStmt.setString(1, regNo);
                        insertStmt.setString(2, studentName);
                        insertStmt.setString(3, fatherName);
                        insertStmt.setString(4, dateOfBirth);
                        insertStmt.setString(5, address);
                        insertStmt.setString(6, branch);
                        insertStmt.setString(7, mobileNo);
                        insertStmt.setString(8, email);
                      
                        int rowsAffected = insertStmt.executeUpdate();

                        // Alert for successful insertion
        %>
                        <script>
                            alert("Student added successfully.");
                            window.location.href = "addstudent.jsp"; // Change "addstudent.jsp" to your desired redirection page
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
        window.location.href = 'manage-student.jsp'; // Change the URL as needed
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
        loadFile('footer.html', 'footerContainer');
    </script>
    <script>
  function confirmLogout() {
      return confirm("You are loging out!");
  }
</script>
</body>
</html>
