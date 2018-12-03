/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package admin;

import bean.Room;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import jdbc.JDBCUtility;

/**
 *
 * @author MSI
 */
@WebServlet(name = "insertRoom", urlPatterns = { "/admin/insertRoom" })
public class insertRoom extends HttpServlet {

    private JDBCUtility jdbcUtility;
    private Connection con;

    public void init() throws ServletException {
        String driver = "com.mysql.jdbc.Driver";

        String dbName = "cash";
        String url = "jdbc:mysql://localhost/" + dbName + "?";
        String userName = "root";
        String password = "";

        jdbcUtility = new JDBCUtility(driver, url, userName, password);

        jdbcUtility.jdbcConnect();
        con = jdbcUtility.jdbcGetConnection();
    }

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get the session object
        HttpSession session = request.getSession();

        ArrayList roomList = new ArrayList();

        // get form data from VIEW > V-I
        String rid = request.getParameter("rid");
        String status = request.getParameter("status");
        String fm = request.getParameter("fm");
        String type = request.getParameter("type");
        String college = request.getParameter("college");
        String price = request.getParameter("price");


        String sqlInsert = "INSERT INTO Room(rid,status,fm,type,college,price) VALUES(?, ?, ?,?,?,?)";
        
        try {
            PreparedStatement preparedStatement = con.prepareStatement(sqlInsert);
            preparedStatement.setString(1, rid);
            preparedStatement.setString(2, status);
            preparedStatement.setString(3, fm);
            preparedStatement.setString(4, type);
            preparedStatement.setString(5, college);
            preparedStatement.setString(6, price);
            preparedStatement.executeUpdate();

            String sqlQuery = "SELECT * FROM room ";

            preparedStatement = con.prepareStatement(sqlQuery);
            ResultSet rs = preparedStatement.executeQuery();
            PrintWriter out=response.getWriter();

            while (rs.next()) {
                String room_rid = rs.getString("rid");
                String room_status = rs.getString("status");
                String room_fm = rs.getString("fm");
                String room_type = rs.getString("type");
                String room_college = rs.getString("college");
                String room_price = rs.getString("price");



                // out.println(room_rid );
                // out.println(room_status );
                // out.println(room_fm );
                // out.println(room_type );
                // out.println(room_college );
                // out.println(room_price );

                Room room  = new Room();
                room.setRid(room_rid);
                room.setStatus(room_status);
                room.setFm(room_fm);
                room.setType(room_type);
                room.setCollege(room_college);
                room.setPrice(room_price);
                roomList.add(room);
            }
        } catch (SQLException ex) {
        }
        
        session.setAttribute("roomList", roomList);
        response.sendRedirect(request.getContextPath() +
        "/admin/addtobackend.jsp");

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the
    // + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
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
