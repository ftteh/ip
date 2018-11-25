/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package admin;

import bean.Application;
import bean.Room;
import bean.User;
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

import org.omg.CORBA.portable.ApplicationException;

import jdbc.JDBCUtility;

/**
 *
 * @author MSI
 */
@WebServlet(name = "insertApp", urlPatterns = { "/admin/insertApp" })
public class insertApp extends HttpServlet {

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

        ArrayList appList = new ArrayList();

        String id = request.getParameter("id");
        String applicant = request.getParameter("applicant");
        String approval = request.getParameter("approval");
        String room = request.getParameter("room");

        String sqlInsert = "INSERT INTO application(id,applicant,approval,room) VALUES(?, ?, ?,?)";

        try {
            PreparedStatement preparedStatement = con.prepareStatement(sqlInsert);

            preparedStatement.setString(1, id);
            preparedStatement.setString(2, applicant);
            preparedStatement.setString(3, approval);
            preparedStatement.setString(4, room);
            preparedStatement.executeUpdate();

            String sqlQuery = "SELECT * FROM application";

            preparedStatement = con.prepareStatement(sqlQuery);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                String app_id = rs.getString("id");
                String app_applicant = rs.getString("applicant");
                String app_approval = rs.getString("approval");
                String app_room = rs.getString("room");

                Application app = new Application();
                app.setId(app_id);
                app.setApplicant(app_applicant);
                app.setApproval(app_approval);
                app.setRoom(app_room);
                appList.add(app);
            }
        } catch (SQLException ex) {
        }

        session.setAttribute("appList", appList);
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
