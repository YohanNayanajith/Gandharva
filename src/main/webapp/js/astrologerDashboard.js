$(document).ready(function() {
    //    Status - NEW
    $.ajax({
        method: "GET",
        url: "request/count/NEW",
        // dataType: "json",
        // contentType: "application/json",
        success: function(result) {
            $('#card-header-value-status-new').append(
                `<div class="amount">
                    <span class="title">
                        New Requests
                    </span>
                    <span class="count">
                        ${result} REQUEST
                    </span>
                </div>
                <i class="icon fas fa-bell"></i>`
            );
        },
        error: function(error) {
            console.log(error);
        }
    });

    //    Status - ACCEPT
    $.ajax({
        method: "GET",
        url: "request/count/PENDING",
        // dataType: "json",
        // contentType: "application/json",
        success: function(result) {
            $('#card-header-value-status-accept').append(
                `<div class="amount">
                     <span class="title">
                        Pending Requests
                    </span>
                    <span class="count">
                        ${result} REQUEST
                    </span>
                </div>
                <i class="icon fas fa-hourglass-half dark-purple"></i>`
            );
        },
        error: function(error) {
            console.log(error);
        }
    });

    //    Status - DONE
    $.ajax({
        method: "GET",
        url: "request/count/DONE",
        // dataType: "json",
        // contentType: "application/json",
        success: function(result) {
            $('#card-header-value-status-done').append(
                `<div class="amount">
                    <span class="title">
                        Total cases completed
                    </span>
                    <span class="count">
                        ${result} REQUEST
                    </span>
                </div>
                <i class="icon fas fa-circle-check dark-green"></i>`
            );
        },
        error: function(error) {
            console.log(error);
        }
    });

    //    Status - Reject
    $.ajax({
        method: "GET",
        url: "request/count/DECLINE",
        // dataType: "json",
        // contentType: "application/json",
        success: function(result) {
            $('#card-header-value-status-decline').append(
                `<div class="amount">
                    <span class="title">
                        Decline Requests
                    </span>
                    <span class="count">
                        ${result} REQUEST
                    </span>
                </div>
                <i class="icon fas fa-hourglass-half dark-blue"></i>`
            );
        },
        error: function(error) {
            console.log(error);
        }
    });
});