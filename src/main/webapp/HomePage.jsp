<%--
  Created by IntelliJ IDEA.
  User: Binali Ukwatte
  Date: 26-09-2023
  Time: 17:18
  To change this template use File | Settings | File Templates.
--%>

<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home Page</title>
    <style>
        /* Reset some default styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;

        }


        body {
            padding: 0;
            overflow-x: hidden;
            background-size: cover;
            background-repeat: no-repeat;
            /*background-attachment: fixed;*/
            font-family: Arial, sans-serif;

        }


        .section--1 {
            position: relative; /* Ensure the section is positioned relative to allow absolute positioning of the video */
            height: 100vh; /* Set the height of section--1 to cover the viewport */
            /*overflow: hidden; !* Hide overflowing content (e.g., video) *!*/
        }

        .section--2 img{
            opacity: 80%;
            height: 100vh;
            width: 100%;
            z-index: -1;
        }

        .section--3 img{
            height: 40vh;
            overflow: hidden;
            width: 100%;
            z-index: 1;
            opacity: 85%;

        }

        .require{
            color: red;
        }
        /*.section--3 .inquires .image{*/
        /*        !*opacity: 30%;*!*/
        /*    z-index: -1;*/

        /*}*/
        #video-background {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            object-fit: cover; /* This property ensures the video covers the entire area */
            z-index: -100;
        }

        /*header {*/
        /*    background-color: rgba(0, 0, 0, 0.5);*/
        /*    padding: 20px 0;*/
        /*}*/

        nav {
            position: fixed; /* Set navbar position to fixed */
            top: 0; /* Stick the navbar to the top */
            width: 100%;
            z-index: 1000;
            background-color: rgb(255,255,255,0.25);
            box-shadow: 0 10px 50px rgba(0,0,0, 0.5);
            padding: 50px;
            color: black;
            display: flex;
            justify-content: space-between;
            align-items: center;
            /*max-width: 1200px;*/
            height: 50px;
            margin: 0 auto;
        }

        .logo img {
            width: 100px; /* Adjust the width as needed */
            height: 100px; /* Adjust the height as needed */
            border: none;
        }


        .navbar {
            list-style-type: none;
            display: flex;
            gap: 10px;
            align-items: center; /* Center the items vertically */
        }

        .navbar li {
            gap: 10px;
            margin-left: 50px;
        }

        .navbar a {
            position: sticky;
            text-decoration: none;
            color: black;
            font-weight: bold;
            font-size: 20px;
        }

        .navbar :hover {
            transition: all 0.3s ease-in-out;
            transform: translateY(3px);
            /*background-color: #ddd;*/
            /*color: black;*/
            /*padding: 5px;*/


        }

        .submenu {
            margin-top: 2px;
            list-style-type: none;
            display: none;
            position: absolute;
            background-color: rgba(0, 0, 0, 0.25);
            color: white;
            padding: 10px;
            margin-left: 5px;
            margin-right: 5px;
            border-radius: 20px;
            border: none;
        }

        .navbar li:hover .submenu {
            background-color: rgba(255, 255, 255, 0.5);
            color: black;
            padding-top: 10px;
            line-height: 30px;
            display: block;
        }
        .buttons {
            display: flex;
            gap: 30px;
        }

        .buttons button {
            color: black;
            font-weight: bold;
            background: none;
            border: none;
            font-size: 20px;
            cursor: pointer;
            margin-left: 10px;
            margin-right: -20px;
            text-decoration: none; /* Apply text-decoration for consistency */
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

        .find-match {
            color: black;
            font-weight: bold;
            margin-left: 45%;
            margin-top: 550px;
            font-size: large;
            background-color: rgba(255, 255, 255, 0.4);
            padding: 10px 20px;
            border-radius: 50px;
            border: none;
            cursor: pointer;

        }

        .find-match:hover {
            background-color: rgba(255, 255, 255, 0.2); /* Lighten on hover */
            transition: all 0.3s ease-in-out;
            transform: translateY(3px);
        }
        a{
            color: black;
            text-decoration: none;
        }

        .vision--card {
            font-size: 20px;
            position: absolute;
            top: 1000px;
            left: 600px;
            transform: translate(-50%, -50%); /* Center the card */
            background-color: rgba(255, 255, 255, 0.8); /* Semi-transparent white background */
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.7); /* Add shadow for depth */
            z-index: 1; /* Ensure the card is above the image */
        }

        .mission--card{
            font-size: 20px;
            position: absolute;
            top: 1200px;
            left: 900px;
            transform: translate(-50%, -50%); /* Center the card */
            background-color: rgba(255, 255, 255, 0.8); /* Semi-transparent white background */
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.7); /* Add shadow for depth */
            z-index: 1; /* Ensure the card is above the image */

        }
        .inquiries--card{
            height: 70%;
            width: 50%;
            position: absolute;
            top: 1800px;
            left: 50%;
            transform: translate(-50%, -50%); /* Center the card */
            background-color: rgba(255, 255, 255, 0.8); /* Semi-transparent white background */
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(255,255,255, 0.3); /* Add shadow for depth */
            z-index: 1;
        }

        .section--3 {
            height: 100vh;
            display: flex;
            justify-content: center;
        }

        .section--3 .bgimg{
            opacity: 85%;
            height: 100vh;

        }


        .form-container form {
            position: relative;
        }

        .input-field {
            width: 100%;
        }


        #contact--img {
            position: absolute;
            top: 8px;
            left: 16px;
            font-size: 18px;
        }


        /* Footer Styles */

        .input-field,
        textarea {
            border-color: black;
            border-radius: 5px;
            padding: 5px;
            align: left;
            width: 100%; /* Ensures text areas span the full width */
            resize: none; /* Prevents users from resizing the text area */
        }

        footer {
            background-color: #333;
            color: #fff;
            padding: 40px 0;
        }

        .footer-container {
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
            max-width: 1200px;
            margin: 0 auto;
        }

        .footer-section {
            flex: 1;
            margin-bottom: 20px;
        }

        .footer-section h3 {
            font-size: 18px;
            margin-bottom: 15px;
        }

        .footer-section ul {
            list-style-type: none;
            padding: 0;
        }

        .footer-section ul li {
            margin-bottom: 10px;
        }

        .footer-section ul li a {
            color: #fff;
            text-decoration: none;
        }

        .footer-bottom {
            text-align: center;
            margin-top: 20px;
        }

        .social-icons a {
            color: #fff;
            margin-right: 10px;
            font-size: 20px;
            text-decoration: none;
        }

        /* Responsive Styles */

        @media screen and (max-width: 768px) {
            .footer-section {
                flex-basis: 50%;
            }

        }


        @media screen and (max-width: 576px) {
            .footer-section {
                flex-basis: 100%;
            }

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
<section id="--1">


<div class="section--1">
    <video id="video-background" autoplay muted loop>
        <source src="https://res.cloudinary.com/dejithzc7/video/upload/v1705389563/Gandharva/rings_odeouz.mp4" type="video/mp4"> </video>
    <header>
        <nav>
            <div class="logo">
                <img src='images/logo.png' alt="Logo">
            </div>
            <ul class="navbar">
                <li><a href="#">About Us</a></li>
                <li><a href="#">Our Services</a>
                    <ul class="submenu">
                        <li><a href="ourServices-Astrologer.jsp">Astrologer</a></li>

                        <li><a href="#">Event Planner</a></li>
                    </ul>
                </li>
                <li><a href="#">Pricing</a></li>
                <li><a href="#">Help</a></li>
            </ul>
            <div class="buttons">
                <a href="Astrologer_Login.jsp"> <button class="signin">Sign In </button></a>
                <button class="divider"> | </button>
                <a href="registration"> <button class="signup">Sign Up</button> </a>
            </div>

        </nav>
    </header>
    <button class="find-match"><a href="login">Find Your Match</a></button>
</div>
</section>

<section id="--2">
    <div class="section--2">
        <img src="images/bg1.jpg">

        <div class="vision--card">
            <h2> Our Vision</h2>
            <br>
            <p> To create a harmonious and fulfilling journey for individuals <br>
                seeking lifelong companionship by providing a comprehensive <br>
                platform that integrates astrology, personalized matchmaking, <br>
                and event planning services.</p>

        </div>
        <div class="mission--card">
            <h2> Our Mission</h2>
            <br>
            <p> To create a harmonious and fulfilling journey for individuals <br>
                seeking lifelong companionship by providing a comprehensive <br>
                platform that integrates astrology, personalized matchmaking, <br>
                and event planning services.</p>

        </div>
    </div>
</section>

<section id="--3">
    <div class="section--3">
        <img src="images/contactusBG.jpg" class="bgimg">

        <div class="inquiries--card">
            <form enctype="multipart/form-data" id="#">
                <H2>
                    GET IN TOUCH
                </H2>
                <br>

                <label for="name"> Name in Full: </label> <p class="require"> * </p>
                <input type="text" id="name" class="input-field" placeholder="John Doe" required> <br><br>

                <label for="email"> E-mail address: </label> <p class="require"> * </p>
                <input type="email" id="email" class="input-field" placeholder="johndoe@email.com" required><br><br>

                <label for="inquire"> How can we help? </label>  <p class="require"> * </p>
                <textarea id="inquire" class="input-field" placeholder="Type your message here" required></textarea><br><br>


            </form>

<%--            <img src="images/contact_us.jpg" id="contact--img">--%>

        </div>

    </div>


</section>



<footer>
    <div class="footer-container">
        <div class="footer-section">
            <h3>About Us</h3>
            <p>TEXT</p>
        </div>
        <div class="footer-section">
            <h3>Quick Links</h3>
            <ul>
                <li><a href="#--1">Home</a></li>
                <li><a href="#--2">About</a></li>
                <li><a href="#">Services</a></li>
                <li><a href="#">Pricing</a></li>
                <li><a href="#--3">Help</a></li>
            </ul>
        </div>
        <div class="footer-section">
            <h3>Contact Us</h3>
            <ul>
            <li>Email: info@gandarva.com</li>
            <li>Phone: +94 77 1234 567</li>
            </ul>
        </div>
        <div class="footer-section">
            <h3>Follow Us</h3>
            <div class="social-icons">
                <a href="#"><i class="fab fa-facebook-f"></i></a>
                <a href="#"><i class="fab fa-twitter"></i></a>
                <a href="#"><i class="fab fa-instagram"></i></a>
            </div>
        </div>
    </div>
    <div class="footer-bottom">
        <p>&copy; 2024 Gandharva. All rights reserved.</p>
    </div>
</footer>



</body>
</html>

