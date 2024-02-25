package model;

import java.util.List;

public class User {
    private String username;
    private String password;
    private String fullName;
    private String email;
    private String img;
    private String dob;
    private int gender;
    private int role;
    private int status;

    public User() {
    }

    public User(String username, String password, String fullName, String email, String img, String dob, int gender, int role) {
        this.username = username;
        this.password = password;
        this.fullName = fullName;
        this.email = email;
        this.img = img;
        this.dob = dob;
        this.gender = gender;
        this.role = role;
    }
    
    public User(String fullName, String email, String dob, int gender, String description, int status, String img) {
        this.fullName = fullName;
        this.email = email;
        this.dob = dob;
        this.gender = gender;
        this.status = status;
        this.img = img;
    }

    public User(String username, String fullName, String email, String dob, int gender, int status, String img) {
        this.username = username;
        this.fullName = fullName;
        this.email = email;
        this.dob = dob;
        this.gender = gender;
        this.status = status;
        this.img = img;
    }

    public User(String username, String password, String fullName, String email, String img, String dob, int gender, int role, int status) {
        this.username = username;
        this.password = password;
        this.fullName = fullName;
        this.email = email;
        this.img = img;
        this.dob = dob;
        this.gender = gender;
        this.role = role;
        this.status = status;
    }
    
    public String getGenderString() {
        return gender==1 ? "Female" : "Male";
    }
    
    public String getStatusString() {
        return status==1 ? "Active" : "Inactive";
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
    
    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getDob() {
        return dob;
    }

    public void setDob(String dob) {
        this.dob = dob;
    }

    public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

}
