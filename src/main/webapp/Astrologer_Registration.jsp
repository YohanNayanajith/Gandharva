<%--
  Created by IntelliJ IDEA.
  User: Binali Ukwatte
  Date: 02-11-2023
  Time: 12.00
  To change this template use File | Settings | File Templates.
--%>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Astrologer Registration check</title>
    <style>
        body {
            background-image: url('images/background.jpg');
            background-size: cover;
            background-repeat: no-repeat;

        }

        body::before {
            content: "";
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100vh;
            background: rgba(70, 70, 70, 0.55);
            z-index: -1;
        }

            * {
                margin: 0;
                padding: 0;

            }

            body {

                padding: 0;
                background-size: cover;
                background-repeat: no-repeat;
                background-attachment: fixed;
                font-family: Arial, sans-serif;

            }


            header {
                background-color: rgba(0, 0, 0, 0.8);
                padding: 20px 0;
            }

            nav {

                color: black;
                display: flex;
                justify-content: space-between;
                align-items: center;
                max-width: 1200px;
                height: 50px;
                margin: 0 auto;
                padding: 0 20px;
            }


            .logo img {
                height: 75px;
                margin-left: -120px;
                border: none;
            }

            .navbar {

                list-style-type: none;
                display: flex;
                gap: 10px;
            }

            .navbar li {
                gap: 10px;
                margin-left: 50px;
            }

            .navbar a {
                text-decoration: none;
                color: white;
                font-size: 20px;
            }

            .navbar a:hover {
                text-decoration: underline;
            }

        .submenu {
            list-style-type: none;
            display: none;
            position: absolute;
            background-color: rgba(0, 0, 0, 0.53);
            padding: 10px;
            margin-left: 5px;
        }

        .navbar li:hover .submenu {
            padding-top: 10px;
            line-height: 50px;
            display: block;
        }


            .buttons button {
                font-size: 20px;
                color: white;
                background: none;
                border: none;
                cursor: pointer;
                margin-left: 10px;
            }

            .buttons button:hover {
                text-decoration: underline; /* Underline button text on hover */
            }

            main {
                display: flex;
                justify-content: center;
                align-items: center;
                height: calc(100vh - 120px); /* Adjust the height as needed */
            }

            .container {
                display: flex;
                margin-top: 50px;
                justify-content: center;
                align-items: center;
                height: 100vh;

            }

            .form-box {
                background-color: rgba(255, 255, 255, 0.5);
                padding: 20px;
                border: 1px solid #000;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
                max-width: 80%;
                margin: 0 auto;
                font-size: 16px;
        }



        .heading {
                text-align: center;
            }

        .step-text {
            text-align: center;
            font-weight: bold;
        }

        .terms {
            color: white;
            text-decoration: none;
            font-size: medium;
        }

        .terms a:hover {
            text-decoration: underline;
        }
        .proceed {
            font-size: large;
            background-color: rgba(255, 255, 255, 0.4);
            color: black;
            padding: 10px 20px;
            border-radius: 50px;
            border: none;
            cursor: pointer;
            margin-bottom: -400px;
        }

        .proceed:hover {
            background-color: rgba(255, 255, 255, 0.2);
            text-decoration: underline;
        }
        a {
            color: black;
            text-decoration: none;
            }

        a:hover {
            text-decoration: underline;
        }

        .input-field{
            border-color: black;
            border-radius: 5px;
            padding: 5px;
            align: left;
        }


    </style>
</head>
<body>


<header>
    <nav>
        <div class="logo">
            <a href="HomePage.jsp"> <img src='images/logo.png' alt="Logo" ></a>
        </div>
        <ul class="navbar">
            <li><a href="#">About Us</a></li>
            <li><a href="#">Our Services</a>
                <ul class="submenu">
                    <li><a href="Astrologer_Registration.jsp">Astrologer</a></li>
                    <li><a href="#">Event Planner</a></li>
                </ul>
            </li>
            <li><a href="#">Pricing</a></li>
            <li><a href="#">Help</a></li>
        </ul>

        <div class="buttons">
            <a href="Astrologer_Login.jsp"> <button class="signin">Sign In </button></a>
            <a href="Astrologer_Registration.jsp"><button class="signup"> |  Sign Up </button> </a>
        </div>


    </nav>
</header>

<div class="container">
    <div class="form-box">
        <h1 class="heading">Astrologer Registration</h1>
        <br>
        <p class="step-text">Step 1 of 2</p>
        <br>
        <form action="astrologerRegistration" method="POST" enctype="multipart/form-data">
            <label for="first_name">First Name:</label><br>
            <input type="text" id="first_name" name="first_name" class="input-field" required><br><br>


            <label for="last_name">Last Name:</label><br>
            <input type="text" id="last_name" name="last_name" class="input-field" required><br><br>


            <label for="experience">Years of Experience:</label><br>
            <input type="text" id="experience" name="year_of_experience" class="input-field"  required><br><br>


            <label for="district" >Select your District: </label><br>
            <select id="district" name="district" class="input-field"  required>
                <option value="" disabled selected>Select a District</option>
                <option value="Ampara">Ampara</option>
                <option value="Anuradhapura">Anuradhapura</option>
                <option value="Badulla">Badulla</option>
                <option value="Batticaloa">Batticaloa</option>
                <option value="Colombo">Colombo</option>
                <option value="Galle">Galle</option>
                <option value="Gampaha">Gampaha</option>
                <option value="Hambantota">Hambantota</option>
                <option value="Jaffna">Jaffna</option>
                <option value="Kalutara">Kalutara</option>
                <option value="Kandy">Kandy</option>
                <option value="Killinochchi">Killinochchi</option>
                <option value="Kurunegala">Kurunegala</option>
                <option value="Mannar">Mannar</option>
                <option value="Matale">Matale</option>
                <option value="Matara">Matara</option>
                <option value="Monaragala">Monaragala</option>
                <option value="Mulativu">Mulativu</option>
                <option value="Nuwara Eliya">Nuwara Eliya</option>
                <option value="Pollonnaruwa">Pollonnaruwa</option>
                <option value="Puttalam">Puttalam</option>
                <option value="Ratnapura">Ratnapura</option>
                <option value="Trincomalee">Trincomalee</option>
                <option value="Vavuniya">Vavuniya</option>
            </select>
            <br><br>


            <label for="email">E-mail: </label><br>
            <input type="text" id="email" name="email" class="input-field"  required><br><br>


            <label for="password">Password:</label><br>
            <input type="password" id="password" name="password" class="input-field"  required><br><br>


            <label for="confirmPassword">Confirm Password:</label><br>
            <input type="password" id="confirmPassword" name="confirm_password" class="input-field" >

            <br><br>
            <label for="certificates">Upload Certificates:</label><br>
            <input type="file" id="certificates" name="certificate" class="input-field" accept=".pdf, .jpg, .png" multiple><br><br>
            <input type="submit" class="proceed" id="proceedBtn" name="proceed" value="Proceed">






            <br>
            <br>
            <br>
            <p class="terms"><a href="#">Terms and Conditions</a></p>
            <br>

            <b> <p> Already have an account? </b><a href="Astrologer_Login.jsp"> Sign In</a> </p>
        </form>
    </div>
</div>

<script>
    document.addEventListener("DOMContentLoaded", function() {
        var password = document.getElementById("password");
        var confirmPassword = document.getElementById("confirmPassword");
        var submitBtn = document.getElementById("proceedBtn");

        confirmPassword.addEventListener("keyup", function() {
            if (password.value !== confirmPassword.value) {
                confirmPassword.setCustomValidity("Passwords do not match");
            } else {
                confirmPassword.setCustomValidity("");
            }
        });

        submitBtn.addEventListener("click", function(event) {
            if (password.value !== confirmPassword.value) {
                event.preventDefault(); // Prevent form submission if passwords don't match
                alert("Passwords do not match");
            }
        });
    });
</script>

</body>
</html>
