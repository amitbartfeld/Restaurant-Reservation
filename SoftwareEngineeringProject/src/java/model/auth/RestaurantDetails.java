/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.auth;

import model.OpeningHours;

/**
 *
 * @author admin
 */
public class RestaurantDetails extends UserDetails {
    public String name;
    public OpeningHours openingHours;
    public String location;
    public String website;

    public RestaurantDetails(String username, String name, String phone, String email, OpeningHours openingHours, String location, String website) {
        super(username, email, phone);
        this.name = name;
        this.openingHours = openingHours;
        this.location = location;
        this.website = website;
    }
    
    
}
