

<%@page import="java.sql.ResultSet"%>
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
            String mvname=request.getParameter("mvname");
            String rate=request.getParameter("rate");
            String uname=session.getAttribute("name").toString();
            try{
            PreparedStatement ps = new dbconnect().ConnectDB().prepareStatement("select * from rate where mname=? and username=?");
            ps.setString(1, mvname);
            ps.setString(2,uname);
            ResultSet rs =ps.executeQuery();
            if(rs.next())
            {
            PreparedStatement p = new dbconnect().ConnectDB().prepareStatement("update rate set rate=? where mname=? and username=?");
            p.setString(2,mvname);
            p.setString(1, rate);
            p.setString(3,uname);
            p.executeUpdate();
            response.setHeader("Refresh", "3;url="+request.getHeader("referer"));            
            }
            else
            {
            PreparedStatement p = new dbconnect().ConnectDB().prepareStatement("insert into rate values(?,?,?)");
            p.setString(1,mvname);
            p.setString(2, rate);
            p.setString(3,uname);
            p.executeUpdate();
            response.setHeader("Refresh", "3;url=user.jsp");
            }
            }
            catch(Exception e)
            {
            out.println(e);
            }
        
        %>
    </body>
</html>
