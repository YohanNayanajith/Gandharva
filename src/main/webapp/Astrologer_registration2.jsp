<%--
  Created by IntelliJ IDEA.
  User: Binali Ukwatte
  Date: 02-11-2023
  Time: 13:13
  To change this template use File | Settings | File Templates.
--%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Astrologer Registration</title>
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
            /*background-color: rgba(0, 0, 0, 0.8);*/
            padding: 20px 0;
        }

        nav {
            /*color: black;*/
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
            position: relative;
            margin-top: 10%;
            height: fit-content;
            justify-content: center;
            align-items: center;


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

    </style>
</head>
<body>
<header>
    <nav>
        <div class="logo">
            <a href="HomePage.jsp"> <img src='images/logo.png' alt="Logo" ></a>
        </div>
<%--        <ul class="navbar">--%>
<%--            <li><a href="#">About Us</a></li>--%>
<%--            <li><a href="#">Our Services</a>--%>
<%--                <ul class="submenu">--%>
<%--                    <li><a href="Astrologer_Registration.jsp">Astrologer</a></li>--%>
<%--                    <li><a href="#">Event Planner</a></li>--%>
<%--                </ul>--%>
<%--            </li>--%>
<%--            <li><a href="#">Pricing</a></li>--%>
<%--            <li><a href="#">Help</a></li>--%>
<%--        </ul>--%>
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
        <p class="step-text">Step 2 of 2</p>
        <br>
        <p class="step-text">You are just a few steps <br> away from being a Gandharva Member</p>
        <form action="#" method="post" enctype="multipart/form-data">

            <%--@declare id="payment"--%><br>
            <label for="payment">Upload payment:</label>
            <input type="file" id="certificates" name="certificates" accept=".pdf, .jpg, .png" multiple><br><br>
            <br>
            <button class="proceed"><a href="Astrologer_Login.jsp">Proceed</a></button>
                <!--redirect to log in */ -->
            <br>
            <br>
            <br>
            <p class="terms"><a href="#">Terms and Conditions</a></p>
            <br>
        </form>
    </div>
</div>

</body>
</html>
