<%--
  Created by IntelliJ IDEA.
  User: Binali Ukwatte
  Date: 27-01-2024
  Time: 11:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
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
            transition: all 0.3s ease-in-out;
            transform: translateY(-3px);
        }

        main {
            display: flex;
            justify-content: center;
            align-items: center;
            height: calc(100vh - 120px); /* Adjust the height as needed */
        }

        .container {
            display: flex;
            margin-top: -60px;
            justify-content: center;
            align-items: center;
            height: 100vh;

        }

        .form-box {
            background-color: rgba(255, 255, 255, 0.5);
            padding: 50px 100px 50px 100px    ;
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
            transition: all 0.3s ease-in-out;
        }

        .proceed:hover {
            background-color: rgba(0, 0, 0, 0.2);
            transform: translateY(3px);
        }

        a {
            color: black;
            text-decoration: none;
            transition: all 0.3s ease-in-out;
        }

        a:hover {
            transform: translateY(-3px);
        }

        .input-field {
            border-color: black;
            border-radius: 5px;
            padding: 10px;
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

        .remember {
            margin-top: 5px;
            opacity: 0.75;
        }


    </style>
</head>
<body>


<header>
    <script>
        // Disable browser navigation buttons
        history.pushState(null, null, location.href);
        window.onpopstate = function () {
            history.go(1);
        };
    </script>
    <nav>
        <div class="logo">
            <a href="HomePage.jsp"> <img src='images/logo.png' alt="Logo"></a>
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
            <a href="Astrologer_Login.jsp">
                <button class="signin">Sign In</button>
            </a>
            <a href="Astrologer_Registration.jsp">
                <button class="signup"> | Sign Up</button>
            </a>
        </div>


    </nav>
</header>

<div class="container">
    <div class="form-box">
        <h1 class="heading">Login</h1>
        <br>
        <br>
        <form action="astrologerLogin" method="POST" id="login-form">
            <label for="email">Email: </label><br>
            <input type="text" id="email" name="email" class="input-field" placeholder="example@email.com" required><br><br>

            <label for="password">Password:</label><br>
            <input type="password" id="password" name="password" class="input-field" required><br><br>

            <div class="remember">
                <label for="remember">
                    <input type="checkbox" name="remember" id="remember">
                    Remember Me
                </label>
            </div>

            <br>
            <input type="submit" class="proceed" id="proceedBtn" name="proceed" value="Submit">
            <br>
            <br>
            <a href="forgotPassword.jsp" id="link">Forgot Password?</a>

        </form>
    </div>
</div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js" defer></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11" defer></script>
<script src="js/login.js" defer></script>
</html>
