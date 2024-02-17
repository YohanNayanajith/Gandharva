<%--
  Created by IntelliJ IDEA.
  User: Binali
  Date: 2024-02-12
  Time: 15.26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.5.1/chart.js"></script>

    <link rel="stylesheet" href="css/astrologerPayment.css">
    <title>Physical Member Payments</title>
</head>
<body>
<div class="payments_physical" id="payments_physical">
    <div class="payment_details_container">
        <div class="payment_details_container_header">
            <span>Payment Details</span>
        </div>
        <div class="payments_details">
            <div class="payment_total_payble">
                <div class="payment_text" id="payment_text">
                    <!--                        <span class="total_payble">Total Payble</span><br>-->
                    <!--                        <span class="payble_balance">Rs. 5000.00</span><br>-->
                    <!--                        <span class="payble_date">Pay before 26-10-2021</span>-->
                </div>
                <div class="payment_button">
                    <a class="payment_button_div" type="submit" id="payhere-payment" onclick="payments_pay()">PAY BILL</a>
                </div>
            </div>
            <div class="payment_cal_date">
                <div class="payment_date_icon">
                    <img src="http://localhost:8080/group39_fitbot_war_exploded/Physical%20Member/Icons/calendar.svg" alt="calendar">
                </div>
                <div class="payment_date_details" id="payment_date_details">
                    <!--                        <span class="previous_payment_date">Next Payment Date</span><br>-->
                    <!--                        <span class="previous_payment_date_format">26-10-2021</span><br>-->
                    <!--                        <span class="previous_payment_date_details">Last payment 26-10-2021</span>-->
                </div>
            </div>
        </div>
    </div>
    <div class="payment_history">
        <div class="payment_history_container">
            <div class="payment_history_container_header">
                <span>Payment History</span>
            </div>

            <div class="payment_history_container_details">
                <table class="payment_history_container_table" id="payment_history_container_table">
                    <tr class="payment_history_container_table_header">
                        <th>Date</th>
                        <th>Currency</th>
                        <th>Payment Method</th>
                        <th>Payment</th>
                        <th></th>
                    </tr>
                </table>
            </div>
        </div>

    </div>

    <div id="payment_physical_big_container_background" class="payment_physical_big_container_background"></div>

    <div class="payment_popup_details" id="payment_popup_details">
        <div class="payment_detail_header">
            <span>Payment Details</span>
            <div onclick="close_payment_details()" class="close_payment_detail_btn">
                <i class='bx bx-x close_btn_forgot'></i>
            </div>
        </div>

        <div class="payment_detail_container">

            <form method="post" action="https://sandbox.payhere.lk/pay/checkout" class="payment_detail_container_form" id="payment_detail_container_form">
                <input type="hidden" name="merchant_id" value="1218874">    <!-- Replace your Merchant ID -->
                <input type="hidden" name="return_url" value="http://localhost:8080/group39_fitbot_war_exploded/physicalMember">
                <input type="hidden" name="cancel_url" value="http://localhost:8080/group39_fitbot_war_exploded/physicalMember">
                <input type="hidden" name="notify_url" value="http://localhost:8080/group39_fitbot_war_exploded/Physical%20Member/Payments/Notify.js">

                <div class="payment_detail_container_form_headers"><span>Membership Details</span><br></div>

                <div class="payment_detail_container_mem_details">
                    <div class="payment_detail_container_input">
                        <div id="payment_detail_container_input_hide">
                            <label for="order_id">Payment ID</label><br>
                            <input type="text" name="order_id" id="order_id"><br>
                        </div>
                        <div>
                            <label for="expiry_day">Expire Date</label><br>
                            <input type="text" name="expiry_day" id="expiry_day"><br>
                        </div>

                        <div>
                            <label for="items">Membership Category</label><br>
                            <input type="text" name="items" id="items"><br>
                            <!--                                <select name="items" id="items">-->
                            <!--                                    <option value="family_membership">Family Membership</option>-->
                            <!--                                    <option value="couple_membership">Couple Membership</option>-->
                            <!--                                    <option value="platinum_membership">Platinum Membership</option>-->
                            <!--                                    <option value="gold_membership">Gold Membership</option>-->
                            <!--                                    <option value="silver_membership">Silver Membership</option>-->
                            <!--                                </select>-->
                            <!-- <input type="text" name="items" value="Door bell wireless"><br> -->
                        </div>
                    </div>

                    <div class="payment_detail_container_input">
                        <div>
                            <label for="currency">Currency</label><br>
                            <input type="text" name="currency" id="currency"><br>
                            <!--                                <select name="items" name="currency" id="currency">-->
                            <!--                                    <option value="LKR">LKR</option>-->
                            <!--                                    <option value="USD">USD</option>-->
                            <!--                                </select>-->
                        </div>

                        <div>
                            <label for="amount">Membership Fee</label><br>
                            <input type="text" name="amount" id="amount"><br>
                        </div>
                    </div>
                </div>

                <div class="payment_detail_container_form_headers"><span>Customer Details</span></div>

                <div class="payment_detail_container_cus_details">
                    <div class="payment_detail_container_input">
                        <div>
                            <label for="first_name">First Name</label><br>
                            <input type="text" name="first_name" id="first_name"><br>
                            <h5 id="payment_error1"></h5>
                        </div>

                        <div>
                            <label for="last_name">Last Name</label><br>
                            <input type="text" name="last_name" id="last_name"><br>
                            <h5 id="payment_error2"></h5>
                        </div>
                    </div>

                    <div class="payment_detail_container_input">
                        <div>
                            <label for="email">Email</label><br>
                            <input type="email" name="email" id="email"><br>
                            <h5 id="payment_error3"></h5>
                        </div>

                        <div>
                            <label for="phone">Contact Number</label><br>
                            <input type="tel" name="phone" id="phone"><br>
                            <h5 id="payment_error4"></h5>
                        </div>
                    </div>

                    <div class="payment_detail_container_input">
                        <div>
                            <label for="address">Address</label><br>
                            <input type="text" name="address" id="address"><br>
                        </div>

                        <div>
                            <label for="city">City</label><br>
                            <input type="text" name="city" id="city"><br>
                            <h5 id="payment_error5"></h5>
                        </div>
                    </div>
                </div>

                <input type="hidden" name="country" value="Sri Lanka"><br>
                <div class="payment_detail_container_input_submit">
                    <input type="submit" value="Cash Payment" onclick="payment_cash()">
                    <input type="submit" value="Online Payment" onclick = "payment_online()">
                </div>
            </form>
        </div>
    </div>

    <div id="payment_physical_big_container_background1" class="payment_physical_big_container_background"></div>


    <div class="payment_popup_details" id="after_payment_popup_details">
        <div class="payment_detail_header">
            <span>Payment Details</span>
            <div onclick="close_after_payment_details()" class="close_payment_detail_btn">
                <i class='bx bx-x close_btn_forgot'></i>
            </div>
        </div>
        <div class="payment_detail_container">
            <form method="post" action="" class="payment_detail_container_form">

                <!--                    <div class="payment_detail_container_form_headers"><span>Membership Details</span><br></div>-->

                <!--                    <div class="payment_detail_container_mem_details">-->
                <!--                        <div class="payment_detail_container_input" id="payment_detail_container_input">-->
                <!--                            <div>-->
                <!--                                <span>Branch Name</span><br>-->
                <!--                                <span>Malabe Branch</span>-->
                <!--                            </div>-->

                <!--                            <div>-->
                <!--                                <span>Membership Category</span><br>-->
                <!--                                <span>Family Membership</span>-->
                <!--                                &lt;!&ndash; <input type="text" name="items" value="Door bell wireless"><br> &ndash;&gt;-->
                <!--                            </div>-->
                <!--                        </div>-->

                <!--                        <div class="payment_detail_container_input">-->
                <!--                            <div>-->
                <!--                                <span>Currency</span><br>-->
                <!--                                <span>LKR</span>-->
                <!--                            </div>-->

                <!--                            <div>-->
                <!--                                <span>Membership Fee</span><br>-->
                <!--                                <span>5000/=</span>-->
                <!--                            </div>-->
                <!--                        </div>-->
                <!--                    </div>-->

                <div class="payment_detail_container_form_headers"><span>Customer Details</span></div>

                <div class="payment_detail_container_cus_details" id="payment_detail_container_cus_details">

                </div>
            </form>
        </div>

    </div>

    <script src="js/astrologerPayment.js" defer></script>
    <script src="js/PayherePayment.js" defer></script>
    <script type="text/javascript" src="https://www.payhere.lk/lib/payhere.js" defer></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js" defer></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11" defer></script>
</div>

</body>

</html>
