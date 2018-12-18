/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package admin;

import bean.Application;
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
@WebServlet(name = "updateApp", urlPatterns = { "/updateApp" })
public class updateApp extends HttpServlet {

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

        // get form data from VIEW > V-I
        String approval = request.getParameter("approval");
        String id = request.getParameter("id");
        String applicant = request.getParameter("applicant");
        PrintWriter out = response.getWriter();
        String ownedRoom="";

        String sqlUpdate = "UPDATE application SET approval= ? WHERE id = ?";

        try {
            PreparedStatement preparedStatement = con.prepareStatement(sqlUpdate);
            preparedStatement.setString(1, approval);
            preparedStatement.setString(2, id);
            preparedStatement.executeUpdate();
        } catch (SQLException ex) {
        }
        ArrayList appList = new ArrayList();
        ArrayList<String> upId = new ArrayList<String>();

        String sqlQuery = "SELECT * FROM application where applicant= ?";
        try {
            PreparedStatement preparedStatement = con.prepareStatement(sqlQuery);
            preparedStatement.setString(1, applicant);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {

                id = rs.getString("id");
                applicant = rs.getString("applicant");
                approval = rs.getString("approval");
                String room = rs.getString("room");
                if(approval.equals("approved"))
                    ownedRoom=rs.getString("room");

                Application application = new Application();
                application.setId(id);
                application.setApplicant(applicant);
                application.setApproval(approval);
                application.setRoom(room);
                appList.add(application);
                upId.add(id);

            }
        } catch (SQLException ex) {
        }
        if (request.getParameter("approval").equals("approved")) {
            for (String i : upId) {
                if (!i.equals(request.getParameter("id"))) {
                    sqlUpdate = "UPDATE application SET approval= ? WHERE id = ?";

                    try {
                        PreparedStatement preparedStatement = con.prepareStatement(sqlUpdate);
                        preparedStatement.setString(1, "rejected");
                        preparedStatement.setString(2, i);
                        preparedStatement.executeUpdate();
                    } catch (SQLException ex) {
                    }
                }
            }
            sqlUpdate = "UPDATE room SET status= ? WHERE rid = ?"; 
        
            try {
                PreparedStatement preparedStatement = con.prepareStatement(sqlUpdate);
                preparedStatement.setString(1, "owned");
                preparedStatement.setString(2, ownedRoom);
                preparedStatement.executeUpdate();
            }
            catch (SQLException ex) {            
            }
        }
        appList = new ArrayList();

        sqlQuery = "SELECT * FROM application";
        try {
            PreparedStatement preparedStatement = con.prepareStatement(sqlQuery);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {

                id = rs.getString("id");
                applicant = rs.getString("applicant");
                approval = rs.getString("approval");
                String room = rs.getString("room");

                Application application = new Application();
                application.setId(id);
                application.setApplicant(applicant);
                application.setApproval(approval);
                application.setRoom(room);
                appList.add(application);
                upId.add(id);

            }
        } catch (SQLException ex) {
        }

        session.setAttribute("appList", appList);

        response.sendRedirect(request.getContextPath() + "/admin/viewapp.jsp");
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
