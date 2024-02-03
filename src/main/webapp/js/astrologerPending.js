$(document).ready(function () {
            // Status - NEW
            $.ajax({
                method: "GET",
                url: "request/getAll",
                // dataType: "json",
                // contentType: "application/json",
                success: function (result) {
                    $.map(result, function (x) {
                        $('#user-request-table').append(
                            `<tr>
                                <td>${x.startDate}</td>
                                <td>Binali</td>
                                <td>Horoscope</td>
                                <td>${x.status}</td>
                                <td>
                                    ${x.feedback}
                                    <i class="menu-icon fas fa-comment feedback-icon"></i>
                                </td>
                                <td>
                                    <input type="text" placeholder="Not displayed to anyone else" value="${x.comments}">
                                </td>
                            </tr>`
                        );
                    });
                },
                error: function (error) {
                    console.log(error);
                }
            });
        });

        $(document).on('click', '.feedback-icon', function () {
            Swal.fire({
                title: 'Feedback',
                input: 'textarea',
                showCancelButton: true,
                confirmButtonText: 'Submit',
                cancelButtonText: 'Cancel',
                inputValidator: (value) => {
                    if (!value) {
                        return 'Please enter your feedback!';
                    }
                }
            }).then((result) => {
                if (result.isConfirmed) {
                    // Process the submitted feedback (you can send it to the server, etc.)
                    Swal.fire('Feedback Submitted!', '', 'success');
                }
            });
        });