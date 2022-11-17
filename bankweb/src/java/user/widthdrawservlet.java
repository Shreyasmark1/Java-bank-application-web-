/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package user;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author User
 */
public class widthdrawservlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        PrintWriter out= response.getWriter();
        int amount = Integer.parseInt(request.getParameter("depositeamount"));
        int acc = Integer.parseInt(request.getParameter("acc"));
    
               
        
        try{
            
            
            
            Connection con = DbConnection.initialiseconnection();

            PreparedStatement stmt = con.prepareStatement("select amount from bank_table where accountNumber = ?");
            stmt.setInt(1, acc);
          
              
              
              ResultSet rs = stmt.executeQuery();
              rs.next();
              
              int tempamount = rs.getInt("amount");
              
              tempamount = tempamount-amount;
                PreparedStatement stmt2 = con.prepareStatement("update bank_table set amount=? where accountNumber = ?");
                stmt2.setInt(1, tempamount);
                stmt2.setInt(2, acc);
                
                 int rs2 = stmt2.executeUpdate();
                 stmt.close();
            con.close();
            
            request.setAttribute("message","amount withrawn amount is:  "+amount);
             request.getRequestDispatcher("homepage.jsp").forward(request, response);
              
              
            
        }catch(Exception e){
            out.print("<h1>"+e+"<h2>");
        }
      
        
    }

  
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}