<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Student Marks Management</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #ffe4e4;
    }

    .container {
        width: 100%;
        max-width: 1200px;
        margin: 0 auto;
        padding: 20px;
        background-color: #f0f0f0;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        margin-top: 180px;
        margin-bottom: 50px;
    }

    h3{
        text-align: center;
        color: #333;
        font-size: 30px;;
    }

    .form-group {
        margin-bottom: 20px;
        display: flex;
        flex-direction: row;
    }

    .form-group label {
        flex: 1;
        text-align: left;
        padding-right: 10px;
        font-weight: bold;
        color: #555;
    }

    .form-group input {
        flex: 1;
        padding: 8px;
        border: 1px solid #ccc;
        border-radius: 5px;
        width: calc(50% - 5px); /* Adjusted width for two columns with spacing */
    }

    .form-group input[type="submit"] {
        width: 100%;
    }

    input[type="submit"] {
        padding: 10px 20px;
        background-color: #007bff;
        color: #fff;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s;
    }

    input[type="submit"]:hover {
        background-color: #0056b3;
    }

    table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }

    th, td {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: left;
    }

    th {
        background-color: #f2f2f2;
    }

    tr:nth-child(even) {
        background-color: #f9f9f9;
    }

    .search-container {
        text-align: center;
        margin-top: 20px;
    }

    .search-box {
        padding: 8px;
        border-radius: 5px;
        border: 1px solid #ccc;
    }

    .search-btn {
        padding: 8px 16px;
        background-color: #007bff;
        color: #fff;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s;
    }

    .search-btn:hover {
        background-color: #0056b3;
    }

    .full-width {
        width: 100%;
    }

    
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
/*       
 .dropdown {
  float: right; 
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
} */ 
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
      <li><a href="teacheronly.html">Home</a></li>
      <li><a href="about.html" onclick="return confirmLogout()">About</a></li>
      <li><a href="courses.html" onclick="return confirmLogout()">Courses</a></li>
      <li><a href="admision.html" onclick="return confirmLogout()">Admission</a></li>
      <li><a href="result.html"onclick="return confirmLogout()">Results</a></li>
      <!-- <li><a href="#news">News</a></li> -->
      <li><a href="addupdatemarks.html">Add/Update Marks</a></li>
      <li><a href="index.html" style="color: red;" onclick="return confirmLogout()">Logout</a></li>
  
  
  
    </ul>
  </div>
  <script>
    function confirmLogout() {
        return confirm("Are you sure you want to log out?");
    }
</script>

<div class="container">
    <h3>Student Marks Management</h3>
    <div class="form-group">
        <label for="studentName">Student Name:</label>
        <input type="text" id="studentName" placeholder="Enter student name" class="full-width">
    </div>
    <div class="form-group">
        <label for="regNumber">Registration Number:</label>
        <input type="text" id="regNumber" placeholder="Enter registration number" class="full-width">
    </div>
    <div class="form-group">
        <label for="kannadaMax">Kannada:</label>
        <input type="number" id="kannadaMax" min="0" placeholder="Maximum marks" class="half-width">
        <input type="number" id="kannadaObtained" min="0" placeholder="Obtained marks" class="half-width">
    </div>
    <div class="form-group">
        <label for="englishMax">English:</label>
        <input type="number" id="englishMax" min="0" placeholder="Maximum marks" class="half-width">
        <input type="number" id="englishObtained" min="0" placeholder="Obtained marks" class="half-width">
    </div>
    <div class="form-group">
        <label for="hindiMax">Hindi:</label>
        <input type="number" id="hindiMax" min="0" placeholder="Maximum marks" class="half-width">
        <input type="number" id="hindiObtained" min="0" placeholder="Obtained marks" class="half-width">
    </div>
    <div class="form-group">
        <label for="mathsMax">Maths:</label>
        <input type="number" id="mathsMax" min="0" placeholder="Maximum marks" class="half-width">
        <input type="number" id="mathsObtained" min="0" placeholder="Obtained marks" class="half-width">
    </div>
    <div class="form-group">
        <label for="biologyMax">Biology:</label>
        <input type="number" id="biologyMax" min="0" placeholder="Maximum marks" class="half-width">
        <input type="number" id="biologyObtained" min="0" placeholder="Obtained marks" class="half-width">
    </div>
    <div class="form-group">
        <label for="chmaMax">CHMA:</label>
        <input type="number" id="chmaMax" min="0" placeholder="Maximum marks" class="half-width">
        <input type="number" id="chmaObtained" min="0" placeholder="Obtained marks" class="half-width">
    </div>
    <div class="form-group">
        <input type="submit" value="Add/Update Marks" onclick="addOrUpdateMarks()" class="full-width">
    </div>
    
    <div class="search-container">
        <label for="searchRegNumber">Search by Registration Number:</label>
        <input type="text" id="searchRegNumber" class="search-box" placeholder="Enter registration number">
        <button class="search-btn" onclick="searchStudentByRegNumber()">Search</button>
    </div>
    
    <table id="studentTable">
        <thead>
            <tr>
                <th>Registration Number</th>
                <th>Student Name</th>
                <th>Kannada (Max)</th>
                <th>Kannada (Obtained)</th>
                <th>English (Max)</th>
                <th>English (Obtained)</th>
                <th>Hindi (Max)</th>
                <th>Hindi (Obtained)</th>
                <th>Maths (Max)</th>
                <th>Maths (Obtained)</th>
                <th>Biology (Max)</th>
                <th>Biology (Obtained)</th>
                <th>CHMA (Max)</th>
                <th>CHMA (Obtained)</th>
            </tr>
        </thead>
        <tbody>
            <!-- Student marks will be populated here -->
        </tbody>
    </table>
</div>

<script>
    let students = []; // Array to store student data

    function addOrUpdateMarks() {
        const studentName = document.getElementById("studentName").value;
        const regNumber = document.getElementById("regNumber").value;
        const kannadaMax = document.getElementById("kannadaMax").value;
        const kannadaObtained = document.getElementById("kannadaObtained").value;
        const englishMax = document.getElementById("englishMax").value;
        const englishObtained = document.getElementById("englishObtained").value;
        const hindiMax = document.getElementById("hindiMax").value;
        const hindiObtained = document.getElementById("hindiObtained").value;
        const mathsMax = document.getElementById("mathsMax").value;
        const mathsObtained = document.getElementById("mathsObtained").value;
        const biologyMax = document.getElementById("biologyMax").value;
        const biologyObtained = document.getElementById("biologyObtained").value;
        const chmaMax = document.getElementById("chmaMax").value;
        const chmaObtained = document.getElementById("chmaObtained").value;
        
        // Find if the student already exists
        const existingStudentIndex = students.findIndex(student => student.registrationNumber === regNumber);
        
        if (existingStudentIndex !== -1) {
            // Update marks if student already exists
            students[existingStudentIndex].marks.kannada.max = kannadaMax;
            students[existingStudentIndex].marks.kannada.obtained = kannadaObtained;
            students[existingStudentIndex].marks.english.max = englishMax;
            students[existingStudentIndex].marks.english.obtained = englishObtained;
            students[existingStudentIndex].marks.hindi.max = hindiMax;
            students[existingStudentIndex].marks.hindi.obtained = hindiObtained;
            students[existingStudentIndex].marks.maths.max = mathsMax;
            students[existingStudentIndex].marks.maths.obtained = mathsObtained;
            students[existingStudentIndex].marks.biology.max = biologyMax;
            students[existingStudentIndex].marks.biology.obtained = biologyObtained;
            students[existingStudentIndex].marks.chma.max = chmaMax;
            students[existingStudentIndex].marks.chma.obtained = chmaObtained;
        } else {
            // Add new student if not found
            const newStudent = {
                registrationNumber: regNumber,
                studentName: studentName,
                marks: {
                    kannada: {
                        max: kannadaMax,
                        obtained: kannadaObtained
                    },
                    english: {
                        max: englishMax,
                        obtained: englishObtained
                    },
                    hindi: {
                        max: hindiMax,
                        obtained: hindiObtained
                    },
                    maths: {
                        max: mathsMax,
                        obtained: mathsObtained
                    },
                    biology: {
                        max: biologyMax,
                        obtained: biologyObtained
                    },
                    chma: {
                        max: chmaMax,
                        obtained: chmaObtained
                    }
                }
            };
            students.push(newStudent);
        }
        
        displayStudents();
    }

    function searchStudentByRegNumber() {
        const searchRegNumber = document.getElementById("searchRegNumber").value;
        const student = students.find(student => student.registrationNumber === searchRegNumber);
        
        if (student) {
            document.getElementById("studentName").value = student.studentName;
            document.getElementById("regNumber").value = student.registrationNumber;
            document.getElementById("kannadaMax").value = student.marks.kannada.max;
            document.getElementById("kannadaObtained").value = student.marks.kannada.obtained;
            document.getElementById("englishMax").value = student.marks.english.max;
            document.getElementById("englishObtained").value = student.marks.english.obtained;
            document.getElementById("hindiMax").value = student.marks.hindi.max;
            document.getElementById("hindiObtained").value = student.marks.hindi.obtained;
            document.getElementById("mathsMax").value = student.marks.maths.max;
            document.getElementById("mathsObtained").value = student.marks.maths.obtained;
            document.getElementById("biologyMax").value = student.marks.biology.max;
            document.getElementById("biologyObtained").value = student.marks.biology.obtained;
            document.getElementById("chmaMax").value = student.marks.chma.max;
            document.getElementById("chmaObtained").value = student.marks.chma.obtained;
        } else {
            alert("Student not found with the provided registration number.");
        }
    }
    
    function displayStudents(studentList = students) {
        const tableBody = document.querySelector("#studentTable tbody");
        tableBody.innerHTML = ""; // Clear existing rows
        
        studentList.forEach(student => {
            const row = `<tr>
                            <td>${student.registrationNumber}</td>
                            <td>${student.studentName}</td>
                            <td>${student.marks.kannada.max}</td>
                            <td>${student.marks.kannada.obtained}</td>
                            <td>${student.marks.english.max}</td>
                            <td>${student.marks.english.obtained}</td>
                            <td>${student.marks.hindi.max}</td>
                            <td>${student.marks.hindi.obtained}</td>
                            <td>${student.marks.maths.max}</td>
                            <td>${student.marks.maths.obtained}</td>
                            <td>${student.marks.biology.max}</td>
                            <td>${student.marks.biology.obtained}</td>
                            <td>${student.marks.chma.max}</td>
                            <td>${student.marks.chma.obtained}</td>
                        </tr>`;
            tableBody.innerHTML += row;
        });
    }
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
