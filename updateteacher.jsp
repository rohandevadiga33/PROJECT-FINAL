<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Update Teacher Details</title>
    <style>
        /* Styles unchanged *//* Styles unchanged */      body {
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
        input[type="text"] {
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            width: 250px;
        }
        input[type="submit"] ,input[type="button"]{
            padding: 8px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        input[type="submit"]:hover,input[type="button"]:hover  {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div id="headerContainer"></div>

    <div class="container">
        <h1>Update Teacher Details</h1>
        <form action="" method="post">
            <input type="text" name="searchTeacherId" placeholder="Enter Teacher ID to Update">
            <input type="submit" value="Search">
                        <input type="button" value="Back" onclick="window.location.href='manage-teacher.jsp';">
            
        </form>

        <%
            if(request.getMethod().equals("POST")) {
                String url = "jdbc:mysql://localhost:3306/finalproject";
                String username = "root";
                String dbPassword = "admin";
                
                try {
                    String teacherId = request.getParameter("searchTeacherId");
                    if(teacherId != null && !teacherId.isEmpty()) {
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection(url, username, dbPassword);
                        
                        String query = "SELECT * FROM teacher WHERE teacher_id=?";
                        PreparedStatement pstmt = con.prepareStatement(query);
                        pstmt.setString(1, teacherId);
                        ResultSet rs = pstmt.executeQuery();

                        if(rs.next()) {
        %>
                            <table>
                                <tr>
                                    <th>Field</th>
                                    <th>Value</th>
                                </tr>
                                <form action="" method="post" onsubmit="return confirm('Are you sure you want to update?');">
                                    <input type="hidden" name="teacherId" value="<%= rs.getString("teacher_id") %>">
                                    <tr>
                                        <td>Teacher Name:</td>
                                        <td><input type="text" name="teacherName" value="<%= rs.getString("teacher_name") %>"></td>
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
                                        <td>Date of Joining:</td>
                                        <td><input type="date" name="dateOfJoining" value="<%= rs.getString("date_of_joining") %>"></td>
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
                                alert("No record found for Teacher ID <%= teacherId %>");
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
            if(request.getMethod().equals("POST") && request.getParameter("teacherId") != null) {
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
                    
                    String updateQuery = "UPDATE teacher SET teacher_name=?, date_of_birth=?, address=?, branch=?, mobile_no=?, email=?, date_of_joining=? WHERE teacher_id=?";
                    PreparedStatement updateStmt = con.prepareStatement(updateQuery);
                    updateStmt.setString(1, teacherName);
                    updateStmt.setString(2, dateOfBirth);
                    updateStmt.setString(3, address);
                    updateStmt.setString(4, branch);
                    updateStmt.setString(5, mobileNo);
                    updateStmt.setString(6, email);
                    updateStmt.setString(7, dateOfJoining);
                    updateStmt.setString(8, teacherId);
                    int rowsAffected = updateStmt.executeUpdate();

                    String message = rowsAffected + " row(s) updated successfully.";
                    updateStmt.close();
                    con.close();
        %>
                    <script>
                        alert("<%= message %>");
                        window.location.href = "updateteacher.jsp"; // Change "your_page.jsp" to your desired redirection page
                    </script>
        <%
                } catch(Exception e) {
                    e.printStackTrace();
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
        loadFile('footer.html', 'footerContainer');
    </script>
    <script>
  function confirmLogout() {
      return confirm("You are loging out!");
  }
</script>
</body>
</html>
