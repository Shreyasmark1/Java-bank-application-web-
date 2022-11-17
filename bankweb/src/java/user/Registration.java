package user;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Random;
import javax.servlet.RequestDispatcher;

/**
 *
 * @author User
 */
public class Registration extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException  {
    }
  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }

  
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
          response.setContentType("text/html;charset=UTF-8");      
        
        PrintWriter out = response.getWriter();   
        
        String name = request.getParameter("name");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");
        String initialamount = request.getParameter("initamount");
        
        Random rnd = new Random();
       
       int accountNumber = rnd.nextInt(9000)+999;
        
        
       
        
       
       
        
       try{
            Connection con = DbConnection.initialiseconnection();
            
            
            
        
        PreparedStatement stmt =con.prepareStatement("insert into bank_table(name,phone,password,amount,accountNumber) values(?,?,?,?,?)");
        
        stmt.setString(1,name);
        stmt.setString(2,phone);
          stmt.setString(3,password);
           stmt.setString(4,initialamount);
           stmt.setInt(5,accountNumber);
           
           stmt.executeUpdate();
           
                     
           stmt.close();
           con.close();
        
           response.sendRedirect("index.jsp");
        
           
        } catch (Exception e) {
            out.println("<h1>"+ e+"</h1>");
        }
        
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
