/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package model;

import java.sql.SQLException;
import java.util.LinkedList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.auth.RestaurantDetails;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author admin
 */
public class SearchRestaurantLogicTest {
        
    private LinkedList<Object[]> tableRows;
    private boolean exceptionOccurred = false;

        
    public SearchRestaurantLogicTest() {
    }
    
    @Before
    public void setUp() {
        try {
            DatabaseOperationsSingleton instance = DatabaseOperationsSingleton.getInstance(Constants.restaurantTable);
            tableRows = instance.getAllRows();
            for (Object[] row : tableRows) {
                instance.deleteDataFromDatabaseByUniqueColumn(Constants.restaurantUserNameField, row[0]);
            }
        } catch (SQLException | ClassNotFoundException ex) {
            exceptionOccurred = true;
            Logger.getLogger(DatabaseOperationsSingletonTest.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    @After
    public void tearDown() {
        try {
            DatabaseOperationsSingleton instance = DatabaseOperationsSingleton.getInstance(Constants.restaurantTable);
            LinkedList<Object[]> rows = instance.getAllRows();
            for (Object[] row : rows) {
                instance.deleteDataFromDatabaseByUniqueColumn(Constants.restaurantUserNameField, row[0]);
            }
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(DatabaseOperationsSingletonTest.class.getName()).log(Level.SEVERE, null, ex);
        }
        DatabaseOperationsSingleton instance = DatabaseOperationsSingleton.getInstance(Constants.restaurantTable);
        for (Object[] row : tableRows) {
            try {
                instance.insertDataToSql(row);
            } catch (ClassNotFoundException | SQLException ex) {
                Logger.getLogger(DatabaseOperationsSingletonTest.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    /**
     * Test of search method, of class SearchRestaurantLogic.
     */
    @Test
    public void testSearch() {
        System.out.println("search");
        DatabaseOperationsSingleton instance = DatabaseOperationsSingleton.getInstance(Constants.restaurantTable);
        try {
            instance.insertDataToSql(new Object[]{"abc", "abcTheKing123", "abc's restaurant", "0549999999", "abc@gmail.com", "1-11 2-22 3-13 4-23 16-18 9-14 1-2", "Netanya", "www.abc.com"});
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(SearchRestaurantLogicTest.class.getName()).log(Level.SEVERE, null, ex);
        }
        String text = "Neta";
        RestaurantDetails[] result = SearchRestaurantLogic.search(text);
        assertEquals(false, exceptionOccurred);
        assertEquals(1, result.length);
        assertEquals("abc", result[0].username);
    }
    
}
