<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Delete Student Details</title>
    <style>
        /* Styles unchanged */
     
    </style>
</head>
<body>
    <div class="container">
        <h1>Delete Student Details</h1>
        <form action="" method="post">
            <label for="regNo">Enter Registration Number:</label>
            <input type="text" id="regNo" name="regNo" required>
            <input type="submit" value="Search">
        </form>

        <%
            if(request.getMethod().equals("POST")) {
                String url = "jdbc:mysql://localhost:3306/finalproject";
                String username = "root";
                String dbPassword = "admin";
                
                String regNo = request.getParameter("regNo");

                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection(url, username, dbPassword);
                
                String searchQuery = "SELECT * FROM student WHERE reg_no = ?";
                PreparedStatement searchStmt = con.prepareStatement(searchQuery);
                searchStmt.setString(1, regNo);
                ResultSet resultSet = searchStmt.executeQuery();

                if(resultSet.next()) {
        %>
                    <table>
                        <tr>
                            <th>Registration Number</th>
                            <th>Student Name</th>
                            <th>Father's Name</th>
                            <th>Date of Birth</th>
                            <th>Address</th>
                            <th>Branch</th>
                            <th>Semester</th>
                            <th>Mobile Number</th>
                            <th>Email</th>
                            <th>Action</th>
                        </tr>
                        <tr>
                            <td><%= resultSet.getString("reg_no") %></td>
                            <td><%= resultSet.getString("student_name") %></td>
                            <td><%= resultSet.getString("father_name") %></td>
                            <td><%= resultSet.getString("date_of_birth") %></td>
                            <td><%= resultSet.getString("address") %></td>
                            <td><%= resultSet.getString("branch") %></td>
                            <td><%= resultSet.getString("sem") %></td>
                            <td><%= resultSet.getString("mobile_no") %></td>
                            <td><%= resultSet.getString("email") %></td>
                            <td><button onclick="deleteStudent('<%= resultSet.getString("reg_no") %>')">Delete</button></td>
                        </tr>
                    </table>
        <%
                } else {
        %>
                    <script>
                        alert("Student not found with the given registration number.");
                    </script>
        <%
                }
                resultSet.close();
                searchStmt.close();
                con.close();
            }
        %>

        <script>
            function deleteStudent(regNo) {
                if(confirm("Are you sure you want to delete this student?")) {
                    window.location.href = "deletestudent.jsp?regNo=" + regNo;
                }
            }
        </script>
    </div>
</body>
</html>
