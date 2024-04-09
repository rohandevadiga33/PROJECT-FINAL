<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
 <title>View Results</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-image: url('bgresult.jpg'); /* Background image */
            background-size: cover;
            background-repeat: no-repeat;
            /* background-attachment: fixed; */
            background-position: center;
            background-color: rgba(0, 0, 0, 0.5); /* Black with opacity */
            margin-top: 190px;
        }
        
        .container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background-color: rgba(255, 200, 200, 0.897); /* White with opacity */
            border-radius: 30px;
            box-shadow: 0 0 30px rgb(0, 0, 0); 
        }
        h5{
            text-align: center;
            color: #000000;
            margin-bottom: 30px;
            font-size: 28px;
            /* position: relative; */
        }

        h5::after {
            content: '';
            /* display:flex; */
            width: 50%;
            height: 2px;
            /* background-color: #007bff; Color underline */
            /* position: absolute; */
            bottom: -10px;
            left: 25%;
        }

        h3{
            text-align: center;
            color: #000000;
            font-size: 24px;
            margin-top: 30px;
        }
        
        form {
            margin-top: 20px;
        }
        
        .form-group {
            margin-bottom: 20px;
        }
        
        label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
            color: #000000;
        }
        
        input[type="text"],
        input[type="date"],
        select {
            width: calc(100% - 20px);
            padding: 10px;
            border: 2px solid #ccc; /* Border */
            border-radius: 5px;
            background-color: #f9f9f9;
            transition: border-color 0.3s ease;
            font-size: 16px;
        }

        select {
            appearance: none;
            -webkit-appearance: none;
            -moz-appearance: none;
            background-image: url("data:image/svg+xml;utf8,<svg fill='#555' height='24' viewBox='0 0 24 24' width='24' xmlns='http://www.w3.org/2000/svg'><path d='M7 10l5 5 5-5z'/><path d='M0 0h24v24H0z' fill='none'/></svg>");
            background-repeat: no-repeat;
            background-position-x: 95%;
            background-position-y: 50%;
            cursor: pointer;
        }
        
        input[type="submit"] {
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 5px;
            background-color: #007bff;
            color: #fff;
            cursor: pointer;
            transition: background-color 0.3s ease;
            font-size: 18px;
        }
        
        input[type="submit"]:hover {
            background-color: #0056b3;
        }

        marquee {
            color: #ff0000;
            /* margin-top: 10px; */
            font-size: 15px;
            font-family:Arial, Helvetica, sans-serif;
            font-weight: 700;
            /* background-color: #fffb00; */
        }

        input[type="text"]:focus,
        input[type="date"]:focus,
        select:focus {
            border-color: #ff1744; /* Neon red */
            outline: none;
        }
        /* header  */
        .header {
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
        
        .header h1 {
            margin: 0;
            padding: 0;
            font-size: 24px;
            margin-right: 10px; /* Add some spacing between the logo and text */
        }
        
        .header p {
            margin: 5px 0 0;
            padding: 0;
            font-size: 18px;
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
    p{
        top: 140px;

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

    <div class="header">
        <img src="logo.png" alt="College Logo">
        <div>
            <h1>Dr TMA Pai Polytechnic</h1>
            <p>A unit of Dr. TMA Pai Foundation, Manipal</p>
        </div>
    </div>
    
    <div class="navbar">
        <ul>
            <li><a href="index.html">Home</a></li>
            <li><a href="about.html">About</a></li>
            <li><a href="courses.html">Courses</a></li>
            <li><a href="admision.html">Admission</a></li>
            <li><a href="result.jsp">Result</a></li>
            <!-- <li><a href="#news">News</a></li> -->
            <li class="dropdown">
                <a href="#" class="dropbtn">Login &#9662;</a>
                <div class="dropdown-content">
                  <a href="student-login.jsp">Student Login</a>
                  <a href="admin-login.jsp">Admin Login</a>
                  <a href="teacher-login.jsp">Teacher Login</a>
                </div>
              </li>
        </ul>
    </div>
    
    <div class="container">
        <h5>Dr TMA Pai Polytechnic Manipal</h5>
        
        <form action="viewresult.html" method="post" id="resultForm">
            <div class="form-group">
                <label for="registration_number">Registration Number:</label>
                <input type="text" id="registration_number" name="registration_number" required>
            </div>
            <div class="form-group">
                <label for="dob">Date of Birth:</label>
                <input type="date" id="dob" name="dob" required>
            </div>
            <div class="form-group">
                <label for="semester">Select Semester:</label>
                <select id="semester" name="semester" required>
                    <option value="">Select Semester</option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="6">6</option>
                </select>
            </div>
            <input type="submit" value="Submit">
        </form>
        <h3>* All The Best Students *</h3>
        <!-- <a href="homepage.html">Back to Home Page</a> -->
    </div>
    
    <script>
        document.getElementById('resultForm').addEventListener('submit', function(event) {
            event.preventDefault(); // Prevent form submission
    
            var registrationNumber = document.getElementById('registration_number').value;
            var dob = document.getElementById('dob').value;
            var semester = document.getElementById('semester').value;
    
            // Check conditions for redirection
            if (registrationNumber === '1' && dob === '2024-01-01' && semester === '1') {
                window.location.href = 'viewresult.jsp'; // Redirect to viewresult.html
            } else {
                alert('Invalid credentials for viewing results.'); // Show alert for invalid credentials
            }
        });
        
    </script>
    
<footer class="footer">
    <div class="affiliation">
      <img src="karnataka.png" alt="Karnataka Affiliation">
      <p>Department of Technical Education, Karnataka</p>
    </div>
    <div class="contact-info">
      <p>Dr. TMA Pai Polytechnic</p>
      <p>MIT Campus Eshwar Nagar Manipal 576104, Karnataka</p>
      <p>Email:manipal.polytech@gmail.com</p>
      <p>Phone: 9901476678</p>
      <p> &copy; 2024 College Name. All rights reserved</p>
  
    </div>
    <div class="social-links">
      <a href="https://www.instagram.com/tmapaipolytechnic/" target="_blank"><img src="instalogo.jpg" alt="Instagram"></a>
      <a href="https://www.facebook.com/p/DrT-M-A-Pai-Polytechnic-Manipal-100066598946326/" target="_blank"><img src="facebooklogo.png" alt="Facebook"></a>
      <a href="https://www.linkedin.com/company/drtmapaipolytechnic" target="_blank"><img src="linkedinlogo.jpg" alt="LinkedIn"></a>
    </div>
  </footer>
</body>
    </html>