/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author admin
 */
public class Reservation {
    public String restaurantUserName;
    public int numOfPeople;
    public long reservationTime;
    public boolean isRelevant;

    public Reservation(String restaurantUserName, int numOfPeople, long reservationTime, boolean isRelevant) {
        this.restaurantUserName = restaurantUserName;
        this.numOfPeople = numOfPeople;
        this.reservationTime = reservationTime;
        this.isRelevant = isRelevant;
    }
    
    public void delete() {
        try {
            DatabaseOperationsSingleton databaseOperations = DatabaseOperationsSingleton.getInstance(Constants.reservationTable);
            databaseOperations.deleteDataFromDatabaseByUniqueColumn(Constants.reservationTimeField, reservationTime);
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(Reservation.class.getName()).log(Level.SEVERE, null, ex);
        }
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
