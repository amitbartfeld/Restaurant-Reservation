/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.logging.Level;
import java.util.logging.Logger;


/**
 *
 * @author admin
 */
public abstract class DatabaseUserCreator {
    protected abstract Object factoryMethod(String username) throws Exception;
    public Object create(String username) {
        try {
            return factoryMethod(username);
        } catch (Exception ex) {
            Logger.getLogger(DatabaseUserCreator.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
