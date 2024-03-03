function changePasswordAstrologer() {
    let password = $('#password').val().trim();
    let newPassword = $('#newPassword').val().trim();

    console.log(password);

    $.ajax({
        method: 'POST',
        url: 'astrologer/update/password',
        data: {
            password: password,
            newPassword: newPassword
        },
        success: function(result) {
            if (result == "1") {
                Swal.fire({
                    icon: 'success',
                    title: 'Profile password change',
                    text: 'Astrologer password change success!',
                    confirmButtonText: 'Ok',
                    confirmButtonColor: '#0E2C4B'
                });
            } else if (result == "2") {
                Swal.fire({
                    icon: 'error',
                    title: 'Profile password change',
                    text: 'Password did not match!',
                    confirmButtonText: 'Ok',
                    confirmButtonColor: '#0E2C4B'
                });
            }

        },
        error: function(error) {
            Swal.fire({
                icon: 'error',
                title: 'Password change unsuccessful!',
                text: 'Astrologer password change unsuccessful!',
                confirmButtonText: 'Ok',
                confirmButtonColor: '#932828'
            });
        }
    });
}