/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package admin;

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
import jdbc.JDBCUtility;

/**
 *
 * @author MSI
 */
@WebServlet(name = "insertUser", urlPatterns = {"/admin/insertUser"})
public class insertUser extends HttpServlet {   

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
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        //Get the session object
	HttpSession session = request.getSession();
        
        ArrayList userList = new ArrayList();  
        
        String login=request.getParameter("login");
        String password=request.getParameter("password");
        String usertype=request.getParameter("usertype");
        String fullname=request.getParameter("fullname");

        PrintWriter out=response.getWriter();
                        out.println(login);
                 out.println(password);
                 out.println(usertype);
                 out.println(fullname);
        
        String sqlInsert = "INSERT INTO user(login,password,usertype,fullname,image,email) VALUES(?, ?, ?,?,?,?)"; 
//        
        try {
            PreparedStatement preparedStatement = con.prepareStatement(sqlInsert);

            preparedStatement.setString(1, login);
            preparedStatement.setString(2, password);
            preparedStatement.setString(3, usertype);
            preparedStatement.setString(4, fullname);
            preparedStatement.setString(5, fullname);
            preparedStatement.setString(6, fullname);
            preparedStatement.executeUpdate();
     


            String sqlQuery = "SELECT * FROM user ";

            preparedStatement = con.prepareStatement(sqlQuery);
            ResultSet rs = preparedStatement.executeQuery();


            while (rs.next()) {

               login = rs.getString("login");
               password = rs.getString("password");
               usertype = rs.getString("usertype");
               fullname = rs.getString("fullname");
               String image = rs.getString("image");

                // out.println(login);
                // out.println(password);
                // out.println(usertype);
                // out.println(fullname);
                // out.println(image);

                User user = new User();
                user.setLogin(login);
                user.setPassword(password);
                user.setUserType(usertype);
                user.setFullName(fullname);
                user.setImage(image);
                userList.add(user);

            }
            

            

        }
        catch (SQLException ex) {            
        }
        session.setAttribute("userList", userList);
        response.sendRedirect(request.getContextPath() +
        "/admin/viewUser");
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
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
     * Handles the HTTP
     * <code>POST</code> method.
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
