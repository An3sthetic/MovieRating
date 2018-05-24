<%@page import="java.util.Base64"%>
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

    </head>
    <body>
        <%String mvname=request.getParameter("mv_name");%>
        <form name="rating" action="rate.jsp" method="POST">
                    <table border="0">

                        <tbody>
                            <tr>
                                <td>    
                                    <select name="rate">
                                        <option>1</option>
                                        <option>2</option>
                                        <option>3</option>
                                        <option>4</option>
                                        <option>5</option>
                                    </select>
                                </td>
                            </tr>
                        </tbody>
                    </table>
            <input type="hidden" value="<%=mvname%>" name="mvname" />
<input type="submit" value="submit" name="submit" />
</form>

        <% 
            
            
            String a=null,b=null,c=null,d=null,f=null;
            int g=0;
            
            byte[ ] imgData = null ;
            try{
                PreparedStatement ps = new dbconnect().ConnectDB().prepareStatement("select sum(rate)/count(rate) from rate where mname=?");
                ps.setString(1, mvname);
                ResultSet rs = ps.executeQuery();
                while(rs.next())
                {
                g=rs.getInt(1);                }
            }
            catch(Exception e)
            {
            out.println(e);
            }
            try{
                PreparedStatement ps = new dbconnect().ConnectDB().prepareStatement("select * from movie where name=?");
                ps.setString(1, mvname);
                ResultSet rs = ps.executeQuery();
                while(rs.next())
                {
                a=rs.getString(1);
                b=rs.getString(2);
                c=rs.getString(3);
                d=rs.getString(4);
                f=rs.getString(6);
                imgData=rs.getBytes("img");
                String encode = Base64.getEncoder().encodeToString(imgData);
                request.setAttribute("imgBase", encode);
    


                }
            }
            catch(Exception e)
            {
            out.println(e);
            }


        %>
                <p><%=a%></p>
                <p>Viewer's Ratings:<%=g%>/5</p>
                <p><%=b%></p>
                <p>Stars:<%=c%></p>
                <p>Genre:<%=d%></p>
                <p><img src="data:image/jpeg;base64,${imgBase}" width="250" height="250"/></p>

                
                
                
    <form name="comment" action="comm.jsp" method="POST">
                    <table border="0">

                        <tbody>
                            <tr>
                                <td><%=session.getAttribute("name")%><input type="hidden" value="<%=mvname%>" name="mvname" /></td>
                                <td><textarea name="co" rows="5" cols="110">
                                    </textarea></td>
                                    <td><input type="submit" value="comment" name="submit" /></td>
                            </tr>
                        </tbody>
                        
                    </table>

                </form>
                

                
                            <%
                            String comment=null,user=null,dt=null;
                            try{
                            PreparedStatement ps = new dbconnect().ConnectDB().prepareStatement("select * from comment where mname=?");
                            ps.setString(1, mvname);
                            ResultSet rs = ps.executeQuery();
                            
                            while(rs.next())
                            {
                            comment=rs.getString("comm");
                            user=rs.getString("username");
                            dt=rs.getString("date");
                            %>
<table border="0">

                        <tbody>
                            <tr>
                                <td><%=rs.getString("comm")%></td>
                                <td><%=rs.getString("username")%></td>
                                <td><%=rs.getString("date")%></td>
                            </tr>
                        </tbody>
                        
                    </table>
                            <%
                            }
                            PreparedStatement p = new dbconnect().ConnectDB().prepareStatement("select * from comment where mname=?");
                            p.setString(1, mvname);
                            ResultSet r = p.executeQuery();
                            if(r.next())
                            {
                            }

                            else
                            {%>
                            <p>No one commented yet</p>
                            <%}
}
catch(Exception e)
{
out.println(e);
}

                            %>

                            


    </body>
</html>
