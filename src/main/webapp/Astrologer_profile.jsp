<%--
  Created by IntelliJ IDEA.
  User: Binali Ukwatte
  Date: 31-01-2024
  Time: 21:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>



<html>

<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <link rel="stylesheet" href="styles.css">
    <title>My Profile</title>

    <style>
        .image--wrapper {
            height: 250px;
            width: 250px;
            border-radius: 50%;
            display: flex; /* Add this to center the content */
            justify-content: center;
            align-items: center;
            position: relative; /* Change to relative */
        }

        #photo {
            width: 100%; /* Adjusted to fit within the wrapper */
            height: 100%; /* Adjusted to fit within the wrapper */
            border-radius: 50%;
        }

        #upload--button {
            position: absolute;
            bottom: 0; /* Adjusted to position it at the bottom */
            right: 0; /* Adjusted to position it at the right */
            height: 30px;
            width: 30px;
            padding: 7px;
            border-radius: 50%;
            cursor: pointer;
            color: black;
            background-color: rgb(173, 172, 172, 0.001);
            box-shadow: 2px 4px 4px rgb(0, 0, 0, 0.644);
        }
        .profile--info h1{
            font-family: "monospace", Poppins;
            color: #24333E;
            font-size: 1.2rem;
            margin-top: 40px;
            margin-bottom: 35px;
        }

        .profile--info h2{
            color: #777;
            font-family: "monospace", Poppins;
            text-transform: uppercase;
            font-size: 1rem;
            letter-spacing: 1px;
            margin-left: 2px;
            margin-top: 10px;
        }
        .profile--info .input, p{
            border: 0;
            border-bottom: 1px solid #3fb6a8;
            width: 80%;
            font-family: "monospace", sans-serif;
            font-size: .7em ;
            padding: 7px 0;
            color: #070707;
            outline: none;
        }
        .profile--info span{
            font-size: 0.7em;
            color: #777;

        }


    </style>


</head>
<body>
<div class="sidebar">
    <a href="HomePage.jsp">
        <div class="logo">
        <img src="images/logo.png" alt="Logo">
    </div>
    </a>
    <ul class="menu">
        <li>
            <a href="Astrologer_dashboard.jsp" >
                <i class="menu-icon fas fa-tachometer-alt"></i>
                <span>Dashboard</span>
            </a>
        </li>
        <li class="active">
            <a href="Astrologer_profile.jsp">
                <i class="menu-icon fas fa-user"></i>
                <span>Profile </span>
            </a>
        </li>
        <li>
            <a href="Astrologer_pending.jsp">
                <i class="menu-icon fas fa-hourglass-half"></i>
                <span>Pending</span>
            </a>
        </li>
        <li>
            <a href="Astrologer_reservations.jsp">
                <i class="menu-icon fas fa-bookmark"></i>
                <span>Reservations</span>
            </a>
        </li>
        <li>
            <a href="Astrologer_schedule.jsp">
                <i class="menu-icon fas fa-calendar"></i>
                <span>Schedule</span>
            </a>
        </li>
        <li>
            <a href="Astrologer_payment.jsp">
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
            <a href="Astrologer_settings.jsp">
                <i class="menu-icon fas fa-cog"></i>
                <span>Settings</span>
            </a>
        </li>
        <li class="logout">
            <a href="Astrologer_logout.jsp">
                <i class="menu-icon fas fa-sign-out-alt"></i>
                <span>logout</span>
            </a>
        </li>


    </ul>

</div>



<div class="main--content" >
    <div class="header--wrapper">
        <div class="header--title">
            <span> Profile</span>
            <h2>Details</h2>

        </div>
        <div class="user--info">
            <div class="search--box">
                <i class="menu-icon fas fa-search"></i>

                <input type="text" placeholder="Search">
            </div>

            <img src="images/img.png">

        </div>

    </div>

    <div class="header--wrapper">

        <span class="current--date" id="currentDate"> </span>

        <!-- JavaScript to get and display the current date -->
        <script>
            // Get the current date
            var currentDate = new Date();

            // Format the date as desired (e.g., "January 31, 2024")
            var options = { year: 'numeric', month: 'long', day: 'numeric' };
            var formattedDate = currentDate.toLocaleDateString('en-US', options);

            // Display the current date in the HTML element with id="currentDate"
            document.getElementById("currentDate").innerHTML = "Today's Date: " + formattedDate;
        </script>

    </div>
    <div class="header--wrapper">
        <div class="profile--details--container">
            <div class="profile--details--container--image">
                <div class="image--wrapper" >
                    <img src="images/img.png" id="photo">
                    <input type="file" id="file">
                    <label for="file" id="upload--button"> <i class="fas fa-camera" style="color: black"></i></label>
                </div>
            </div>

            <div class="profile--details--container--info">
                <div class="profile--info">
                    <h1> Profile Info </h1>
                    <h2> First Name </h2>
                    <input type="text" class="input" value="John">
                    <h2> Last Name </h2>
                    <input type="text" class="input" value=" Doe">
                    <h2> Years of Experience </h2>
                    <input type="text" class="input" value="14">
                    <h2> District </h2>
                    <input type="text" class="input" value="Colombo">
                    <h2> E-mail </h2>
                    <input type="text" class="input" value="john@gmail.com">
                </div>
            </div>
        </div>


        <div class="amend">
            <div class="update">
                <button id="updateButton">Update</button>
            </div>
        </div>

        <script>
            document.getElementById('updateButton').addEventListener('click', function() {
                Swal.fire({
                    position: "center",
                    icon: "success",
                    title: "Your work has been saved",
                    showConfirmButton: false,
                    timer: 1500
                });
            });
        </script>
    </div>

    </div>



<script src="jquery/jquery.js"></script>
<script>

</script>
</body>
</html>

