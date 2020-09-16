package de.sterzsolutions.timecontrol.database;

	import java.sql.Connection;
	import java.sql.DriverManager;
	import java.sql.SQLException;

public class SQLServerConnUtils_JTDS {

    private static Connection con;


    public static Connection getSQLServerConnection_JTDS() //
            throws SQLException, ClassNotFoundException {


        String hostName = "HEROSATLEARN";
        String sqlInstanceName = "AZUBI2020KOELN";
        String database = "datenbankverwaltung";
        String userName = "datenbankverwaltung";
        String password = "DI56mOzN";

        if(con == null || con.isClosed()) {
            con = getSQLServerConnection_JTDS(hostName, sqlInstanceName, database, userName, password);
        }
        return con;
    }

    // Die Verbindung zum  SQL Server durch die Bibliothek JTDS.
    private static Connection getSQLServerConnection_JTDS(String hostName, //
            String sqlInstanceName, String database, String userName, String password)
            throws ClassNotFoundException, SQLException {

        Class.forName("net.sourceforge.jtds.jdbc.Driver");


        // jdbc:jtds:sqlserver://HEROSATLEARN;instance=AZUBI2020KOELN
        String connectionURL = "jdbc:jtds:sqlserver://" + hostName + ";databaseName=" //
                + database + ";instance=" + sqlInstanceName;

        Connection connGet = DriverManager.getConnection(connectionURL, userName, password);
        return connGet;
    }
}
	
