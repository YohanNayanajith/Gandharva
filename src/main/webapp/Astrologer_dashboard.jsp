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

    <%
        // Retrieve session attributes
        String firstName = (String) session.getAttribute("firstName");
        String lastName = (String) session.getAttribute("lastName");
    %>

    <div class="card--container">
        <h3 class="main--title">Welcome! <%= firstName + " " + lastName %></h3>
        <span class="current--date" id="currentDate"> </span>

        <!-- JavaScript to get and display the current date -->
        <script>
            // Get the current date
            var currentDate = new Date();

            // Format the date as desired (e.g., "January 31, 2024")
            var options = { year: 'numeric', month: 'long', day: 'numeric' };
            var formattedDate = currentDate.toLocaleDateString('en-US', options);

            // Display the current date in the HTML element with id="currentDate"
            document.getElementById("currentDate").innerHTML = formattedDate;
        </script>
        <div class="card--wrapper">
            <div class="request--card light-red">
<%--                redirect to pending--%>
                <div class="card--header" id="card-header-value-status-new">

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
                <div class="card--header"id="card-header-value-status-accept">

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
                <div class="card--header" id="card-header-value-status-done">

                </div>

            </div>

            <div class="request--card light-blue">
                <div class="card--header" id="card-header-value-status-decline">

                </div>
            </div>
        </div>
    </div>
    <div class="tabular--wrapper">
        <h3 class="main--title"> History for past 3 days </h3>
        <div class="table--container">
            <table>
                <thead>
                <tr>
                    <th> Date </th>
                    <th> Name of the customer</th>
                    <th> Feedback </th>
                    <th> Payment received</th>
                    <th> Status </th>
                    <th>  </th>

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
                        Positive
                    </td>
                    <td>
                        yes
                    </td>
                    <td>
                        Pending
                    </td>


                </tr>
                <tr>
                    <td>
                        2023-05-01
                    </td>
                    <td>
                        Binali Ukwatte
                    </td>
                    <td>
                        Positive
                    </td>
                    <td>
                        yes
                    </td>
                    <td>
                        Pending
                    </td>


                </tr>
                </tbody>
            </table>
        </div>
    </div>

</div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js" defer></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11" defer></script>
<script src="js/astrologerDashboard.js" defer></script>
</html>
