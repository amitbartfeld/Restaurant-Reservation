/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.auth;

import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;
import model.Constants;
import model.DatabaseOperationsSingleton;
import model.OpeningHours;

/**
 *
 * @author admin
 */
public class AuthenticationLogic {
    public static boolean registerClient(String username, String email, String phone, String password, HttpSession session) {
        try {
            DatabaseOperationsSingleton databaseOperations = DatabaseOperationsSingleton.getInstance(Constants.clientTable);
            Object[] row = databaseOperations.getSpecificRowByUniqueColumn(Constants.clientUserNameField, username);
            if (row == null) {
                databaseOperations.insertDataToSql(new Object[]{username, email, phone, password});
                session.setAttribute("user", new DatabaseClientCreator().create(username));
                session.setAttribute("isClient", true);
                return true;
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(AuthenticationLogic.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
    
    public static boolean registerRestaurant(String username, String password, String name, String phone, String email, int[] startingHours, int[] endingHours, String location, HttpSession session) {
        try {
            DatabaseOperationsSingleton databaseOperations = DatabaseOperationsSingleton.getInstance(Constants.restaurantTable);
            Object[] row = databaseOperations.getSpecificRowByUniqueColumn(Constants.restaurantUserNameField, username);
            if (row == null) {
                databaseOperations.insertDataToSql(new Object[]{username, password, name, phone, email, new OpeningHours(startingHours, endingHours).toString(), location});
                session.setAttribute("user", new DatabaseRestaurantCreator().create(username));
                session.setAttribute("isClient", false);
                return true;
            }
        } catch (ClassNotFoundException | SQLException e) {
            Logger.getLogger(AuthenticationLogic.class.getName()).log(Level.SEVERE, null, e);
        }
        return false;
    }
    
    public static boolean login(String username, String password, boolean isRestaurant, HttpSession session) {
        String table;
        String usernameColumnName;
        if (isRestaurant) {
            table = Constants.restaurantTable;
            usernameColumnName = Constants.restaurantUserNameField;
        } else {
            table = Constants.clientTable;
            usernameColumnName = Constants.clientUserNameField;
        }
        try {
            DatabaseOperationsSingleton databaseOperations = DatabaseOperationsSingleton.getInstance(table);
            Object[] row = databaseOperations.getSpecificRowByUniqueColumn(usernameColumnName, username);
            if (row != null) {
                if (isRestaurant) {
                    session.setAttribute("isClient", false);
                    session.setAttribute("user", new DatabaseRestaurantCreator().create(username));
                } else {
                    session.setAttribute("isClient", true);
                    session.setAttribute("user", new DatabaseClientCreator().create(username));
                }
                return true;
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(AuthenticationLogic.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }
}
