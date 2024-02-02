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
        <li>
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
        <li class="active">
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
            <span> Payment</span>
            <h2>History</h2>

        </div>
        <div class="user--info">
            <div class="search--box">
                <i class="menu-icon fas fa-search"></i>

                <a href="Astrologer_profile.jsp"><img src="images/img.png">
                </a>
            </div>

            <img src="images/img.png">

        </div>

    </div>

    <div class="card--container">
        <%--        <h3 class="main--title">Today's Data</h3>--%>
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

        <div class="tabular--wrapper">
            <%--        <h3 class="main--title"> History for past 3 days </h3>--%>
            <div class="table--container">
                <table>
                    <thead>
                    <tr>
                        <th> Payment ID </th>
                        <th> Name of the customer</th>
                        <th> Date </th>
                        <th> Time </th>
                        <th> Amount </th>
                        <th> Statement </th>

                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>
                            001
                        </td>
                        <td>
                            Binali Ukwatte
                        </td>
                        <td>
                            31-01-2024
                        </td>
                        <td>
                            23.01
                        </td>
                        <td>
                            LKR 1000
                        </td>
                        <td> <button class="transaction--statement">
                            Download
                        </button>
                        </td>


                    </tr>
                    </tbody>
                </table>
            </div>
        </div>

    </div>
</div>
</body>
</html>
<%--remove paymentId--%>