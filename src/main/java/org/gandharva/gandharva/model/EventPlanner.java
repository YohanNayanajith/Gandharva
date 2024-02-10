package org.gandharva.gandharva.model;

import org.gandharva.gandharva.constants.UserType;

public class EventPlanner extends ParentUser {
    private int numberOfCasesHandled;
    private int yearsOfExperience;
    private byte[] brFileUpload;

    public EventPlanner() {}

    public EventPlanner(int numberOfCasesHandled, int yearsOfExperience, byte[] brFileUpload) {
        this.numberOfCasesHandled = numberOfCasesHandled;
        this.yearsOfExperience = yearsOfExperience;
        this.brFileUpload = brFileUpload;
    }

    public EventPlanner(ParentUser parentUser){
        super(parentUser.getId(), parentUser.getFirstName(), parentUser.getLastName(), parentUser.getUserType(), parentUser.getEmail(),
                parentUser.getPassword(), parentUser.getCountryOfResidence(), parentUser.getDistrict());
    }

    public EventPlanner(ParentUser parentUser, int numberOfCasesHandled, int yearsOfExperience, byte[] brFileUpload) {
        super(parentUser.getFirstName(), parentUser.getLastName(), parentUser.getUserType(), parentUser.getEmail(),
                parentUser.getPassword(), parentUser.getCountryOfResidence(), parentUser.getDistrict(), parentUser.getUserImage());
        this.numberOfCasesHandled = numberOfCasesHandled;
        this.yearsOfExperience = yearsOfExperience;
        this.brFileUpload = brFileUpload;
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

    public byte[] getBrFileUpload() {
        return brFileUpload;
    }

    public void setBrFileUpload(byte[] brFileUpload) {
        this.brFileUpload = brFileUpload;
    }
}
