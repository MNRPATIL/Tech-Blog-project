
package com.tech.blog.entities;
import java.sql.*;

public class User {
    private int Id;
    private String Name;
    private String email;
    private String password;
    private String gender;
    private Timestamp dateTime;
    private String about;
    private String profile;

    public User(int Id, String Name, String email, String password, String gender, Timestamp dateTime, String about) {
        this.Id = Id;
        this.Name = Name;
        this.email = email;
        this.password = password;
        this.gender = gender;
        this.dateTime = dateTime;
        this.about = about;
    }

    public User() {
    }

    public User(String Name, String email, String password, String gender,  String about) {
        this.Name = Name;
        this.email = email;
        this.password = password;
        this.gender = gender;
        this.about = about;
    }
    
    //getters and Setters

    public int getId() {
        return Id;
    }

    public void setId(int Id) {
        this.Id = Id;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
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

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Timestamp getDateTime() {
        return dateTime;
    }

    public void setDateTime(Timestamp dateTime) {
        this.dateTime = dateTime;
    }

    public String getAbout() {
        return about;
    }

    public void setAbout(String about) {
        this.about = about;
    }

    public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }
    
    
}
