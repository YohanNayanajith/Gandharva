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

                            <span id="all-status-icon-${x.id}" style="display: none;">
                                <i class="status-icon fas fa-check-circle" onClick='updateStatus("${x.id}", "${x.status}")'></i>
                            </span>
                            <span id="payment-icon-${x.id}" style="display: none;">
                                <i class="payment-icon fas fa-money-bill-alt" onClick='makePayment("${x.id}")'></i>
                            </span>
                            <span id="status-icons-${x.id}" style="display: none;">
                                <i class="accept-icon fas fa-check-circle" onClick='acceptRequest("${x.id}")'></i>
                                <i class="decline-icon fas fa-times-circle" onClick='declineRequest("${x.id}")'></i>
                            </span>
                            <span id="pending-icons-${x.id}" style="display: none;">
                                <i class="pending-icon fas fa-clock" onClick='pendingRequest("${x.id}")'></i>
                            </span>
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

                if(x.status === 'NEW') {
                    $(`#status-icons-${x.id}`).show();
                }else if (x.status === 'PAYMENT_PENDING') {
                    $(`#payment-icon-${x.id}`).show();
                }else if (x.status === 'DONE') {
                    $(`#all-status-icon-${x.id}`).show();
                } else if(x.status === 'PENDING') {
                    $(`#pending-icons-${x.id}`).show();
                }

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

function updateStatus(id, status) {
    console.log('Updating status for ID: ' + id);
    $(`#status-icons-${id}`).empty();

    const NEW = "NEW";
    const ACCEPT = "ACCEPT";
    const DECLINE = "DECLINE";
    const PAYMENT_PENDING = "PAYMENT_PENDING";
    const PENDING = "PENDING";
    const DONE = "DONE";

    if(status == NEW){
        Swal.fire({
          title: "Are you accepting this user request?",
          showDenyButton: true,
          showCancelButton: true,
          confirmButtonText: "Accept",
          cancelButtonText: "Decline",
        }).then((result) => {
          if (result.isConfirmed) {
            //ACCEPT
            //PAYMENT_PENDING
            Swal.fire("Saved!", "", "success");
          } else {
            //DECLINE
            Swal.fire("Changes are not saved", "", "info");
          }
        });
    } else if(status == DECLINE) {
        Swal.fire("You Decline the Request!", "", "Error");
    } else if(status == DONE) {
        Swal.fire("Already Completed!", "", "success");
    } else if(status == PAYMENT_PENDING) {
        // PENDING
    } else if(status == PENDING) {
        // DONE
    }

    Swal.fire({
      title: "Do you want to save the changes?",
      showDenyButton: true,
      showCancelButton: true,
      confirmButtonText: "Save",
    }).then((result) => {
      /* Read more about isConfirmed, isDenied below */
      if (result.isConfirmed) {

        Swal.fire("Saved!", "", "success");
      } else {
        Swal.fire("Changes are not saved", "", "info");
      }
    });
}

function provideFeedback(id) {
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

function makePayment(id) {
    console.log('Making payment for ID: ' + id);
    window.location.href = "astrologer/payment";
    // after payment completed, Then we have to change tha status
    // PENDING
}

function acceptRequest(id) {
    console.log('Accepting request for ID: ' + id);
    Swal.fire({
          title: "Are you accepting this user request?",
          showDenyButton: true,
          showCancelButton: true,
          confirmButtonText: "Accept",
          cancelButtonText: "Cancel",
        }).then((result) => {
          if (result.isConfirmed) {
            //PAYMENT_PENDING
            $.ajax({
                            method: 'POST',
                            url: 'astrologer/update/pending/status',
                            data: {
                                status: "PAYMENT_PENDING",
                                requestId: id
                            },
                            success: function (result) {
                                if(result == "1"){
                                    Swal.fire("Saved!", "", "success");
                                }else {
                                    Swal.fire('Not Saved!', '', 'error');
                                }
                            },
                            error: function (error) {
                                Swal.fire('Not Saved!', '', 'error');
                            }
                        });

          } else {
            Swal.fire("Changes are not saved", "", "info");
          }
        });
}

function declineRequest(id) {
    console.log('Declining request for ID: ' + id);

    Swal.fire({
              title: "Are you decline this user request?",
              showDenyButton: true,
              showCancelButton: true,
              confirmButtonText: "Decline",
              cancelButtonText: "Cancel",
            }).then((result) => {
              if (result.isConfirmed) {
                //PAYMENT_PENDING
                $.ajax({
                                method: 'POST',
                                url: 'astrologer/update/pending/status',
                                data: {
                                    status: "DECLINE",
                                    requestId: id
                                },
                                success: function (result) {
                                    if(result == "1"){
                                        Swal.fire("Saved!", "", "success");
                                    }else {
                                        Swal.fire('Not Saved!', '', 'error');
                                    }
                                },
                                error: function (error) {
                                    Swal.fire('Not Saved!', '', 'error');
                                }
                            });

              } else {
                Swal.fire("Changes are not saved", "", "info");
              }
            });
}