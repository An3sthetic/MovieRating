<%-- 
    Document   : addmin
    Created on : Mar 18, 2017, 3:38:38 AM
    Author     : Anesthetic
--%>

<%@page import="java.sql.PreparedStatement"%>
<%@page import="mov.dbconnect"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% 
        
        try
            {
                dbconnect d = new dbconnect();
            PreparedStatement ps = d.ConnectDB().prepareStatement("insert into user values(?,?,?,?,?)");
            ps.setString(1, request.getParameter("id"));
            ps.setString(2, request.getParameter("name"));
            ps.setString(3, request.getParameter("mail"));
            ps.setString(4, request.getParameter("pass"));
            ps.setString(5, "admin");


            
            
            ps.executeUpdate();
            
            
            }
        catch(Exception e)
        {
        out.println(e);
        }
        response.setHeader("Refresh", "3;url=admin.jsp");
        %>
        <p> successfully added</p>
    </body>
</html>
