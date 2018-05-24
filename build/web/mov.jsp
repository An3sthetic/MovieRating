<%-- 
    Document   : mov
    Created on : Mar 18, 2017, 2:59:50 AM
    Author     : Anesthetic
--%>

<%@page import="java.io.InputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileInputStream"%>
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
             InputStream in = null;
             Part filepart = request.getPart("img");
             if(filepart!=null)
             {
             in=filepart.getInputStream();
             }

                dbconnect d = new dbconnect();
            PreparedStatement ps = d.ConnectDB().prepareStatement("insert into movie values(?,?,?,?,?,?)");
           
            ps.setString(1, request.getParameter("name"));
            ps.setString(2, request.getParameter("des"));
            ps.setString(3, request.getParameter("starring"));
            ps.setString(4, request.getParameter("genre"));
            ps.setBinaryStream(5, in,(int)filepart.getSize());
            ps.setString(6, request.getParameter("reldate"));

            
            
            ps.executeUpdate();
            
            
            }
        catch(Exception e)
        {
        out.println(e);
        }
        
        %>
    </body>
</html>
