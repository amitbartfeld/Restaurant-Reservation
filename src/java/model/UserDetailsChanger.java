/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;
import model.auth.DatabaseClientCreator;
import model.auth.DatabaseRestaurantCreator;

/**
 *
 * @author admin
 */
public class UserDetailsChanger {
    private final boolean isRestaurant;
    private final String usernameField;
    private final String tableName;
    public UserDetailsChanger(boolean isRestaurant) {
        this.isRestaurant = isRestaurant;
        if (isRestaurant) {
            usernameField = Constants.restaurantUserNameField;
            tableName = Constants.restaurantTable;
        } else {
            usernameField = Constants.clientUserNameField;
            tableName = Constants.clientTable;
        }
    }
    
    public void changePassword(String username, String newPassword, HttpSession session) {
        try {
            String passwordField;
            if (isRestaurant)
                passwordField = Constants.restaurantPasswordField;
            else
                passwordField = Constants.clientPasswordField;
            DatabaseOperationsSingleton databaseOperations = DatabaseOperationsSingleton.getInstance(tableName);
            databaseOperations.updateDataInSqlByUniqueColumn(passwordField, newPassword, usernameField, username);
            SessionHelper.updateUserSession(username, session, isRestaurant);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(UserDetailsChanger.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void changeEmail(String username, String newEmail, HttpSession session) {
        try {
            String emailField;
            if (isRestaurant)
                emailField = Constants.restaurantEmailField;
            else
                emailField = Constants.clientEmailField;
            DatabaseOperationsSingleton databaseOperations = DatabaseOperationsSingleton.getInstance(tableName);
            databaseOperations.updateDataInSqlByUniqueColumn(emailField, newEmail, usernameField, username);
            SessionHelper.updateUserSession(username, session, isRestaurant);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(UserDetailsChanger.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void changePhone(String username, String newEmail, HttpSession session) {
        try {
            String phoneField;
            if (isRestaurant)
                phoneField = Constants.restaurantEmailField;
            else
                phoneField = Constants.clientEmailField;
            DatabaseOperationsSingleton databaseOperations = DatabaseOperationsSingleton.getInstance(tableName);
            databaseOperations.updateDataInSqlByUniqueColumn(phoneField, newEmail, usernameField, username);
            SessionHelper.updateUserSession(username, session, isRestaurant);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(UserDetailsChanger.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void deleteUser(String username, HttpSession session) {
        try {
            DatabaseOperationsSingleton databaseOperations = DatabaseOperationsSingleton.getInstance(tableName);
            databaseOperations.deleteDataFromDatabaseByUniqueColumn(usernameField, username);
            session.invalidate();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(UserDetailsChanger.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
