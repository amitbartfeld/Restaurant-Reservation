/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package model;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author admin
 */
public class OpeningHoursTest {
    
    OpeningHours hours;
    
    public OpeningHoursTest() {
    }
    

    @Before
    public void setUp() {
        hours = new OpeningHours(new int[]{1, 2, 4, 3, 6, 5, 4}, new int[]{11, 13, 15, 18, 12, 15, 16});
    }
    
    @After
    public void tearDown() {
        hours = null;
    }

    /**
     * Test of toString method, of class OpeningHours.
     */
    @Test
    public void testToString() {
        System.out.println("toString");
        String expResult = "1-11 2-13 4-15 3-18 6-12 5-15 4-16";
        String result = hours.toString();
        assertEquals(expResult, result);
    }
    
}



