<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Student</title>
    <style>
     
        .container {
            text-align: center;
          margin: 100px auto;
    margin-top:30vh;
        }
        .button {
            padding: 10px 20px;
            font-size: 18px;
            background-color: #4CAF50; /* Green */
            border: none;
            color: white;
            border-radius: 8px;
            cursor: pointer;
            margin: 5px;
            text-decoration: none;
        }
        .button:hover {
            background-color: #45a049;
        }
        /* Styles for the footer */
        body, html {
        background: #FFFF99;
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
    <div id="headerContainer"></div>
    <div class="container">
        <button class="button" onclick="location.href='addstudent.jsp'">Add Student</button>
        <button class="button" onclick="location.href='viewstudent.jsp'">View Student Details</button>
        <button class="button" onclick="location.href='updatestudent.jsp'">Update Student</button>
     
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
