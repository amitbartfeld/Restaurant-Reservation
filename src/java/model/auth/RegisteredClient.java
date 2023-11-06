/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.auth;

/**
 *
 * @author admin
 */
public class RegisteredClient {
    private final ClientDetails details;
    private final String password;

    public RegisteredClient(ClientDetails details, String password) {
        this.details = details;
        this.password = password;
    }

    public String getPassword() {
        return password;
    }

    public ClientDetails getDetails() {
        return details;
    }
    
    
    
    
    
    
}
