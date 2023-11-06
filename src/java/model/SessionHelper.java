/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import javax.servlet.http.HttpSession;
import model.auth.DatabaseClientCreator;
import model.auth.DatabaseRestaurantCreator;
import model.auth.UserDetails;

/**
 *
 * @author admin
 */
public class SessionHelper {
    public static void updateUserSession(String username, HttpSession session, boolean isRestaurant) {
        if (isRestaurant)
            session.setAttribute(Constants.userSessionAttributeName, (UserDetails)new DatabaseRestaurantCreator().create(username).details);
        else
            session.setAttribute(Constants.userSessionAttributeName, (UserDetails)new DatabaseClientCreator().create(username).getDetails());
    }
}
