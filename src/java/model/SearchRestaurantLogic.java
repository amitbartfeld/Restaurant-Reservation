/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.SQLException;
import java.util.LinkedList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.auth.DatabaseRestaurantCreator;
import model.auth.RestaurantDetails;

/**
 *
 * @author admin
 */
public class SearchRestaurantLogic {
    //searches a restaurant that its name or its location contain the given text.
    public static RestaurantDetails[] search(String text) {
        try {
            LinkedList<RestaurantDetails> restaurants = new LinkedList<>();
            DatabaseOperationsSingleton databaseOperations = DatabaseOperationsSingleton.getInstance(Constants.restaurantTable);
            LinkedList<Object[]> rows = databaseOperations.getAllRows();
            for (Object[] row : rows) {
                if (row[6].toString().contains(text) || row[2].toString().contains(text))
                    restaurants.add(new DatabaseRestaurantCreator().create(row[0].toString()).details);
            }
            return restaurants.toArray(new RestaurantDetails[0]);
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(SearchRestaurantLogic.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
