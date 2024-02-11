package org.gandharva.gandharva.model;

import org.gandharva.gandharva.constants.UserType;

import java.time.LocalDate;
import java.util.UUID;

public class AllUser {
    private UUID id;
    private String firstName;
    private String lastName;
    private UserType userType;
    private String email;
    private String password;
    private String countryOfResidence;
    private String district;
    private String nic;
    private LocalDate birthday;
    private int numberOfCasesHandled;
    private int yearsOfExperience;
    private byte[] certificateFileUpload;
    private byte[] brFileUpload;
    private byte[] userImage;

    public AllUser() {
    }

    public AllUser(UUID id, String firstName, String lastName, UserType userType, String email, String password, String countryOfResidence, String district, String nic, LocalDate birthday, int numberOfCasesHandled, int yearsOfExperience, byte[] certificateFileUpload, byte[] brFileUpload, byte[] userImage) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.userType = userType;
        this.email = email;
        this.password = password;
        this.countryOfResidence = countryOfResidence;
        this.district = district;
        this.nic = nic;
        this.birthday = birthday;
        this.numberOfCasesHandled = numberOfCasesHandled;
        this.yearsOfExperience = yearsOfExperience;
        this.certificateFileUpload = certificateFileUpload;
        this.brFileUpload = brFileUpload;
        this.userImage = userImage;
    }

    public UUID getId() {
        return id;
    }

    public void setId(UUID id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public UserType getUserType() {
        return userType;
    }

    public void setUserType(UserType userType) {
        this.userType = userType;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getCountryOfResidence() {
        return countryOfResidence;
    }

    public void setCountryOfResidence(String countryOfResidence) {
        this.countryOfResidence = countryOfResidence;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getNic() {
        return nic;
    }

    public void setNic(String nic) {
        this.nic = nic;
    }

    public LocalDate getBirthday() {
        return birthday;
    }

    public void setBirthday(LocalDate birthday) {
        this.birthday = birthday;
    }

    public int getNumberOfCasesHandled() {
        return numberOfCasesHandled;
    }

    public void setNumberOfCasesHandled(int numberOfCasesHandled) {
        this.numberOfCasesHandled = numberOfCasesHandled;
    }

    public int getYearsOfExperience() {
        return yearsOfExperience;
    }

    public void setYearsOfExperience(int yearsOfExperience) {
        this.yearsOfExperience = yearsOfExperience;
    }

    public byte[] getCertificateFileUpload() {
        return certificateFileUpload;
    }

    public void setCertificateFileUpload(byte[] certificateFileUpload) {
        this.certificateFileUpload = certificateFileUpload;
    }

    public byte[] getBrFileUpload() {
        return brFileUpload;
    }

    public void setBrFileUpload(byte[] brFileUpload) {
        this.brFileUpload = brFileUpload;
    }

    public byte[] getUserImage() {
        return userImage;
    }

    public void setUserImage(byte[] userImage) {
        this.userImage = userImage;
    }
}
