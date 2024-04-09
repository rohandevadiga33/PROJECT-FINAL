<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fee Management</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
    }
    .container {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }
    .button-container {
        text-align: center;
    }
    .button {
        padding: 10px 20px;
        font-size: 18px;
        border: none;
        border-radius: 5px;
        background-color: #4CAF50; /* Green */
        color: white;
        cursor: pointer;
        margin: 10px;
        text-decoration: none;
    }
    .button:hover {
        background-color: #45a049; /* Darker Green */
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
        <div class="button-container">
            <a href="addfees.jsp" class="button">Add Fees</a>
            <a href="updatefees.jsp" class="button">Update Fees</a>
        </div>
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
    <p> &copy; 2024 College Name. All rights reserved</p>

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
        loadFile('headeradmin.html', 'headerContainer');
       // loadFile('footer.html', 'footerContainer');
    </script>
</body>
</html>
