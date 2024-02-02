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
            overflow: hidden;
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            font-family: Arial, sans-serif;

        }

        #video-background {
            position: fixed;
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
            padding: 50px;
            color: black;
            display: flex;
            justify-content: space-between;
            align-items: center;
            max-width: 1200px;
            height: 50px;
            margin: 0 auto;
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
            color: black;
            font-weight: bold;
            font-size: 20px;
        }

        .navbar a:hover {
            text-decoration: underline;
        }

        .submenu {
            margin-top: 2px;
            list-style-type: none;
            display: none;
            position: absolute;
            background-color: rgba(0, 0, 0, 0.25);
            padding: 10px;
            margin-left: 5px;
            border-radius: 30px;
            border: none;
        }

        .navbar li:hover .submenu {
            padding-top: 10px;
            line-height: 50px;
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
            text-decoration: underline;
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
            margin-top: 500px;
            font-size: large;
            background-color: rgba(255, 255, 255, 0.4);
            padding: 10px 20px;
            border-radius: 50px;
            border: none;
            cursor: pointer;

        }

        .find-match:hover {
            background-color: rgba(255, 255, 255, 0.2); /* Lighten on hover */
            text-decoration: underline;
        }
        a{
            color: black;
            text-decoration: none;
        }

    </style>
</head>
<body>
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
            <a href="NavigatePage.jsp"> <button class="signin">Sign In </button></a>
            <button class="divider"> | </button>
            <a href="NavigatePage.jsp"> <button class="signup">Sign Up</button> </a>



        </div>
    </nav>
</header>

    <button class="find-match"><a href="login.jsp">Find Your Match</a></button>

</body>
</html>

