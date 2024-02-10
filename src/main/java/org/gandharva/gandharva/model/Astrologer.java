package org.gandharva.gandharva.model;

import org.gandharva.gandharva.constants.UserType;

public class Astrologer extends ParentUser {
    private int numberOfCasesHandled;
    private int yearsOfExperience;
    private byte[] certificateFileUpload; // Assuming blob is represented as a byte array

    public  Astrologer(){}

    public Astrologer(int numberOfCasesHandled, int yearsOfExperience, byte[] certificateFileUpload) {
        this.numberOfCasesHandled = numberOfCasesHandled;
        this.yearsOfExperience = yearsOfExperience;
        this.certificateFileUpload = certificateFileUpload;
    }

    public Astrologer(ParentUser parentUser){
        super(parentUser.getId(), parentUser.getFirstName(), parentUser.getLastName(), parentUser.getUserType(), parentUser.getEmail(),
                parentUser.getPassword(), parentUser.getCountryOfResidence(), parentUser.getDistrict());
    }

    public Astrologer(ParentUser parentUser, int numberOfCasesHandled, int yearsOfExperience, byte[] certificateFileUpload) {
        super(parentUser.getFirstName(), parentUser.getLastName(), parentUser.getUserType(), parentUser.getEmail(),
                parentUser.getPassword(), parentUser.getCountryOfResidence(), parentUser.getDistrict(), parentUser.getUserImage());
        this.numberOfCasesHandled = numberOfCasesHandled;
        this.yearsOfExperience = yearsOfExperience;
        this.certificateFileUpload = certificateFileUpload;
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
}
