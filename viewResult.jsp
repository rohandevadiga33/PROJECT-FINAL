<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Result</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
             background-image: url('bgresult.jpg'); /* Background image */
            background-size: cover;
            background-repeat: no-repeat;
            /* background-attachment: fixed; */
            background-position: center;
            background-color: rgba(0, 0, 0, 0.5);
        }

          .container {
            max-width: 600px;
           
             margin: 100px auto;
    margin-top:30vh;
            padding: 20px;
            background-color: rgba(255, 200, 200, 0.897); /* White with opacity */
            border-radius: 30px;
            box-shadow: 0 0 30px rgb(0, 0, 0); 
                margin-bottom:20px;
            
        }

        h1 {
            color: #333;
            text-align:center;
        }

        table {
            border-collapse: collapse;
            width: 100%;
            margin-top: 20px;
            border: 6px;
        }

        th, td {
            border: 2px solid;
            padding: 8px;
        }

        .back-button, .print-button, input[type="submit"] {
            padding: 10px;
            margin: 5px;
            border-radius: 5px;
            border: none;
            cursor: pointer;
        }

        input[type="text"],
        select,
        input[type="date"],
        input[type="submit"] {
            padding: 10px;
            margin: 5px;
            border-radius: 5px;
            border: 1px solid #ccc;
            width: 100%;
            box-sizing: border-box;
        }

        input[type="submit"] {
        margin-top:20px;
            background-color: #008CBA;
            color: white;
        }

        .back-button {
            background-color: red;
            color: white;
        }

        .print-button {
            background-color: #008CBA;
            color: white;
        }
                 #allTheBest {
            font-size: 24px;
            font-weight: bold;
            text-align: center;
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
    <script>
        function goBack() {
            window.location.href = 'index.html';
        }

        function printResult() {
            window.print();
        }
    </script>
</head>
<body>
    <div id="headerContainer"></div>

    <div class="container">
        <h1>Dr T.M.A Pai Polytechnic Manipal</h1>
       <marquee behavior="scroll" direction="left" scrollamount="5">
        <span style="font-weight: bold; color: blue;">2024 1st sem,</span>
        <span style="font-weight: bold; color: blue;">3rd sem,</span>
        <span style="font-weight: bold; color: blue;">and 5th sem Results are out</span>
    </marquee>
        <form id="resultForm" method="post" action="displayResult.jsp">
            Registration Number:<br> <input type="text" name="reg_no" required><br>
            Semester:<br>
            <select name="sem" required>
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
                <option value="4">4</option>
                <option value="5">5</option>
                <option value="6">6</option>
            </select><br>
            Date of Birth:<br> <input type="date" name="dob" required><br>
            <input type="submit" name="submit" value="Submit">
                <p id="allTheBest">*  All The Best Students  *</p>
            
       <center>  <a href="index.html">Back to Home Page</a></center>
        </form>
    </div>
     <script>
        // JavaScript code to change the color of the text every 2 seconds
        setInterval(function() {
            var text = document.getElementById('allTheBest');
            var colors = ['#ff0000', '#00ff00', '#0000ff']; // Array of colors
            var randomColor = colors[Math.floor(Math.random() * colors.length)]; // Randomly select a color
            text.style.color = randomColor; // Apply the color to the text
        }, 2000); // Change color every 2 seconds
    </script>
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
        loadFile('header.html', 'headerContainer');
       // loadFile('footer.html', 'footerContainer');
       
    </script>
    
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
    
</body>
</html>
