/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.auth;

/**
 *
 * @author admin
 */
public class ClientDetails extends UserDetails {

    public ClientDetails(String username, String email, String phone) {
        super(username, email, phone);
    }
}
