<%-- 
    Document   : users
    Created on : Mar 31, 2017, 1:17:07 AM
    Author     : Anesthetic
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="mov.dbconnect"%>
<%@page import="java.util.Base64"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.Blob"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
                <style> .linkButton { 
     background: none;
     border: none;
     color: #0066ff;
     text-decoration: underline;
     cursor: pointer; 
}</style>
    </head>
    <body>
        <form name="search" action="users.jsp" method="POST">
            
            <input type="text" name="movie_name" value="" size="50" />
            
            <input type="submit" value="search" name="search" />
            <p><a href="search_cat.jsp">Advanced search</a></p>
        </form>
        
       <%= session.getAttribute("name")%>
                    <table border="0">

                <tbody>
                    <% 
                        
                        byte[ ] imgData = null ;
                        String mname=null;
                         try{
                         PreparedStatement ps = new dbconnect().ConnectDB().prepareStatement("select * from movie where name=?");
                         ps.setString(1,request.getParameter("movie_name"));
                         ResultSet rs = ps.executeQuery();
                         
                         while(rs.next())
                         {
                             
                        imgData=rs.getBytes("img");
                        mname=rs.getString("name");
                       String encode = Base64.getEncoder().encodeToString(imgData);
                        request.setAttribute("imgBase", encode);
                        request.setAttribute("movie_name", mname);
                     %>
                     <tr>
                     <td> <img src="data:image/jpeg;base64,${imgBase}" alt="<%=mname%>" width="100" height="100"/></td>
                     <td><form name="mv" action="m.jsp" method="POST">
                             <input type="hidden" value="<%=mname%>" name="mv_name" />
                             <a><input type="submit" value="<%=mname%>" name="submit" class="linkButton"/></a>
                             
                         </form></td>
                     

                    </tr>
                </tbody>
                    </table>
                         <%}
                                 }
                     catch(Exception e)
                     {
                     out.print(e);
                     }
                     %> 

                    
    </body>
</html>
