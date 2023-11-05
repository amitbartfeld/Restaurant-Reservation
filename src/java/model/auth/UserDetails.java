/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.auth;

/**
 *
 * @author admin
 */
public class UserDetails {
    public String username;
    public String email;
    public String phone;

    public UserDetails(String username, String email, String phone) {
        this.username = username;
        this.email = email;
        this.phone = phone;
    }

    public String getUsername() {
        return username;
    }

    public String getEmail() {
        return email;
    }

    public String getPhone() {
        return phone;
    }
    
    
}
