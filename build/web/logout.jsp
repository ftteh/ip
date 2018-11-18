<%-- 
    Document   : logout
    Created on : Nov 5, 2014, 2:25:54 PM
    Author     : tft
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 
    session.invalidate();
    response.sendRedirect("/cash/terminate.html"); 
%>
