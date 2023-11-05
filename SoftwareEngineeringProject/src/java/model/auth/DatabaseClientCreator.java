/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model.auth;

import model.Constants;
import model.DatabaseOperationsSingleton;
import model.DatabaseUserCreator;

/**
 *
 * @author admin
 */
public class DatabaseClientCreator extends DatabaseUserCreator {

    @Override
    protected RegisteredClient factoryMethod(String username) throws Exception {
        DatabaseOperationsSingleton databaseOperations = DatabaseOperationsSingleton.getInstance(Constants.clientTable);
        Object[] restaurantData = databaseOperations.getSpecificRowByUniqueColumn(Constants.clientUserNameField, username);
        String email = (String) restaurantData[1];
        String phone = (String) restaurantData[2];
        String password = (String)restaurantData[3];
        ClientDetails details = new ClientDetails(username, email, phone);
        return new RegisteredClient(details, password);
    }
    
        @Override
    public RegisteredClient create(String username) {
        return (RegisteredClient)super.create(username);
    }
    
}
