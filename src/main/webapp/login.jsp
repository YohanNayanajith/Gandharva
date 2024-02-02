<%--
  Created by IntelliJ IDEA.
  User: ranu
  Date: 2023-09-25
  Time: 15:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login Page</title>
  <style>
    /* Add your CSS styles for responsiveness and design here */
    body {
      background-image: url('images/background.jpg'); /* Replace with your image path */
      background-size: cover;
      background-repeat: no-repeat;
      color: #000; /* Change text color to black */
      display: flex;
      justify-content: center; /* Center content horizontally */
      align-items: center; /* Center content vertically */
      height: 100vh; /* Make sure the body covers the entire viewport height */
    }

    .login-card {
      width: 300px;
      margin: 0 auto;
      padding: 20px;
      background-color: rgba(255, 255, 255, 0.7); /* Semi-transparent card background */
      border-radius: 10px; /* Rounded corners for the card */
      box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.5); /* Box shadow for the card */
    }

    /* Style the Login button */
    .login-button {
      width: 100%; /* Make the button take the full width */
      margin-top: 10px;
      padding: 10px;
      background-color: #F5F5F5; /* Light grey background color */
      color: #000; /* Black text color */
      font-size: 16px;
      border: none;
      border-radius: 5px;
      cursor: pointer;
    }
    /* Align contents inside the card to the left */
    .login-card form {
      text-align: left;
      width: 100%; /* Ensure the form takes the full width of the card */
    }

    /* Style the "Remember me" checkbox */
    .login-card label[for="remember"] {
      font-size: 12px; /* Make the text smaller */
      color: #888;
    }

    /* Position the "Forgot Password?" link to the right */
    .login-card a[href="forgotPassword.jsp"] {
      float: right;
      font-size: 12px; /* Make the text smaller */
    }

    /* show labels for "Email" and "Password" */
    .login-card label[for="email"],
    .login-card label[for="password"] {
      color: black;
    }

    /* Style the "Don't have an account?" text */
    .signup-text {
      text-align: center;
      font-size: 14px;
      margin-top: 10px;
    }


    /* Center-align specific elements */
    .center-elements {
      text-align: center;
    }

    /* Style the "Don't have an account?" text */
    .signup-text {
      text-align: center;
      font-size: 14px;
      margin-top: 10px;
    }
  </style>
</head>
<body>
<!-- Navbar -->
<!-- ... (Navbar code remains the same) ... -->

<!-- Login Card -->
<div class="login-card">
  <h2 class="center-elements" style="color: black">Login</h2>
  <form action="log" method="post">
    <label for="email" class="center-elements">E-mail  :</label>
    <input type="email" id="email" name="email" placeholder="Email" required><br><br>
    <label for="password" class="center-elements">Password:</label>
    <input type="password" id="password" name="password" placeholder="Password" required><br><br>

    <label for="remember">Remember me</label>
    <input type="checkbox" id="remember" name="remember"><br><br>



    <input type="submit" value="Login" class="login-button"><br><br>
    <a href="forgotPassword.jsp">Forgot Password?</a><br>
  </form>
  <p class="signup-text">Don't have an account? <a href="u_reg.jsp">Sign Up</a></p>
</div>

<!-- Add more HTML and CSS as needed for styling and responsiveness -->
</body>
</html>
