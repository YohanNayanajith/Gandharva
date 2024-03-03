function updateFormSubmit() {
    let firstName = $('#firstNameUpdate').val().trim();
    let lastName = $('#lastNameUpdate').val().trim();
    let yearsOfExperience = $('#yearsOfExperienceUpdate').val().trim();
    let district = $('#districtUpdate').val().trim();
    let email = $('#emailUpdate').val().trim();

    console.log(firstName);

    $.ajax({
        method: 'POST',
        url: 'astrologer/update',
        data: {
            firstName: firstName,
            lastName: lastName,
            yearsOfExperience: yearsOfExperience,
            district: district,
            email: email
        },
        success: function(result) {
            Swal.fire({
                icon: 'success',
                title: 'Profile update Success',
                text: 'Astrologer profile update success!',
                confirmButtonText: 'Ok',
                confirmButtonColor: '#0E2C4B'
            });
        },
        error: function(error) {
            Swal.fire({
                icon: 'error',
                title: 'Profile update unsuccessful!',
                text: 'Astrologer profile update unsuccessful!',
                confirmButtonText: 'Ok',
                confirmButtonColor: '#932828'
            });
        }
    });
}

function updateProfileImage() {
    let userImage = $('#profile-image').prop('files')[0]; // Access the first file from the FileList

    let formData = new FormData();
    formData.append('userImage', userImage);

    $.ajax({
        method: 'POST',
        url: 'astrologer/update/image',
        data: formData,
        contentType: false, // Necessary for sending FormData
        processData: false, // Necessary for sending FormData
        success: function(result) {
            Swal.fire({
                icon: 'success',
                title: 'Profile update Success',
                text: 'Astrologer profile image update success!',
                confirmButtonText: 'Ok',
                confirmButtonColor: '#0E2C4B'
            });
        },
        error: function(error) {
            Swal.fire({
                icon: 'error',
                title: 'Profile update unsuccessful!',
                text: 'Astrologer profile image update unsuccessful!',
                confirmButtonText: 'Ok',
                confirmButtonColor: '#932828'
            });
        }
    });
}