/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import javax.servlet.http.HttpSession;
import model.auth.DatabaseClientCreator;
import model.auth.DatabaseRestaurantCreator;

/**
 *
 * @author admin
 */
public class SessionHelper {
    public static void updateUserSession(String username, HttpSession session, boolean isRestaurant) {
        if (isRestaurant)
            session.setAttribute(Constants.userSessionAttributeName, new DatabaseRestaurantCreator().create(username));
        else
            session.setAttribute(Constants.userSessionAttributeName, new DatabaseClientCreator().create(username));
    }
}
