$(document).ready(function () {
    $.ajax({
        method: "GET",
        url: "request/getAll",
        // dataType: "json",
        // contentType: "application/json",
        success: function (result) {
            $.each(result, function (index, x) {
                $('#user-request-table').append(
                    `<tr>
                        <td>${x.startDate}</td>
                        <td>${x.firstName} ${x.lastName}</td>
                        <td>Horoscope1</td>
                        <td>
                            ${x.status}
                            <i class="status-icon fas fa-check-circle" onClick='updateStatus("${x.id}")'></i>
                        </td>
                        <td>
                            ${x.feedback}
                            <i class="menu-icon fas fa-comment feedback-icon" onClick='provideFeedback("${x.id}")'></i>
                        </td>
                        <td>
                            <input type="text" placeholder="Not displayed to anyone else" value="${x.comments}" class="user-request-comment">
                            <i class="fas fa-pencil-alt comment-icon" onClick='updateComment(this, "${x.id}")'></i>
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

//$(document).on('click', '.feedback-icon', function () {
//    let requestId = $(this).data('id');
//    console.log('Feedback clicked for ID: ' + requestId);
//
//});

function updateStatus(id) {
    // You can implement the logic to update the status based on the provided ID here
    console.log('Updating status for ID: ' + id);
}

function provideFeedback(id) {
    // You can use the ID here to provide feedback for the specific item
    console.log('Providing feedback for ID: ' + id);
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
            let feedback = result.value;

            $.ajax({
                method: 'POST',
                url: 'astrologer/update/pending/feedback',
                data: {
                    feedback: feedback,
                    requestId: id
                },
                success: function (result) {
                    if(result == "1"){
                        Swal.fire('Feedback Submitted!', '', 'success');
                    }else {
                        Swal.fire('Feedback is not Submitted!', '', 'error');
                    }
                },
                error: function (error) {
                    Swal.fire('Feedback is not Submitted!', '', 'error');
                }
            });
        }
    });
}

function updateComment(inputField, id) {
    let comments = $(inputField).prev('.user-request-comment').val();

    Swal.fire({
      title: "Do you want to save the changes?",
      showDenyButton: true,
      showCancelButton: true,
      confirmButtonText: "Save",
    }).then((result) => {
      if (result.isConfirmed) {
        $.ajax({
                        method: 'POST',
                        url: 'astrologer/update/pending/comments',
                        data: {
                            comments: comments,
                            requestId: id
                        },
                        success: function (result) {
                            if(result == "1"){
                                Swal.fire('Comment Updated!', '', 'success');
                            }else {
                                Swal.fire('Comment update is not success!', '', 'error');
                            }
                        },
                        error: function (error) {
                            Swal.fire('Comment update is not success!', '', 'error');
                        }
                    });
      } else {
        Swal.fire("Changes are not saved", "", "info");
      }
    });
}