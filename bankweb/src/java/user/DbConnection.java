package user;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;



public class DbConnection {
    
    protected static Connection initialiseconnection()throws SQLException, ClassNotFoundException {
        String dbDriver = "com.mysql.jdbc.Driver";
        String dbURL = "jdbc:mysql:// localhost:3306/";
        
         String dbName = "bank";
        String dbUserName ="root";
        String dbPassword="";
  
        Class.forName(dbDriver);
        Connection con = DriverManager.getConnection(dbURL + dbName,
                                                     dbUserName, 
                                                     dbPassword);
        return con;
    } 
    
   
        
        
    
    
    
}
