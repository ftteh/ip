/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package member;

import bean.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import jdbc.JDBCUtility;
/**
 *
 * @author J.Ting
 */
@WebServlet(name = "updateProfile", urlPatterns = {"/updateProfile"})
public class updateProfile extends HttpServlet{
    
  private JDBCUtility jdbcUtility;
    private Connection con;
    
 
  @Override
    public void init() 
    {
        String driver = "com.mysql.jdbc.Driver";

        String dbName = "cash";
        String url = "jdbc:mysql://localhost/" + dbName + "?";
        String userName = "root";
        String password = "";

        jdbcUtility = new JDBCUtility(driver,
                                      url,
                                      userName,
                                      password);

        jdbcUtility.jdbcConnect();
        con = jdbcUtility.jdbcGetConnection();
    }    
    
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
            {
                HttpSession session = request.getSession();
                PrintWriter out=response.getWriter();
                
                

                String fullname = request.getParameter("fullname");
                String email = request.getParameter("email");
                
                if(fullname != null || email != null)
                    updateProfile(request, response);
                
                String oldpass = request.getParameter("oldpassword");
                String newpass = request.getParameter("newpassword");
                String cnewpass = request.getParameter("cnewpassword");
        
                if(oldpass != null && newpass != null && cnewpass != null){
            // Check if 2 new password match or not. Can be done in front end but need front end UI to display maybe? 
                 if(!newpass.equals(cnewpass)){
                      session.setAttribute("passNotMatch", "New password does not match with confirm password");
                     response.sendRedirect(request.getContextPath() + "/memberprofile.jsp");  
                 }
                 else // If new password matched then call changePassword method
                     changePassword(request, response);
                  }
        // End changing password
        
        // Dispatch to view after all actions done
     //  response.sendRedirect(request.getContextPath() + "/memberprofile.jsp");  
                
                
    }
    
    
      void updateProfile(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
   {
        HttpSession session = request.getSession();
       PrintWriter out=response.getWriter();
       User user = (User)session.getAttribute("memberprofile");
       String fullname = request.getParameter("fullname");
       String email = request.getParameter("email");
       String ulogin = ((User)session.getAttribute("memberprofile")).getLogin();
       
         if(fullname == null || fullname.equals(""))
                    fullname = ((User)session.getAttribute("memberprofile")).getFullName();
          if(email == null || email .equals(""))
                     email  = ((User)session.getAttribute("memberprofile")).getEmail();
               
              String sql="UPDATE user SET fullname=?, email=? WHERE login='"+ulogin+"'";
         try{
                
                 PreparedStatement preparedStatement = con.prepareStatement(sql);
                 preparedStatement.setString(1, fullname);
                 preparedStatement.setString(2, email);
                 int row=preparedStatement.executeUpdate();
                 if(row>0)
      {
          session.setAttribute("updateProfile","Information has been updated successfully");
      }
      else
      {
           session.setAttribute("updateProfile","Information update failed");
      }
       }catch(SQLException ex){}
       
       // to reflect data changed immediately after update 
      
       user.setFullName(fullname);
       user.setEmail(email);
      
        session.setAttribute("memberprofile", user);
        response.sendRedirect(request.getContextPath() + "/memberprofile.jsp"); 
   }
     void changePassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
   {
       HttpSession session = request.getSession();
       
       String oldPass = ((User)session.getAttribute("memberprofile")).getPassword();
       String confirmOldPass = request.getParameter("oldpassword"); 
       
       // Check if old password matched or not
       if(!oldPass.equals(confirmOldPass)){
           session.setAttribute("passNotMatch", "Old password entered does not match with previous password");
            response.sendRedirect(request.getContextPath() + "/memberprofile.jsp");  
       }
       else{
            String newpass = request.getParameter("newpassword");
            String username = ((User)session.getAttribute("memberprofile")).getLogin();
            String sql1="Update user SET password=? where login=?";
            try {
                PreparedStatement preparedStatement = con.prepareStatement(sql1);
                preparedStatement.setString(1, newpass);
                preparedStatement.setString(2, username);

                preparedStatement.executeUpdate();

            }catch(SQLException ex){}

            // to reflect data changed immediately after update
            User user = (User)session.getAttribute("memberprofile");
            user.setPassword(newpass);
            session.setAttribute("memberprofile", user);
            session.setAttribute("passNotMatch", "");
            session.setAttribute("changeSuccess", "Password updated successfully!");
            response.sendRedirect(request.getContextPath() + "/memberprofile.jsp"); 
       }
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
        processRequest(request, response);
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