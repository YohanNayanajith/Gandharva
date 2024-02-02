<%--
  Created by IntelliJ IDEA.
  User: Binali Ukwatte
  Date: 01-02-2024
  Time: 22:42
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
    <a href="HomePage.jsp">
        <div class="logo">
            <img src="images/logo.png" alt="Logo">
        </div>
    </a>
    <ul class="menu">
        <li class="active">
            <a href="Astrologer_dashboard.jsp" >
                <i class="menu-icon fas fa-tachometer-alt"></i>
                <span>Dashboard</span>
            </a>
        </li>
        <li>
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
            <span> Primary</span>
            <h2>Dashboard</h2>

        </div>
        <div class="user--info">
            <div class="search--box">
                <i class="menu-icon fas fa-search"></i>

                <input type="text" placeholder="Search">
            </div>

            <a href="Astrologer_profile.jsp"><img src="images/img.png">
            </a>

        </div>

    </div>

    <div class="card--container">
        <h3 class="main--title">Today's Data</h3>
        <span class="current--date" id="currentDate"> </span>

        <!-- JavaScript to get and display the current date -->
        <script>
            // Get the current date
            var currentDate = new Date();

            // Format the date as desired (e.g., "January 31, 2024")
            var options = { year: 'numeric', month: 'long', day: 'numeric' };
            var formattedDate = currentDate.toLocaleDateString('en-US', options);

            // Display the current date in the HTML element with id="currentDate"
            document.getElementById("currentDate").innerHTML = "As at " + formattedDate;
        </script>
        <div class="card--wrapper">
            <div class="request--card light-red">
                <div class="card--header">
                    <div class="amount">
                        <span class="title">
                            New Requests
                        </span>
                        <span class="count">
                            50 Dummy
                        </span>
                    </div>
                    <i class="icon fas fa-bell"></i>
                </div>
                <%--                <span class="current--date" id="currentDate"> </span>--%>

                <%--                <!-- JavaScript to get and display the current date -->--%>
                <%--                <script>--%>
                <%--                    // Get the current date--%>
                <%--                    var currentDate = new Date();--%>

                <%--                    // Format the date as desired (e.g., "January 31, 2024")--%>
                <%--                    var options = { year: 'numeric', month: 'long', day: 'numeric' };--%>
                <%--                    var formattedDate = currentDate.toLocaleDateString('en-US', options);--%>

                <%--                    // Display the current date in the HTML element with id="currentDate"--%>
                <%--                    document.getElementById("currentDate").innerHTML = "Today's Date: " + formattedDate;--%>
                <%--                </script>--%>


            </div>

            <div class="request--card light-purple">
                <div class="card--header">
                    <div class="amount">
                        <span class="title">
                            Pending Requests
                        </span>
                        <span class="count">
                            20 Dummy
                        </span>
                    </div>
                    <i class="icon fas fa-hourglass-half dark-purple"></i>
                </div>
                <%--                <span class="current--date" id="currentDate2"> </span>--%>

                <%--                <!-- JavaScript to get and display the current date -->--%>
                <%--                <script>--%>
                <%--                    // Get the current date--%>
                <%--                    var currentDate = new Date();--%>

                <%--                    // Format the date as desired (e.g., "January 31, 2024")--%>
                <%--                    var options = { year: 'numeric', month: 'long', day: 'numeric' };--%>
                <%--                    var formattedDate = currentDate.toLocaleDateString('en-US', options);--%>

                <%--                    // Display the current date in the HTML element with id="currentDate"--%>
                <%--                    document.getElementById("currentDate2").innerHTML = "As at " + formattedDate;--%>
                <%--                </script>--%>


            </div>

            <div class="request--card light-green">
                <div class="card--header">
                    <div class="amount">
                        <span class="title">
                            Total cases completed
                        </span>
                        <span class="count">
                            150 Dummy
                        </span>
                    </div>
                    <i class="icon fas fa-circle-check dark-green"></i>
                </div>

            </div>

            <div class="request--card light-blue">
                <div class="card--header">
                    <div class="amount">
                        <span class="title">
                            Dummy
                        </span>
                        <span class="count">
                            20 Dummy
                        </span>
                    </div>
                    <i class="icon fas fa-hourglass-half dark-blue"></i>
                </div>
            </div>
        </div>
    </div>
    <div class="tabular--wrapper">
        <h3 class="main--title"> New Requests </h3>
        <div class="table--container">
            <table>
                <thead>
                <tr>
                    <th> Date </th>
                    <th> Name of the customer</th>
                    <th> Accept </th>
                    <th> Reject </th>


                </tr>
                </thead>
                <tbody>
                <tr>
                    <td>
                        2023-05-01
                    </td>
                    <td>
                        Binali Ukwatte
                    </td>
                    <td>
                        <input type="radio" class="radio">
                    </td>
                    <td>
                        <input type="radio" class="radio">
                    </td>



                </tr>
                <tr>
                    <td>
                        2023-05-01
                    </td>
                    <td>
                        Yohan Nayanajith
                    </td>
                    <td>
                        <input type="radio" class="radio">
                    </td>
                    <td>
                        <input type="radio" class="radio">
                    </td>


                </tr>
                </tbody>
            </table>
        </div>
    </div>

</div>
</body>
</html>