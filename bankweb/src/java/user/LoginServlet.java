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
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author User
 */
public class LoginServlet extends HttpServlet {

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
            throws ServletException, IOException {

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html;charset=UTF-8");

        PrintWriter out = response.getWriter();

        String Number = request.getParameter("phoneNumber");
        String Password = request.getParameter("password");

        try {
            Connection con = DbConnection.initialiseconnection();

            PreparedStatement stmt = con.prepareStatement("select phone from bank_table where password = ?");
            
            
            stmt.setString(1,Password);
             ResultSet result = stmt.executeQuery();                           
            
            if (!result.next()) {
               stmt.close();
           con.close();
               request.setAttribute("state", "fail");
               request.getRequestDispatcher("index.jsp").forward(request, response);
            } else {
                
                String dbNumber = result.getNString("phone");
                if (dbNumber.equalsIgnoreCase(Number)) {
                    PreparedStatement stmt2 = con.prepareStatement("select accountNumber from bank_table where phone = ?");
                    stmt2.setString(1, Number);
                    ResultSet result2 = stmt2.executeQuery();
                     ResultSetMetaData rsmd = result2.getMetaData();
                      int columnCount = rsmd.getColumnCount();
                    ArrayList<Integer> accountList = new ArrayList<>(columnCount);
                    while(result2.next())
                     {                      
                       int accnum = result2.getInt("accountNumber");
                       accountList.add(accnum);                       
                    }
                    stmt.close();
                    stmt2.close();
           con.close();
                     HttpSession session = request.getSession();
                     session.setAttribute("status", "granted");
                     session.setAttribute("data", accountList);
                  request.getRequestDispatcher("homepage.jsp").forward(request, response);   
                  
                } else {
                    stmt.close();
           con.close();
                    request.setAttribute("state", "fail");
                    RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
                }

            }

        } catch (Exception e) {

            out.println("<h1>" + e + "</h1>");

        }

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
