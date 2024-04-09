<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Student Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
        }
        .container {
    margin: 100px auto;
    margin-top:20vh;
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
        input[type="text"] {
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
              input[type="button"] {
            padding: 8px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        input[type="button"]:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>

    <div id="headerContainer"></div>

    <div class="container">
        <h1>Student Details</h1>
        <form action="" method="post">
            <input type="text" name="searchRegNo" placeholder="Search by Registration Number">
            <input type="submit" value="Search">
            
        <input type="button" value="Back" onclick="window.location.href='manage-student.jsp';">
        </form>
        <table>
            <tr>
                <th>Registration Number</th>
                <th>Student Name</th>
                <th>Father Name</th>
                <th>Date of Birth</th>
                <th>Address</th>
                <th>Branch</th>
                <th>Mobile Number</th>
                <th>Email</th>
            </tr>
            <% 
                String url = "jdbc:mysql://localhost:3306/finalproject";
                String username = "root";
                String dbPassword = "admin";
                
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection(url, username, dbPassword);
                    
                    String searchRegNo = request.getParameter("searchRegNo");
                    String query = "SELECT * FROM student";
                    
                    if(searchRegNo != null && !searchRegNo.isEmpty()) {
                        query += " WHERE reg_no = '" + searchRegNo + "'";
                    }
                    
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery(query);
                    
                    while(rs.next()) {
            %>
                        <tr>
                            <td><%= rs.getString("reg_no") %></td>
                            <td><%= rs.getString("student_name") %></td>
                            <td><%= rs.getString("father_name") %></td>
                            <td><%= rs.getDate("date_of_birth") %></td>
                            <td><%= rs.getString("address") %></td>
                            <td><%= rs.getString("branch") %></td>
                       
                            <td><%= rs.getString("mobile_no") %></td>
                            <td><%= rs.getString("email") %></td>
                        </tr>
            <%
                    }
                    rs.close();
                    stmt.close();
                    con.close();
                } catch(Exception e) {
                    e.printStackTrace();
                }
            %>
        </table>
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
