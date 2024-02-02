<%--
  Created by IntelliJ IDEA.
  User: Binali Ukwatte
  Date: 29-01-2024
  Time: 22:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Choose your role</title>
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
            align-items: center;
            height: 100vh;
            justify-content: space-around;
            max-width: 1200px;
            margin: -40px auto;

        }

        .form-box {
            background-color: rgba(255, 255, 255, 0.5);
            padding: 50px;
            border: 1px solid #000;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
            max-width: 80%;
            font-size: 16px;
            width: 250px; /* Set fixed width for each container */
            transition: transform 0.3s ease-in-out;
        }

        .form-box:hover {
            transform: translateY(-10px);

        }


        .heading {
            text-align: center;
        }

        .step-text {
            text-align: center;
            font-weight: bold;
        }

        .link {
            color: white;
            text-decoration: none;
            font-size: medium;
        }

        .link a:hover {
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

        }

        .proceed:hover {
            background-color: rgba(255, 255, 255, 0.2);
            text-decoration: underline;
        }
        a {
            color: black;
            text-decoration: none;
        }

        /*a:hover {*/
        /*    text-decoration: underline;*/
        /*}*/

        .input-field{
            border-color: black;
            border-radius: 5px;
            padding: 5px;
            align: left;
        }
        label {
            display: flex;
            align-items: center; /* Align items vertically */
        }

        label input[type="checkbox"] {
            margin-right: 5px;
        }
        .form-group {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }

        .form-group input[type="checkbox"] {
            margin-right: 5px;
        }

        .remember{
            margin-top: 5px;
            opacity: 0.75;
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
        <a href="Astrologer_Registration.jsp"> <h1 class="heading">Astrologer</h1> </a>
    </div>

    <div class="form-box">
        <a href="login.jsp"> <h1 class="heading">User</h1> </a>
    </div>

    <div class="form-box">
        <a href="Astrologer_dashboard.jsp"> <h1 class="heading">Event Planner</h1> </a>
    </div>
</div>

</body>
</html>

