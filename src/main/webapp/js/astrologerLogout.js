$(document).ready(function() {
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
            $.ajax({
                method: "GET",
                url: "logout",
                // dataType: "json",
                // contentType: "application/json",
                success: function(result) {
                    window.location.href = "HomePage.jsp";
                },
                error: function(error) {
                    console.log(error);
                }
            });

        } else {
            window.location.href = "astrologer";
        }
    });
});