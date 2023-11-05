package model;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.LinkedList;
import java.util.logging.Level;
import java.util.logging.Logger;


public class DatabaseOperationsSingleton {
    private static final String databaseURL = "jdbc:derby://localhost:1527/project";
    private final String tableName;
    private final static DatabaseOperationsSingleton instance = null;
    private Connection connection;
    
    private DatabaseOperationsSingleton(String tableName) {
        this.tableName = tableName;
        try {
            connection = connectToDatabase();
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(DatabaseOperationsSingleton.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static DatabaseOperationsSingleton getInstance(String tableName) {
        if (instance == null)
            return new DatabaseOperationsSingleton(tableName);
        return instance;
    }
    
    //insert at the same order as in the table.
    public void insertDataToSql(Object[] values) throws ClassNotFoundException, SQLException {
        int numOfColumns = values.length;
        String generalQuery = "insert into "+tableName+" values(";
            for (int i = 1; i <= numOfColumns - 1; i++) {
                generalQuery += "?, ";
            }
            generalQuery += "?)";
            PreparedStatement st = connection.prepareStatement(generalQuery);
        for (int i = 1; i <= values.length; i++)
            st.setObject(i, values[i-1]);
        st.executeUpdate();
    }
    
    //deletes the row with the given field
    public void deleteDataFromDatabaseByUniqueColumn(String tableUniqueColumnName, Object rowUniqueColumnValue) throws SQLException, ClassNotFoundException {
        PreparedStatement st = connection.prepareStatement("delete from "+tableName+" where "+tableUniqueColumnName+" = ?");
        st.setObject(1, rowUniqueColumnValue);
        st.executeUpdate();
    }
    
    //updates the row with the given field
    public void updateDataInSqlByUniqueColumn(String fieldName, Object newValue, String tableUniqueColumnName, Object rowUniqueColumnValue) throws ClassNotFoundException, SQLException {
        //create general statement query
        PreparedStatement st = connection.prepareStatement("update " + tableName + " set " + fieldName + " = ? where " + tableUniqueColumnName + " = ?");
        //fill the statement
        st.setObject(1, newValue);
        st.setObject(2, rowUniqueColumnValue);
        st.executeUpdate();
    }
    
    //retrieves all rows. If the list is empty, there are no rows.
    public LinkedList<Object[]> getAllRows() throws SQLException, ClassNotFoundException {
        LinkedList<Object[]> rows = new LinkedList<>();
        Statement st = connection.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        String query = "select * from " + tableName;
        ResultSet rs = st.executeQuery(query);
        ResultSetMetaData rsmd = rs.getMetaData();
        int numOfColumnsInTable = rsmd.getColumnCount();
        rs.beforeFirst();
        while (rs.next()) {
            Object[] row = new Object[numOfColumnsInTable];
            for (int columnNum = 1; columnNum <= numOfColumnsInTable; columnNum++) {
                row[columnNum-1] = rs.getObject(columnNum).toString();
            }
            rows.add(row);
        }
        return rows;
    }
    
    //retrieves the row with the specified field. If there is no row with this field, returns null.
    public String[] getSpecificRowByUniqueColumn(String tableUniqueColumnName, Object rowUniqueColumnValue) throws SQLException, ClassNotFoundException {
        PreparedStatement st = connection.prepareStatement("select * from " + tableName + " where " + tableUniqueColumnName + " = ?", ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);
        st.setObject(1, rowUniqueColumnValue);
        ResultSet rs = st.executeQuery();
        ResultSetMetaData rsmd = rs.getMetaData();
        int numOfColumnsInTable = rsmd.getColumnCount();
        if (!rs.first())
            return null;
        String[] row = new String[numOfColumnsInTable];
        for (int columnNum = 1; columnNum <= numOfColumnsInTable; columnNum++) {
            row[columnNum-1] = rs.getObject(columnNum).toString();
        }
        return row;
    }
    
    private Connection connectToDatabase() throws SQLException, ClassNotFoundException {
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        return DriverManager.getConnection(databaseURL);
    }
}
