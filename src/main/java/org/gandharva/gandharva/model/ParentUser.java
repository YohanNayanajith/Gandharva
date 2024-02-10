package org.gandharva.gandharva.model;

import org.gandharva.gandharva.constants.UserType;

import java.util.UUID;

public class ParentUser {
    private UUID id;
    private String firstName;
    private String lastName;
    private UserType userType;
    private String email;
    private String password;
    private String countryOfResidence;
    private String district;
    private byte[] userImage;

    public ParentUser(){}

    public ParentUser(String firstName, String lastName, UserType userType, String email, String password, String countryOfResidence, String district) {
        this.id = UUID.randomUUID();
        this.firstName = firstName;
        this.lastName = lastName;
        this.userType = userType;
        this.email = email;
        this.password = password;
        this.countryOfResidence = countryOfResidence;
        this.district = district;
    }

    public ParentUser(String firstName, String lastName, UserType userType, String email, String password, String countryOfResidence, String district, byte[] userImage) {
        this.id = UUID.randomUUID();
        this.firstName = firstName;
        this.lastName = lastName;
        this.userType = userType;
        this.email = email;
        this.password = password;
        this.countryOfResidence = countryOfResidence;
        this.district = district;
        this.userImage = userImage;
    }

    public ParentUser(UUID id, String firstName, String lastName, UserType userType, String email, String password, String countryOfResidence, String district) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.userType = userType;
        this.email = email;
        this.password = password;
        this.countryOfResidence = countryOfResidence;
        this.district = district;
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

    public byte[] getUserImage() {
        return userImage;
    }

    public void setUserImage(byte[] userImage) {
        this.userImage = userImage;
    }
}
