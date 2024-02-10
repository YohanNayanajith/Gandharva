package org.gandharva.gandharva.model;

import java.time.LocalDate;

public class User extends ParentUser {
    private String nic;
    private LocalDate birthday;

    public User() {}

    public User(String nic, LocalDate birthday) {
        this.nic = nic;
        this.birthday = birthday;
    }

    public User(ParentUser parentUser){
        super(parentUser.getId(), parentUser.getFirstName(), parentUser.getLastName(), parentUser.getUserType(), parentUser.getEmail(),
                parentUser.getPassword(), parentUser.getCountryOfResidence(), parentUser.getDistrict());
    }

    public User(ParentUser parentUser, String nic, LocalDate birthday) {
        super(parentUser.getFirstName(), parentUser.getLastName(), parentUser.getUserType(), parentUser.getEmail(),
                parentUser.getPassword(), parentUser.getCountryOfResidence(), parentUser.getDistrict(), parentUser.getUserImage());
        this.nic = nic;
        this.birthday = birthday;
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
}
