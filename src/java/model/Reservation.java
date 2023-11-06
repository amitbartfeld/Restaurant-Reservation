/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.SQLException;
import java.util.Calendar;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.auth.DatabaseRestaurantCreator;

/**
 *
 * @author admin
 */
public class Reservation {
    private final String restaurantUserName;
    private final String clientUserName;
    private final long time;
    private final int numOfPeople;
    private final long reservationTime;
    private boolean isRelevant;

    public Reservation(long time, String restaurantUserName, String clientUserName, int numOfPeople, long reservationTime, boolean isRelevant) {
        this.time = time;
        this.restaurantUserName = restaurantUserName;
        this.clientUserName = clientUserName;
        this.numOfPeople = numOfPeople;
        this.reservationTime = reservationTime;
        this.isRelevant = isRelevant;
    }

    public int getNumOfPeople() {
        return numOfPeople;
    }

    public String getReservationDate() {
        Calendar c = Calendar.getInstance();
        c.setTimeInMillis(reservationTime);
        return c.get(Calendar.DAY_OF_MONTH)+"/"+(c.get(Calendar.MONTH)+1)+"/"+c.get(Calendar.YEAR);
    }
    
    public String getReservationTime() {
        Calendar c = Calendar.getInstance();
        c.setTimeInMillis(reservationTime);
        return c.get(Calendar.HOUR_OF_DAY)+":00";
    }

    public String getRestaurantName() {
        return new DatabaseRestaurantCreator().create(restaurantUserName).details.name;
    }
    
    public String getRestaurantPhone() {
        return new DatabaseRestaurantCreator().create(restaurantUserName).details.phone;
    }

    public boolean isRelevant() {
        return isRelevant;
    }

    public String getClientUserName() {
        return clientUserName;
    }

    public String getRestaurantUserName() {
        return restaurantUserName;
    }

    public long getTime() {
        return time;
    }
    
    public void cancel() {
        isRelevant = false;
        DatabaseOperationsSingleton databaseOperations = DatabaseOperationsSingleton.getInstance(Constants.reservationTable);
        try {
            databaseOperations.updateDataInSqlByUniqueColumn(Constants.reservationIsRelevantField, false, Constants.reservationTimeField, reservationTime);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Reservation.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
