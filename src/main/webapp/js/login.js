$(document).ready(function() {
    function email_regex_Validate(emailValue) {
        let regexPattern = new RegExp(/^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/); // regular expression pattern
        // let regexPattern = new RegExp(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/);
        return regexPattern.test(emailValue);
    }
    $('#login-form').submit(function(e) {
        e.preventDefault();
        // alert("login js called");

        let email = $('#email').val().trim();
        let password = $('#password').val().trim();

        if (!email_regex_Validate(email)) {
            alert(email_regex_Validate(email));
            Swal.fire({
                icon: 'error',
                title: 'Email type is incorrect!',
                // text: 'Cannot be empty!',
                confirmButtonText: "Ok",
                confirmButtonColor: '#932828',
            })
            return;
        }

        // let form_inputs = {"user_name":login_name,"user_password":password};
        // form_inputs = JSON.stringify(form_inputs);

        if (email == '' || password == '') {
            e.preventDefault();
            // alert("Cant empty feilds");
            Swal.fire({
                icon: 'error',
                title: 'Login unsuccessfully!',
                text: 'Cannot be empty!',
                confirmButtonText: "Ok",
                confirmButtonColor: '#932828',
            })
            return;
        } else if (email.length < 6) {
            // alert("Password length should be greater than 3 characters");
            Swal.fire({
                icon: 'error',
                title: 'Login unsuccessfully!',
                text: 'Password length should be greater than 3 characters!',
                confirmButtonText: "Ok",
                confirmButtonColor: '#932828',
            })
        }

        $.ajax({
            method: "POST",
            url: "login",
            data: {
                email: email,
                password: password
            },
            // dataType:"json",
            // contentType:"application/json",
            success: function(result) {
                if (result == "1") {
                    // alert(result);
                    Swal.fire({
                        icon: 'success',
                        title: 'Login Success',
                        text: 'Premium User!',
                        confirmButtonText: "Ok",
                        confirmButtonColor: '#0E2C4B',
                    })
                    setTimeout(function() {
                        window.location.href = 'user';
                    }, 1000);

                } else if (result == "2") {
                    //virtual member
                    Swal.fire({
                        icon: 'success',
                        title: 'Login Success',
                        text: 'Standard User!',
                        confirmButtonText: "Ok",
                        confirmButtonColor: '#0E2C4B',
                    })
                    setTimeout(function() {
                        window.location.href = 'user';
                    }, 1000);
                } else if (result == "3") {
                    //instructor
                    Swal.fire({
                        icon: 'success',
                        title: 'Login Success',
                        text: 'Astrologer!',
                        confirmButtonText: "Ok",
                        confirmButtonColor: '#0E2C4B',
                    })
                    setTimeout(function() {
                        window.location.href = 'astrologer';
                    }, 1000);
                } else if (result == "4") {
                    //manager
                    Swal.fire({
                        icon: 'success',
                        title: 'Login Success',
                        text: 'Event Planner!',
                        confirmButtonText: "Ok",
                        confirmButtonColor: '#0E2C4B',
                    })
                    setTimeout(function() {
                        window.location.href = 'eventPlanner';
                    }, 1000);
                } else if (result == "5") {
                    Swal.fire({
                        icon: 'success',
                        title: 'Login Success',
                        text: 'Admin!',
                        confirmButtonText: "Ok",
                        confirmButtonColor: '#0E2C4B',
                    })
                    setTimeout(function() {
                        window.location.href = 'admin';
                    }, 1000);
                } else if (result == '6') {
                    Swal.fire({
                        icon: 'error',
                        title: 'Login unsuccessfully!',
                        text: 'You cannot log now.Please contact our administration!',
                        confirmButtonText: "Ok",
                        confirmButtonColor: '#932828',
                    })
                } else if (result == '6') {
                    Swal.fire({
                        icon: 'error',
                        title: 'Login unsuccessfully!',
                        text: 'You are bang! Please contact our administration!',
                        confirmButtonText: "Ok",
                        confirmButtonColor: '#932828',
                    })
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: 'Login unsuccessfully!',
                        text: 'User name and password does not match!',
                        confirmButtonText: "Ok",
                        confirmButtonColor: '#932828',
                    })
                }

            },
            error: function(error) {
                Swal.fire({
                    icon: 'error',
                    title: 'Login unsuccessfully!',
                    text: 'User name and password does not match!',
                    confirmButtonText: "Ok",
                    confirmButtonColor: '#932828',
                })
            }
        });
    });
});