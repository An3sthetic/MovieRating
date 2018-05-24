<%-- 
    Document   : search_cat
    Created on : Mar 31, 2017, 2:19:19 AM
    Author     : Anesthetic
--%>

<%@page import="java.util.Base64"%>
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
        <form name="search" action="search_cat.jsp" method="POST">
            <table border="0">

                <tbody>
                    <tr>
                        <td><input type="radio" name="catagory" value="Action" />Action </td>
                        <td><input type="radio" name="catagory" value="Adventure" />Adventure </td>
                        <td><input type="radio" name="catagory" value="Comedy" />Comedy </td>
                        <td><input type="radio" name="catagory" value="Fantasy" />Fantasy</td>
                    </tr>
                    <tr>
                        <td><input type="radio" name="catagory" value="Horror" />Horror</td>
                        <td><input type="radio" name="catagory" value="Mystery" />Mystery</td>
                        <td><input type="radio" name="catagory" value="Romance" />Romance</td>
                        <td><input type="radio" name="catagory" value="Sci-Fi" />Sci-Fi </td>
                    </tr>
                    <tr>
                        <td><input type="radio" name="catagory" value="Crime" />Crime   </td>
                        <td><input type="radio" name="catagory" value="Sports" />Sports </td>
                        <td><input type="radio" name="catagory" value="Supernatural" />Supernatural </td>
                        <td><input type="radio" name="catagory" value="Thriller" />Thriller </td>
                    </tr>
                </tbody>
            </table>
             <input type="submit" value="search" name="search" />
        </form>
        <%= session.getAttribute("name")%>
                    <table border="0">

                <tbody>
                    <% 
                        
                        byte[ ] imgData = null ;
                        String mname=null;
                        

                        
                        
                         try{
                         PreparedStatement ps = new dbconnect().ConnectDB().prepareStatement("select * from movie where genre=?");
                         ps.setString(1,request.getParameter("catagory"));
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
                     <td><a href="m.jsp"><% session.setAttribute("movie_name", mname);
                             %>
                             <%=mname%>
                             </a></td>
                     

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

