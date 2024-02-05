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
    <style>
        .calendar {
            width: 300px;
            margin: 20px auto;
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 10px;
            font-family: Arial, sans-serif;
        }

        .header {
            text-align: center;
            margin-bottom: 10px;
        }

        .body {
            padding: 10px;
        }

        .event {
            background-color: #f0f0f0;
            padding: 5px;
            margin-bottom: 5px;
            border-radius: 3px;
        }

        .delete-btn {
            float: right;
            cursor: pointer;
            color: red;
            margin-left: 5px;
        }

    </style>

</head>
<body>
<div class="sidebar">
    <a href="HomePage.jsp">
        <div class="logo">
            <img src="images/logo.png">

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
        <li class="active">
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
            <span> Pending</span>
            <h2>Requests</h2>

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


            <div class="google--calender">
                <iframe src="https://calendar.google.com/calendar/embed?height=600&wkst=2&bgcolor=%23ffffff&ctz=Asia%2FColombo&mode=MONTH&showPrint=0&showTitle=0&src=ZW4ubGsjaG9saWRheUBncm91cC52LmNhbGVuZGFyLmdvb2dsZS5jb20&color=%230B8043" style="border:solid 1px #777" width="800" height="600" frameborder="0" scrolling="no"></iframe>

            </div>

        <%--        <div class="tabular--wrapper">--%>
<%--            &lt;%&ndash;        <h3 class="main--title"> History for past 3 days </h3>&ndash;%&gt;--%>
<%--            <div class="table--container">--%>
<%--                <table>--%>
<%--                    <thead>--%>
<%--                    <tr>--%>
<%--                        <th> Date </th>--%>
<%--                        <th> Name of the customer</th>--%>
<%--                        <th> Download Horoscope </th>--%>
<%--                        <th> Status </th>--%>
<%--                        <th> Comments </th>--%>

<%--                    </tr>--%>
<%--                    </thead>--%>
<%--                    <tbody>--%>
<%--                    <tr>--%>
<%--                        <td>--%>
<%--                            2023-05-01--%>
<%--                        </td>--%>
<%--                        <td>--%>
<%--                            Binali Ukwatte--%>
<%--                        </td>--%>
<%--                        <td>--%>
<%--                            Horoscope--%>
<%--                        </td>--%>
<%--                        <td>--%>
<%--                            Done--%>
<%--                        </td>--%>
<%--                        <td>--%>
<%--                            Not displayed to anyone else--%>
<%--                        </td>--%>


<%--                    </tr>--%>
<%--                    </tbody>--%>
<%--                </table>--%>
<%--            </div>--%>
<%--        </div>--%>

    </div>
</div>
</body>
</html>
