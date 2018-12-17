/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package member;

import bean.Application;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import jdbc.JDBCUtility;

/**
 *
 * @author WanYong
 */
@WebServlet(name = "ApplicationServlet", urlPatterns = {"/ApplicationServlet"})
public class ApplicationServlet extends HttpServlet {

    private JDBCUtility jdbcUtility;
    private Connection con;
    
    public void init() throws ServletException
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
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        //get form data from VIEW > V-I
        String applicant = request.getParameter("login");
        String roomId = request.getParameter("roomid");
             
        String sqlInsert = "INSERT INTO application(applicant, approval, room, bookingdate) VALUES(?, 'pending', ?, NOW())"; 
 
        
        try {
            PreparedStatement preparedStatement = con.prepareStatement(sqlInsert);
            preparedStatement.setString(1, applicant);
            preparedStatement.setString(2, roomId);
            preparedStatement.executeUpdate();
            
            //get symbol using id
            String sqlQuery = "SELECT * FROM room WHERE rid = ?";            
            preparedStatement = con.prepareStatement(sqlQuery);
            preparedStatement.setString(1, roomId);
            ResultSet rs = preparedStatement.executeQuery();
            
            String college = "";
            String type = "";
            String gender = "";
            String price = "";

            while (rs.next()) {
                college = rs.getString("college");
                type = rs.getString("type");
                gender = rs.getString("fm");
                price = rs.getString("price");
            }
            
            Application app = new Application();
            app.setApproval("pending");
            app.setRoom(roomId);
            app.setCollege(college);
            app.setGender(gender);
            app.setType(type);            
            app.setPrice(price);
            
            HttpSession session = request.getSession();
            session.setAttribute("app", app);            
            response.sendRedirect(request.getContextPath() + "/appstatus.jsp");
        }
        catch (SQLException ex) {
            ex.printStackTrace();
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
