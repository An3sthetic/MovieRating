

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="mov.*" %>
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
            String pass =request.getParameter("pass");
            
            String temp_pass=null;
            String temp_priv=null;

        
            try
            {
            dbconnect d = new dbconnect();
            PreparedStatement ps = d.ConnectDB().prepareStatement("select * from user where email=?");
            ps.setString(1, mail);
            ResultSet rs= ps.executeQuery();
            
            if(rs.next())
            {
                temp_pass=rs.getString(4);
                temp_priv=rs.getString(5);
            }
            else{
           out.println("You are not registered");
           response.setHeader("Refresh", "3;url=register.jsp"); 
            }
            
             if(temp_pass.equals(pass) && temp_priv.equals("user"))
            {
                
                session.setAttribute("name", rs.getString(2));
                out.println("hello "+rs.getString(2));
                session.setMaxInactiveInterval(900);
                response.setHeader("Refresh", "3;url=user.jsp"); 
            }
            else if(temp_pass.equals(pass) && temp_priv.equals("admin"))
            {
                session.setAttribute("name", rs.getString(2));
                out.println("hello "+rs.getString(2));
                response.setHeader("Refresh", "3;url=admin.jsp"); 
            }
            else
            {
                out.println("Incorrect password");
                
                response.setHeader("Refresh", "3;url=login.jsp"); 
            }
            
            }
        catch(Exception e)
        {
        out.println(e);
        }
        %>
        
       
        
    </body>
</html>
