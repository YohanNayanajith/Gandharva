<%--
  Created by IntelliJ IDEA.
  User: Binali Ukwatte
  Date: 01-11-2023
  Time: 20:36
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--
  Created by IntelliJ IDEA.
  User: Binali Ukwatte
  Date: 01-02-2024
  Time: 21:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
  <link rel="stylesheet" href="styles.css">
  <title>Logout</title>


</head>
<body>
<div class="sidebar">
  <div class="logo">
    <img src="images/logo.png" alt="Logo">
  </div>
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
        <span>Profile</span>
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
    <li class="logout active">
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
      <span> Account </span>
      <h2>Logout</h2>

    </div>
    <div class="user--info">
      <div class="search--box">
        <i class="menu-icon fas fa-search"></i>

        <input type="text" placeholder="Search">
      </div>

      <a href="Astrologer_profile.jsp"> <img src="images/img.png"> </a>

    </div>

  </div>


</div>

<%--<div class="main--content">--%>

<%--<div class="cards">--%>
<%--  <div class="card">--%>
<%--    <div class="card-content">--%>
<%--      <div>Are you sure you want to Log out?</div>--%>
<%--      <button class="card-button">--%>
<%--        <a href="Astrologer_dashboard.jsp">Cancel</a>--%>
<%--      </button>--%>
<%--      <button class="card-button">--%>
<%--        <a href="HomePage.jsp">Confirm</a>--%>
<%--      </button>--%>

<%--    </div>--%>
<%--  </div>--%>
<%--</div>--%>
<%--</div>--%>
<script>
  Swal.fire({
    title: "Are you sure?",
    text: "You would be signed out!",
    icon: "warning",
    showCancelButton: true,
    confirmButtonColor: "#3085d6",
    cancelButtonColor: "#d33",
    confirmButtonText: "Yes!"
  }).then((result) => {
    if (result.isConfirmed) {
      window.location.href = "HomePage.jsp";
    }else{
      window.location.href = "Astrologer_dashboard.jsp";
    }
  });
</script>

</body>
</html>

