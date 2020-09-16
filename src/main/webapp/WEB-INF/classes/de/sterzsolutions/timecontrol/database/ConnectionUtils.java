package de.sterzsolutions.timecontrol.database;

import de.sterzsolutions.timecontrol.model.Customer;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ConnectionUtils {
 
    public static Connection getConnection() 
              throws ClassNotFoundException, SQLException {
        return SQLServerConnUtils_JTDS.getSQLServerConnection_JTDS();
    }
     
    public static void closeQuietly(Connection conn) {
        try {
            conn.close();
        } catch (Exception e) {
        }
    }
 
    public static void rollbackQuietly(Connection conn) {
        try {
            conn.rollback();
        } catch (Exception e) {
        }
    }

    public static void insertIntoCustomers(Customer customer, Connection connection) throws SQLException, ClassNotFoundException {

        String newCustomerQuery = "INSERT INTO Customers (customer_id, name, firstname, company, address, plz, city) " +
                "VALUES('" + customer.getCustomer_id() + "', '" + customer.getName() + "', '" + customer.getFirstname() +
                "', '" + customer.getCompany() + "', '" + customer.getAddress() + "', " + customer.getPlz() + ", '" + customer.getCity() + "')";
        Statement newCustomerStatement = getConnection().createStatement();
        newCustomerStatement.execute(newCustomerQuery);
        newCustomerStatement.close();
    }

    public static void deleteCustomerFromTable (int id, Connection connection) throws SQLException, ClassNotFoundException {
        String deleteCustomerQuery = "DELETE FROM Customers WHERE customer_id = " + id;
        Statement deleteCustomerStatement = getConnection().createStatement();
        deleteCustomerStatement.execute(deleteCustomerQuery);
        deleteCustomerStatement.close();
    }





}