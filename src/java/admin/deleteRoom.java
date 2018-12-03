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
@WebServlet(name = "deleteRoom", urlPatterns = { "/admin/deleteRoom" })
public class deleteRoom extends HttpServlet {

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

        String rid = request.getParameter("rid");
        String sqlUpdate = "DELETE FROM room WHERE rid = ?";
        try {
            PreparedStatement preparedStatement = con.prepareStatement(sqlUpdate);
            preparedStatement.setString(1, rid);
            preparedStatement.executeUpdate();

            String sqlQuery = "SELECT * FROM room";

            preparedStatement = con.prepareStatement(sqlQuery);
            ResultSet rs = preparedStatement.executeQuery();

            PrintWriter out = response.getWriter();

            while (rs.next()) {


                rid = rs.getString("rid");
                String status = rs.getString("status");
                String fm = rs.getString("fm");
                String type = rs.getString("type");
                String college = rs.getString("college");
                String price = rs.getString("price");

                Room room = new Room();
                room.setRid(rid);
                room.setStatus(status);
                room.setFm(fm);
                room.setType(type);
                room.setCollege(college);
                room.setPrice(price);
                roomList.add(room);

            }
        } catch (SQLException ex) {
        }

        session.setAttribute("roomList", roomList);
        response.sendRedirect(request.getContextPath() + "/admin/viewroom.jsp");

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
