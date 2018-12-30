/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package member;

import bean.User;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import jdbc.JDBCUtility;
import java.io.InputStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import javax.servlet.annotation.MultipartConfig;
import java.sql.DriverManager;
import java.io.ByteArrayOutputStream;
import java.util.Base64;
/**
 *
 * @author J.Ting
 */
@WebServlet(name = "UploadServlet", urlPatterns = {"/UploadServlet"})
@MultipartConfig(maxFileSize = 16177215) 
public class UploadServlet extends HttpServlet {
  private JDBCUtility jdbcUtility;
    private Connection con;
    String driver = "com.mysql.jdbc.Driver";

        String dbName = "cash";
        String url = "jdbc:mysql://localhost/" + dbName + "?";
        String userName = "root";
        String password = "";
    @Override
    public void init() throws ServletException
    {
        

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
  
       protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // gets values of text fields
        
        PrintWriter out=response.getWriter();
        InputStream inputStream = null; // input stream of the upload file
         
        // obtains the upload file part in this multipart request
        Part filePart = request.getPart("image");
        if (filePart != null) {
           
            // obtains input stream of the upload file
            inputStream = filePart.getInputStream();
          
        }
         
       
        String message = null;  // message will be sent back to client
        HttpSession session = request.getSession();
        
        try {
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            con = DriverManager.getConnection(url, userName, password);
            
             String ulogin = ((User)session.getAttribute("memberprofile")).getLogin();
            // constructs SQL statement
            String sql = "UPDATE user SET image=? WHERE login=?";
            PreparedStatement statement = con.prepareStatement(sql);
                        
            if (inputStream != null) {
                // fetches input stream of the upload file for the blob column
                statement.setBlob(1, inputStream);
            }
            statement.setString(2,ulogin);
            // sends the statement to the database server
            int row = statement.executeUpdate();
            if(row>0)
            {
                session.setAttribute("uploadSuccess","Image has been successfully uploaded");
            }
            else
            {
               session.setAttribute("uploadSuccess","Image failed to upload");
               response.sendRedirect(request.getContextPath()+"/memberprofile.jsp");
            }
        } catch (SQLException ex) {
            message = "ERROR: " + ex.getMessage();
            ex.printStackTrace();
        } finally {
            if (con != null) {
                // closes the database connection
                try {
                    con.close();
                } catch (SQLException ex) {
                    ex.printStackTrace();
                }
            }
            ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                byte[] buffer = new byte[4096];
                int bytesRead = -1;
                 
                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);                  
                }
                 
                byte[] imageBytes = outputStream.toByteArray();
                String base64Image = Base64.getEncoder().encodeToString(imageBytes);
                 
                 
                inputStream.close();
                outputStream.close();
            // StandardCharsets.UTF_8.name() > JDK 7
            
            User user = (User)session.getAttribute("memberprofile");
            user.setImage(base64Image);
            // sets the message in request scope
            request.setAttribute("memberprofile", user);
           
            // redirect to member profile page
            response.sendRedirect(request.getContextPath() + "/viewProfileServlet");  
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

