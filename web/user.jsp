

<%@page import="java.util.Base64"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="mov.dbconnect"%>
<%@page import="java.sql.PreparedStatement"%>
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
            <input type="text" name="movie_name" value="" size="250" />
            <input type="submit" value="search" name="search" />
            <p><a href="search_cat.jsp">Advanced search</a></p>
        </form>
        
        <%= session.getAttribute("name")%>
                    <table border="0">

                <tbody>
                    <% 
//                        session.setAttribute("movie_name", null);
//                        out.println(session.getAttribute("movie_name").toString());
                        Blob image;
                        byte[ ] imgData = null ;
                        String mname=null;
                        String sql=null;

                        OutputStream o; 
                        
                         try{
                         PreparedStatement ps = new dbconnect().ConnectDB().prepareStatement("select * from movie");
                         ResultSet rs = ps.executeQuery();
                         
                         while(rs.next())
                         {
                             
                        imgData=rs.getBytes("img");
                        mname=rs.getString("name");
                       String encode = Base64.getEncoder().encodeToString(imgData);
                        request.setAttribute("imgBase", encode);
                     %>
                     <tr>
                     <td> <img src="data:image/jpeg;base64,${imgBase}" width="100" height="100"/></td>
                     <td><form name="mv" action="m.jsp" method="POST">
                             <input type="hidden" value="<%=mname%>" name="mv_name" />
                             <a><input type="submit" value="<%=mname%>" name="submit" class="linkButton"/></a>
                             
                         </form></td>
                     

                    </tr>
                         <%}
                                 }
                     catch(Exception e)
                     {
                     out.print(e);
                     }
                     %> 

                    
                </tbody>
            </table>
    </body>
</html>
