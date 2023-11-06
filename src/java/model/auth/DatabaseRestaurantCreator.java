/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.auth;

import model.Constants;
import model.DatabaseOperationsSingleton;
import model.OpeningHours;
import model.DatabaseUserCreator;

/**
 *
 * @author admin
 */
public class DatabaseRestaurantCreator extends DatabaseUserCreator {

    @Override
    protected RegisteredRestaurant factoryMethod(String username) throws Exception {
        DatabaseOperationsSingleton databaseOperations = DatabaseOperationsSingleton.getInstance(Constants.restaurantTable);
        Object[] restaurantData = databaseOperations.getSpecificRowByUniqueColumn(Constants.restaurantUserNameField, username);
        String password = (String)restaurantData[1];
        String name = (String) restaurantData[2];
        String phone = (String) restaurantData[3];
        String email = (String) restaurantData[4];
        OpeningHours openingHours = getOpeningHours(restaurantData);
        String location = (String) restaurantData[6];
        RestaurantDetails details = new RestaurantDetails(username, name, phone, email, openingHours, location);
        return new RegisteredRestaurant(details, password);
    }
    
    private OpeningHours getOpeningHours(Object[] restaurantData) {
        String hoursString = (String) restaurantData[5];
        String[] hoursInDaysString = hoursString.split(" ");
        int[] startingHours = new int[hoursInDaysString.length];
        int[] endingHours = new int[hoursInDaysString.length];
        for (int i = 0; i < hoursInDaysString.length; i++) {
            String[] dayHours = hoursInDaysString[i].split("-");
            startingHours[i] = Integer.parseInt(dayHours[0]);
            endingHours[i] = Integer.parseInt(dayHours[1]);
        }
        OpeningHours hours = new OpeningHours(startingHours, endingHours);
        return hours;
    }

    @Override
    public RegisteredRestaurant create(String username) {
        return (RegisteredRestaurant)super.create(username);
    }
    
    
    
}
