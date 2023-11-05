/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;

/**
 *
 * @author admin
 */
public class RestaurantDetailsChanger {
    public static void changeName(String username, String newName, HttpSession session) {
        try {
            DatabaseOperationsSingleton databaseOperations = DatabaseOperationsSingleton.getInstance(Constants.restaurantTable);
            databaseOperations.updateDataInSqlByUniqueColumn(Constants.restaurantNameField, newName, Constants.restaurantUserNameField, username);
            SessionHelper.updateUserSession(username, session, true);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(RestaurantDetailsChanger.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static void changeLocation(String username, String newLocation, HttpSession session) {
        try {
            DatabaseOperationsSingleton databaseOperations = DatabaseOperationsSingleton.getInstance(Constants.restaurantTable);
            databaseOperations.updateDataInSqlByUniqueColumn(Constants.restaurantLocationField, newLocation, Constants.restaurantUserNameField, username);
            SessionHelper.updateUserSession(username, session, true);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(RestaurantDetailsChanger.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static void changeOpeningHours(String username, int[] newStartingHours, int[] newEndingHours, HttpSession session) {
        try {
            DatabaseOperationsSingleton databaseOperations = DatabaseOperationsSingleton.getInstance(Constants.restaurantTable);
            databaseOperations.updateDataInSqlByUniqueColumn(Constants.restaurantNameField, new OpeningHours(newStartingHours, newEndingHours).toString(), Constants.restaurantUserNameField, username);
            SessionHelper.updateUserSession(username, session, true);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(RestaurantDetailsChanger.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
