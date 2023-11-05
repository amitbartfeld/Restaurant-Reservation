/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package model;

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
    
    public SearchRestaurantLogicTest() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
    }

    /**
     * Test of search method, of class SearchRestaurantLogic.
     */
    @Test
    public void testSearch() {
        System.out.println("search");
        String text = "";
        RestaurantDetails[] expResult = null;
        RestaurantDetails[] result = SearchRestaurantLogic.search(text);
        assertArrayEquals(expResult, result);
        // TODO review the generated test code and remove the default call to fail.
        fail("The test case is a prototype.");
    }
    
}
