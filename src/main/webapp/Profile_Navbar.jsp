<%--
  Created by IntelliJ IDEA.
  User: Binali Ukwatte
  Date: 31-01-2024
  Time: 10:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<html>
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
    <link rel="stylesheet" href="styles.css">
    <title>Dashboard</title>


</head>
<body>
<div class="sidebar">
    <div class="logo">
        <a href="Astrologer_profile.jsp"><img src="images/img.png">
        </a>
    </div>
    <ul class="menu">
        <li class="active">
            <a href="#" >
                <i class="menu-icon fas fa-tachometer-alt"></i>
                <span>Dashboard</span>
            </a>
        </li>
        <li>
            <a href="#">
                <i class="menu-icon fas fa-user"></i>
                <span>Profile</span>
            </a>
        </li>
        <li>
            <a href="#">
                <i class="menu-icon fas fa-hourglass-half"></i>
                <span>User Requests</span>
            </a>
        </li>
        <li>
            <a href="#">
                <i class="menu-icon fas fa-bookmark"></i>
                <span>Reservations</span>
            </a>
        </li>
        <li>
            <a href="#">
                <i class="menu-icon fas fa-calendar"></i>
                <span>Schedule</span>
            </a>
        </li>
        <li>
            <a href="#">
                <i class="menu-icon fas fa-credit-card"></i>
                <span>Payment</span>
            </a>
        </li>
        <li>
            <a href="#">
                <i class="menu-icon fas fa-bell"></i>
                <span>Notifications</span>
            </a>
        </li>
        <li>
            <a href="#">
                <i class="menu-icon fas fa-cog"></i>
                <span>Settings</span>
            </a>
        </li>
        <li class="logout">
            <a href="#">
                <i class="menu-icon fas fa-sign-out-alt"></i>
                <span>logout</span>
            </a>
        </li>


</ul>

</div>

<div class="main--content" >
    <div class="header--wrapper">
        <div class="header--title">
            <span> Primary</span>
            <h2>Dashboard</h2>

    </div>
        <div class="user--info">
            <div class="search--box">
                <i class="menu-icon fas fa-search"></i>

                    <input type="text" placeholder="Search">
            </div>

            <img src="images/img.png">

        </div>

</div>


</div>

</body>
</html>
