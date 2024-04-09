<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet, java.sql.SQLException" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Result</title>
    <style>
        /* Your CSS styles */
           body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 80%;
            margin: 0 auto;
            text-align: center;
        }

        form {
            margin-top: 50px;
        }

        h2 {
            color: #333;
        }

        table {
            border-collapse: collapse;
            width: 100%;
            margin-top: 20px;
            border: 3px solid black; /* Increased border width */
        }

        th, td {
            border: 2px solid ;
        }

        th, td {
            padding: 8px;
        }

        th {
        }

        .pass {
            color: white;
            background-color: green;
        }

        .fail {
            color: white;
            background-color: red;
        }

        input[type="text"],
        select,
        input[type="date"],
        input[type="submit"] {
            padding: 10px;
            margin: 5px;
            border-radius: 5px;
            border: 1px solid #ccc;
            width: 200px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #008CBA;
            color: white;
            cursor: pointer;
        }

        .back-button {
            background-color: red;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .print-button {
        margin-top:10px;
            background-color: #008CBA;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
              .container1{
            text-align: center;
            margin-top: 30px;;
            margin-bottom: 50px;
        }
        .container1 p{
            text-align: center;
        }
        .container1 h1{
            font-size: 20px;
            text-align: center;
        }
    </style>
    <script>
        // Function to redirect back to viewResult.jsp
        function redirectToViewResult() {
            window.location.href = "viewResult.jsp";
        }
    </script>
</head>
<body>
    <div class="container">

        <% // Server-side processing
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
                String dob = request.getParameter("dob");

                // Query to fetch result based on reg_no, sem, and date of birth along with student details
                PreparedStatement pstmt = null;
                ResultSet rs = null;
                String selectQuery = "SELECT m.*, s.student_name, s.father_name, s.date_of_birth, s.branch " +
                                     "FROM marks m " +
                                     "INNER JOIN student s ON m.reg_no = s.reg_no " +
                                     "WHERE m.reg_no = ? AND m.sem = ? AND s.date_of_birth = ?";
                try {
                    pstmt = conn.prepareStatement(selectQuery);
                    pstmt.setString(1, regNo);
                    pstmt.setString(2, sem);
                    pstmt.setString(3, dob);
                    rs = pstmt.executeQuery();

                    // Check if result exists
                    if (rs.next()) {
        %> 
    <div class="container1">
    <img src="karnataka.png" height="60px"; width="60px">
    
        <h2>Board of Technical Education Karnataka</h2>
        <p>Diploma Results 2024</p>
    </div>
    <table border="2px" style="background-color: rgb(255, 255, 255);">
        <tr>
            <th colspan="2" style="text-align: left; margin-left: 20px;">Registration Number : <%= regNo %></th>
            <th colspan="2" style="text-align: left; margin-left: 20px;">Student Name : <%= rs.getString("student_name") %></th>
        </tr>
<tr>
                                <th colspan="2" style="text-align: left; margin-left: 20px;">Date of Birth : <%= rs.getString("date_of_birth") %></th>
                                <th colspan="2" style="text-align: left; margin-left: 20px;">Father's Name : <%= rs.getString("father_name") %> </th>
                            </tr>
                            <tr>
                                <th colspan="2" style="text-align: left; margin-left: 20px;"> Branch : <%= rs.getString("branch") %></th>
                                <th colspan="2" style="text-align: left; margin-left: 20px;">Semester : <%= sem %></th>
                            </tr>
                            <tr style="background-color: #FFB6C1;">
                                <th>Subject Name</th>
                                <th>Max Marks</th>
                                <th>Obtained Marks</th>
                                <th>Remarks</th>
                            </tr>
                            <tr style="background-color: #FFFFED;">
                                <td><%= rs.getString("sub1_name") %></td>
                                <td><%= rs.getInt("sub1_max_marks") %></td>
                                <td><%= rs.getInt("sub1_obt_marks") %></td>
                                <td><%= rs.getInt("sub1_obt_marks") >= 35 ? "Pass" : "Fail" %></td>
                            </tr>
                            <% // Check if sub2, sub3, sub4, and sub5 have values
                                boolean sub2Exists = rs.getString("sub2_name") != null;
                                boolean sub3Exists = rs.getString("sub3_name") != null;
                                boolean sub4Exists = rs.getString("sub4_name") != null;
                                boolean sub5Exists = rs.getString("sub5_name") != null;

                                // Display sub2 details if exists
                                if (sub2Exists) {
                            %>
                                    <tr style="background-color: #FFFFED;">
                                        <td><%= rs.getString("sub2_name") %></td>
                                        <td><%= rs.getInt("sub2_max_marks") %></td>
                                        <td><%= rs.getInt("sub2_obt_marks") %></td>
                                        <td><%= rs.getInt("sub2_obt_marks") >= 35 ? "Pass" : "Fail" %></td>
                                    </tr>
                            <%     }

                                    // Display sub3 details if exists
                                    if (sub3Exists) {
                            %>
                                    <tr  style="background-color: #FFFFED;">
                                        <td><%= rs.getString("sub3_name") %></td>
                                        <td><%= rs.getInt("sub3_max_marks") %></td>
                                        <td><%= rs.getInt("sub3_obt_marks") %></td>
                                        <td><%= rs.getInt("sub3_obt_marks") >= 35 ? "Pass" : "Fail" %></td>
                                    </tr>
                            <%     }

                                    // Display sub4 details if exists
                                    if (sub4Exists) {
                            %>
                                    <tr style="background-color: #FFFFED;">
                                        <td><%= rs.getString("sub4_name") %></td>
                                        <td><%= rs.getInt("sub4_max_marks") %></td>
                                        <td><%= rs.getInt("sub4_obt_marks") %></td>
                                        <td><%= rs.getInt("sub4_obt_marks") >= 35 ? "Pass" : "Fail" %></td>
                                    </tr>
                            <%     }

                                    // Display sub5 details if exists
                                    if (sub5Exists) {
                            %>
                                    <tr style="background-color: #FFFFED;">
                                        <td><%= rs.getString("sub5_name") %></td>
                                        <td><%= rs.getInt("sub5_max_marks") %></td>
                                        <td><%= rs.getInt("sub5_obt_marks") %></td>
                                        <td><%= rs.getInt("sub5_obt_marks") >= 35 ? "Pass" : "Fail" %></td>
                                    </tr>
                            <%     }

                                    // Calculate total obtained marks for all subjects
                                    int totalObtainedMarks = rs.getInt("sub1_obt_marks") +
                                                              (sub2Exists ? rs.getInt("sub2_obt_marks") : 0) +
                                                              (sub3Exists ? rs.getInt("sub3_obt_marks") : 0) +
                                                              (sub4Exists ? rs.getInt("sub4_obt_marks") : 0) +
                                                              (sub5Exists ? rs.getInt("sub5_obt_marks") : 0);
                            %>
                            <tr style="background-color: #;">
                                <td colspan="2"><b>Total Obtained Marks:</b></td>
                                <td style="font-weight: bold;"><%= totalObtainedMarks %></td>
                                <td></td>
                            </tr>
                            <% // Calculate overall result based on remarks
                                boolean pass = rs.getInt("sub1_obt_marks") >= 35 &&
                                               (sub2Exists ? rs.getInt("sub2_obt_marks") >= 35 : true) &&
                                               (sub3Exists ? rs.getInt("sub3_obt_marks") >= 35 : true) &&
                                               (sub4Exists ? rs.getInt("sub4_obt_marks") >= 35 : true) &&
                                               (sub5Exists ? rs.getInt("sub5_obt_marks") >= 35 : true);
                            %>
                            <tr class="<%= pass ? "pass" : "fail" %>">
                                <td colspan="3"><b>Overall Result:</b></td>
                                <td><%= pass ? "Pass" : "Fail" %></td>
                            </tr>
                        </table>
    <button type="button" class="back-button" onclick="redirectToViewResult()">Back</button>
<button type="button" class="print-button" onclick="printResult()">Print Result</button>
        <%          
            } else {
                // If result not found, display alert and redirect to viewResult.jsp
                out.println("<script>alert('Result not found.'); redirectToViewResult();</script>");
            }
        } catch (SQLException e) {
            out.println("Error fetching result: " + e.getMessage());
        } finally {
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    out.println("Error closing ResultSet: " + e.getMessage());
                }
            }
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
</div>
<script>
    function printResult() {
        window.print();
    }
</script>
</body>
</html>
