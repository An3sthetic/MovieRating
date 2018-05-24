
<%@page import="mov.dbconnect"%>
<%@page import="javax.mail.MessagingException"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.PasswordAuthentication"%>
<%@page import="javax.mail.Session"%>
<%@page import="java.util.Properties"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.util.Random"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        

          
         <%
        
            String mail = request.getParameter("email");
            String name =request.getParameter("name");
            String id=request.getParameter("id");
            

        
            try
            {
                dbconnect d = new dbconnect();
            PreparedStatement ps = d.ConnectDB().prepareStatement("insert into user values(?,?,?,?,?)");
            ps.setString(1, id);
            ps.setString(2, name);
            ps.setString(3,mail);
            ps.setString(4, request.getParameter("pass"));

            ps.setString(5, "user");
            
            ps.executeUpdate();
            
            
            }
        catch(Exception e)
        {
        out.println(e);
        }
        %>
        
        <p> registration successful </p>
        <% response.setHeader("Refresh", "5;url=login.jsp"); %>

    </body>
</html>
