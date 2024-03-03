$(document).ready(function() {
    //    async function convertImageToBase64(imagePath) {
    //        // Create a new FileReader instance
    //        var reader = new FileReader();
    //
    //        // Read the image file as a data URL
    //        reader.readAsDataURL(imagePath);
    //
    //        // Use a promise to wait for the FileReader to finish reading
    //        await new Promise((resolve, reject) => {
    //            reader.onloadend = resolve;
    //            reader.onerror = reject;
    //        });
    //
    //        // Return the base64 data URL
    //        return reader.result;
    //    }

    $('#registration-form').submit(function(e) {
        e.preventDefault();

        // Validate form data (add appropriate validation based on requirements)
        //        if (!validateForm()) {
        //            return; // Prevent submission if validation fails
        //        }

        // Extract and normalize form data
        let firstName = $('#first_name').val().trim();
        let lastName = $('#last_name').val().trim();
        let email = $('#email').val().trim();
        let password = $('#password').val().trim();
        let userType = 'ASTROLOGER'; // Assuming fixed value based on prompt
        let countryOfResidence = "Sri Lanka" // Use actual ID
        let district = $('#district').val().trim();
        let numberOfCasesHandled = 0; // Default value based on prompt
        let yearsOfExperience = parseInt($('#experience').val().trim()); // Enforce integer

        //        var imagePath = "images/img.png"; // Path to your image file
        //        var base64Image = await convertImageToBase64(imagePath);

        // Create a FormData object (recommended for file uploads)
        let formData = new FormData();
        formData.append('firstName', firstName);
        formData.append('lastName', lastName);
        formData.append('email', email);
        formData.append('password', password);
        formData.append('userType', userType);
        formData.append('countryOfResidence', countryOfResidence);
        formData.append('district', district);
        formData.append('numberOfCasesHandled', numberOfCasesHandled);
        formData.append('yearsOfExperience', yearsOfExperience);

        // Append selected certificate files
        let certificateFileUpload = $('#certificates').prop('files');
        if (certificateFileUpload.length > 0) {
            for (const file of certificateFileUpload) {
                formData.append('certificateFileUpload', file);
            }
        }
        //        formData.append("userImage",base64Image);

        certificateFileUpload = formData.get("certificateFileUpload");

        $.ajax({
            method: 'POST',
            url: 'registration',
            data: formData,
            processData: false,
            contentType: false,
            success: function(result) {
                // Handle successful registration
                Swal.fire({
                    icon: 'success',
                    title: 'Registration Success',
                    text: 'You are registered as an Astrologer!',
                    confirmButtonText: 'Ok',
                    confirmButtonColor: '#0E2C4B'
                });
                window.location.href = "login";
            },
            error: function(error) {
                // Handle registration errors
                Swal.fire({
                    icon: 'error',
                    title: 'Registration unsuccessful!',
                    text: 'Please try again!',
                    confirmButtonText: 'Ok',
                    confirmButtonColor: '#932828'
                });
            }
        });
    });
    $('#certificates').change(function() {
        const files = $(this).prop('files');
        for (const file of files) {
            console.log('File name:', file.name);
            console.log('File size:', file.size);
            console.log('File type:', file.type);
        }
    });
});