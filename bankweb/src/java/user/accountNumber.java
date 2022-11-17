
package user;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Random;


public class accountNumber {
    
    protected int acc() throws SQLException , ClassNotFoundException
    {
    Random rnd = new Random();
       
       int accountNumber = rnd.nextInt(9000)+999;
       
        Connection con = DbConnection.initialiseconnection();
        
        PreparedStatement stmt =con.prepareStatement("select accountNumber from bank_table where accountNumber=?");
        stmt.setInt(1, accountNumber);
        
        ResultSet r = stmt.executeQuery();
        r.next();
        
        int accid = r.getInt("accountNumber");
        if(accid == accountNumber){
            acc();
        }
        
        return accountNumber;
    
}
}
