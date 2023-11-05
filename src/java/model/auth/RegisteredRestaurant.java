/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.auth;

/**
 *
 * @author admin
 */
public class RegisteredRestaurant {
    public RestaurantDetails details;
    public String password;
    
    public RegisteredRestaurant(RestaurantDetails details, String password) {
        this.details = details;
        this.password = password;
    }
}
