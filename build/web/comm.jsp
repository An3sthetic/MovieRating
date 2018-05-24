<%-- 
    Document   : comm
    Created on : Mar 31, 2017, 4:31:46 PM
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
                                try{
                                    PreparedStatement p = new dbconnect().ConnectDB().prepareStatement("insert into comment values(?,?,?,curdate())");
                            p.setString(1, request.getParameter("mvname"));
                            p.setString(2, session.getAttribute("name").toString());
                            p.setString(3, request.getParameter("co"));
                            p.executeUpdate();
                            
                                }
                                catch(Exception e)
                                {
                                out.println(e);
                                }
                            %>
                            <p>Comment posted successfully</p>
                            <%response.setHeader("Refresh", "3;url=user.jsp");%>
    </body>
</html>
