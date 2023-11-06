/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/UnitTests/JUnit4TestClass.java to edit this template
 */
package model;

import java.sql.SQLException;
import java.util.LinkedList;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.junit.After;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author admin
 */
public class DatabaseOperationsSingletonTest {
    
    private static final String username = "abc";
    private boolean exceptionOccurred = false;
    private static final String[] tableNames = {Constants.clientTable, Constants.restaurantTable, Constants.reservationTable};
    private static final String[] uniqueFields = {Constants.clientUserNameField, Constants.restaurantUserNameField, Constants.reservationTimeField};
    private LinkedList<LinkedList<Object[]>> tablesRows;
    
    
    public DatabaseOperationsSingletonTest() {
    }
    
    //deletes the tables (and saves them for restoration).
    @Before
    public void setUp() {
        tablesRows = new LinkedList<>();
        try {
            for (int i = 0; i < tableNames.length; i++) {
                DatabaseOperationsSingleton instance = DatabaseOperationsSingleton.getInstance(tableNames[i]);
                LinkedList<Object[]> rows = instance.getAllRows();
                tablesRows.add(rows);
                for (Object[] row : rows) {
                    instance.deleteDataFromDatabaseByUniqueColumn(uniqueFields[i], row[0]);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            exceptionOccurred = true;
            Logger.getLogger(DatabaseOperationsSingletonTest.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    @After
    public void tearDown() {
        try {
            for (int i = 0; i < tableNames.length; i++) {
                DatabaseOperationsSingleton instance = DatabaseOperationsSingleton.getInstance(tableNames[i]);
                LinkedList<Object[]> rows = instance.getAllRows();
                for (Object[] row : rows) {
                    instance.deleteDataFromDatabaseByUniqueColumn(uniqueFields[i], row[0]);
                }
            }
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(DatabaseOperationsSingletonTest.class.getName()).log(Level.SEVERE, null, ex);
        }
        for (LinkedList<Object[]> rows : tablesRows) {
            DatabaseOperationsSingleton instance = DatabaseOperationsSingleton.getInstance(Constants.restaurantTable);
            for (Object[] row : rows) {
                try {
                    instance.insertDataToSql(row);
                } catch (ClassNotFoundException | SQLException ex) {
                    Logger.getLogger(DatabaseOperationsSingletonTest.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }
    

    /**
     * Test of getInstance method, of class DatabaseOperationsSingleton.
     */
    @Test
    public void testGetInstance() {
        System.out.println("getInstance");
        for (String tableName : tableNames) {
            DatabaseOperationsSingleton result = DatabaseOperationsSingleton.getInstance(tableName);
            assertNotEquals(null, result);
        }
        assertEquals(false, exceptionOccurred);
    }

    /**
     * Test of insertDataToSql method, of class DatabaseOperationsSingleton.
     */
    @Test
    public void testInsertDataToSql() {
        System.out.println("insertDataToSql");
        for (int i = 0; i < tableNames.length; i++) {
            try {
                DatabaseOperationsSingleton instance = DatabaseOperationsSingleton.getInstance(tableNames[i]);
                Object[] o;
                switch (i) {
                    case 0:
                        o = new Object[]{username, "abc@gmail.com", "0549999999", "abcTheKing123"};
                        instance.insertDataToSql(o);
                        Assert.assertArrayEquals(instance.getSpecificRowByUniqueColumn(uniqueFields[i], username), o);
                        instance.deleteDataFromDatabaseByUniqueColumn(uniqueFields[i], username);
                        break;
                    case 1:
                        o = new Object[]{username, "abcTheKing123", "abc's restaurant", "0549999999", "abc@gmail.com", "1-11 2-22 3-13 4-23 16-18 9-14 1-2", "Netanya"};
                        instance.insertDataToSql(o);
                        Assert.assertArrayEquals(instance.getSpecificRowByUniqueColumn(uniqueFields[i], username), o);
                        instance.deleteDataFromDatabaseByUniqueColumn(uniqueFields[i], username);
                        break;
                    case 2:
                        o = new Object[]{1234543222, "abc's restaurant", "23", "true", "abc"};
                        instance.insertDataToSql(o);
                        o = new Object[]{"1234543222", "abc's restaurant", "23", "true", "abc"};
                        Assert.assertArrayEquals(instance.getSpecificRowByUniqueColumn(uniqueFields[i], 1234543222), o);
                        instance.deleteDataFromDatabaseByUniqueColumn(uniqueFields[i], 1234543222);
                        break;
                    default:
                        break;
                }
            } catch (ClassNotFoundException | SQLException ex) {
                exceptionOccurred = true;
                Logger.getLogger(DatabaseOperationsSingletonTest.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        assertEquals(false, exceptionOccurred);
    }

    /**
     * Test of deleteDataFromDatabaseByUniqueColumn method, of class DatabaseOperationsSingleton.
     */
    @Test
    public void testDeleteDataFromDatabaseByUniqueColumn() {
        System.out.println("deleteDataFromDatabaseByUniqueColumn");
        for (int i = 0; i < tableNames.length; i++) {
            try {
                DatabaseOperationsSingleton instance = DatabaseOperationsSingleton.getInstance(tableNames[i]);
                Object[] o;
                switch (i) {
                    case 0:
                        o = new Object[]{username, "abc@gmail.com", "0549999999", "abcTheKing123"};
                        instance.insertDataToSql(o);
                        Assert.assertArrayEquals(instance.getSpecificRowByUniqueColumn(uniqueFields[i], username), o);
                        instance.deleteDataFromDatabaseByUniqueColumn(uniqueFields[i], username);
                        Assert.assertEquals(instance.getSpecificRowByUniqueColumn(uniqueFields[i], username) == null, true);
                        break;
                    case 1:
                        o = new Object[]{username, "abcTheKing123", "abc's restaurant", "0549999999", "abc@gmail.com", "1-11 2-22 3-13 4-23 16-18 9-14 1-2", "Netanya"};
                        instance.insertDataToSql(o);
                        Assert.assertArrayEquals(instance.getSpecificRowByUniqueColumn(uniqueFields[i], username), o);
                        instance.deleteDataFromDatabaseByUniqueColumn(uniqueFields[i], username);
                        Assert.assertEquals(instance.getSpecificRowByUniqueColumn(uniqueFields[i], username) == null, true);
                        break;
                    case 2:
                        o = new Object[]{1234543222, "abc's restaurant", "23", "true", "abc"};
                        instance.insertDataToSql(o);
                        o = new Object[]{"1234543222", "abc's restaurant", "23", "true", "abc"};
                        Assert.assertArrayEquals(instance.getSpecificRowByUniqueColumn(uniqueFields[i], 1234543222), o);
                        instance.deleteDataFromDatabaseByUniqueColumn(uniqueFields[i], 1234543222);
                        Assert.assertEquals(instance.getSpecificRowByUniqueColumn(uniqueFields[i], 1234543222) == null, true);
                        break;
                    default:
                        break;
                }
            } catch (ClassNotFoundException | SQLException ex) {
                exceptionOccurred = true;
                Logger.getLogger(DatabaseOperationsSingletonTest.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        assertEquals(false, exceptionOccurred);
    }

    /**
     * Test of updateDataInSqlByUniqueColumn method, of class DatabaseOperationsSingleton.
     */
    @Test
    public void testUpdateDataInSqlByUniqueColumn() {
        System.out.println("updateDataInSqlByUniqueColumn");
        for (int i = 0; i < tableNames.length; i++) {
            try {
                DatabaseOperationsSingleton instance = DatabaseOperationsSingleton.getInstance(tableNames[i]);
                Object[] o;
                switch (i) {
                    case 0:
                        o = new Object[]{username, "abc@gmail.com", "0549999999", "abcTheKing123"};
                        instance.insertDataToSql(o);
                        Assert.assertArrayEquals(instance.getSpecificRowByUniqueColumn(uniqueFields[i], username), o);
                        instance.updateDataInSqlByUniqueColumn(Constants.clientEmailField, "bbb@gmail.com", uniqueFields[i], username);
                        Assert.assertEquals("bbb@gmail.com", instance.getSpecificRowByUniqueColumn(uniqueFields[i], username)[1]);
                        instance.deleteDataFromDatabaseByUniqueColumn(uniqueFields[i], username);
                        break;
                    case 1:
                        o = new Object[]{username, "abcTheKing123", "abc's restaurant", "0549999999", "abc@gmail.com", "1-11 2-22 3-13 4-23 16-18 9-14 1-2", "Netanya"};
                        instance.insertDataToSql(o);
                        Assert.assertArrayEquals(instance.getSpecificRowByUniqueColumn(uniqueFields[i], username), o);
                        instance.updateDataInSqlByUniqueColumn(Constants.restaurantEmailField, "bbb@gmail.com", uniqueFields[i], username);
                        Assert.assertEquals("bbb@gmail.com", instance.getSpecificRowByUniqueColumn(uniqueFields[i], username)[4]);
                        instance.deleteDataFromDatabaseByUniqueColumn(uniqueFields[i], username);
                        break;
                    case 2:
                        o = new Object[]{1234543222, "abc's restaurant", "23", "true", "abc"};
                        instance.insertDataToSql(o);
                        o = new Object[]{"1234543222", "abc's restaurant", "23", "true", "abc"};
                        Assert.assertArrayEquals(instance.getSpecificRowByUniqueColumn(uniqueFields[i], 1234543222), o);
                        instance.updateDataInSqlByUniqueColumn(Constants.reservationIsRelevantField, "false", uniqueFields[i], 1234543222);
                        Assert.assertEquals("false", instance.getSpecificRowByUniqueColumn(uniqueFields[i], 1234543222)[3]);
                        instance.deleteDataFromDatabaseByUniqueColumn(uniqueFields[i], 1234543222);
                        break;
                    default:
                        break;
                }
            } catch (ClassNotFoundException | SQLException ex) {
                exceptionOccurred = true;
                Logger.getLogger(DatabaseOperationsSingletonTest.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        assertEquals(false, exceptionOccurred);
    }

    /**
     * Test of getAllRows method, of class DatabaseOperationsSingleton.
     */
    @Test
    public void testGetAllRows() {
        System.out.println("getAllRows");
        for (int i = 0; i < tableNames.length; i++) {
            try {
                DatabaseOperationsSingleton instance = DatabaseOperationsSingleton.getInstance(tableNames[i]);
                Object[] o1;
                Object[] o2;
                LinkedList<Object[]> newRows;
                switch (i) {
                    case 0:
                        o1 = new Object[]{username, "abc@gmail.com", "0549999999", "abcTheKing123"};
                        instance.insertDataToSql(o1);
                        Assert.assertArrayEquals(instance.getSpecificRowByUniqueColumn(uniqueFields[i], username), o1);
                        o2 = new Object[]{"bbb", "abc2@gmail.com", "0549998899", "abcTheKiiiing123"};
                        instance.insertDataToSql(o2);
                        Assert.assertArrayEquals(instance.getSpecificRowByUniqueColumn(uniqueFields[i], "bbb"), o2);
                        newRows = instance.getAllRows();
                        for (Object[] row : newRows) {
                            if (String.valueOf(row[0]).equals("abc"))
                                assertArrayEquals(row, o1);
                            else
                                assertArrayEquals(row, o2);
                            instance.deleteDataFromDatabaseByUniqueColumn(uniqueFields[i], row[0]);
                        }
                        break;
                    case 1:
                        o1 = new Object[]{username, "abcTheKing123", "abc's restaurant", "0549999999", "abc@gmail.com", "1-11 2-22 3-13 4-23 16-18 9-14 1-2", "Netanya"};
                        instance.insertDataToSql(o1);
                        Assert.assertArrayEquals(instance.getSpecificRowByUniqueColumn(uniqueFields[i], username), o1);
                        o2 = new Object[]{"bbb", "abcTheKiiiing123", "bbb's restaurant", "0549998899", "bbb@gmail.com", "1-11 2-22 3-12 4-21 16-18 9-14 1-2", "Hadera"};
                        instance.insertDataToSql(o2);
                        Assert.assertArrayEquals(instance.getSpecificRowByUniqueColumn(uniqueFields[i], "bbb"), o2);
                        newRows = instance.getAllRows();
                        for (Object[] row : newRows) {
                            if (String.valueOf(row[0]).equals("abc"))
                                assertArrayEquals(row, o1);
                            else
                                assertArrayEquals(row, o2);
                            instance.deleteDataFromDatabaseByUniqueColumn(uniqueFields[i], row[0]);
                        }
                        break;
                    case 2:
                        o1 = new Object[]{1234543222, "abc's restaurant", "23", "true", "abc"};
                        instance.insertDataToSql(o1);
                        o1 = new Object[]{"1234543222", "abc's restaurant", "23", "true", "abc"};
                        Assert.assertArrayEquals(instance.getSpecificRowByUniqueColumn(uniqueFields[i], 1234543222), o1);
                        o2 = new Object[]{1234543221, "bbb's restaurant", "20", "false", "abc"};
                        instance.insertDataToSql(o2);
                        o2 = new Object[]{"1234543221", "bbb's restaurant", "20", "false", "abc"};
                        Assert.assertArrayEquals(instance.getSpecificRowByUniqueColumn(uniqueFields[i], 1234543221), o2);
                        newRows = instance.getAllRows();
                        for (Object[] row : newRows) {
                            if (row[0].equals("1234543222"))
                                assertArrayEquals(row, o1);
                            else
                                assertArrayEquals(row, o2);
                            instance.deleteDataFromDatabaseByUniqueColumn(uniqueFields[i], row[0]);
                        }
                        break;
                    default:
                        break;
                }
                
            } catch (ClassNotFoundException | SQLException ex) {
                exceptionOccurred = true;
                Logger.getLogger(DatabaseOperationsSingletonTest.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        assertEquals(false, exceptionOccurred);
    }

    /**
     * Test of getSpecificRowByUniqueColumn method, of class DatabaseOperationsSingleton.
     */
    @Test
    public void testGetSpecificRowByUniqueColumn() {
        System.out.println("getSpecificRowByUniqueColumn");
        for (int i = 0; i < tableNames.length; i++) {
            try {
                DatabaseOperationsSingleton instance = DatabaseOperationsSingleton.getInstance(tableNames[i]);
                Object[] o;
                switch (i) {
                    case 0:
                        o = new Object[]{username, "abc@gmail.com", "0549999999", "abcTheKing123"};
                        instance.insertDataToSql(o);
                        Assert.assertArrayEquals(instance.getSpecificRowByUniqueColumn(uniqueFields[i], username), o);
                        instance.deleteDataFromDatabaseByUniqueColumn(uniqueFields[i], username);
                        break;
                    case 1:
                        o = new Object[]{username, "abcTheKing123", "abc's restaurant", "0549999999", "abc@gmail.com", "1-11 2-22 3-13 4-23 16-18 9-14 1-2", "Netanya"};
                        instance.insertDataToSql(o);
                        Assert.assertArrayEquals(instance.getSpecificRowByUniqueColumn(uniqueFields[i], username), o);
                        instance.deleteDataFromDatabaseByUniqueColumn(uniqueFields[i], username);
                        break;
                    case 2:
                        o = new Object[]{1234543222, "abc's restaurant", "23", "true", "abc"};
                        instance.insertDataToSql(o);
                        o = new Object[]{"1234543222", "abc's restaurant", "23", "true", "abc"};
                        Assert.assertArrayEquals(instance.getSpecificRowByUniqueColumn(uniqueFields[i], 1234543222), o);
                        instance.deleteDataFromDatabaseByUniqueColumn(uniqueFields[i], 1234543222);
                        break;
                    default:
                        break;
                }
            } catch (ClassNotFoundException | SQLException ex) {
                exceptionOccurred = true;
                Logger.getLogger(DatabaseOperationsSingletonTest.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        assertEquals(false, exceptionOccurred);
    }
    
}
