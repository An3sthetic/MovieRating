
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.Random"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form name="registration" action="reg.jsp"  method="POST">
            <table border="0">

                <tbody>
                    <tr>
                        <td>Id: </td>
                        <td><input type="text" name="id" value="" size="50" /></td>
                    </tr>
                    <tr>
                        <td>Name: </td>
                        <td><input type="text" name="name" value="" size="50" /></td>
                    </tr>
                    <tr>
                        <td>Email:</td>
                        <td><input type="text" name="email" value="" size="50" /></td>
                    </tr>
                    <tr>
                        <td>Password:</td>
                        <td><input type="password" name="pass" value="" size="50" /></td>
                    </tr>
                </tbody>
            </table>
            <input type="reset" value="Clear" name="Clear"/>
            <input type="submit" value="Submit" name="Submit"/>
        </form>
        
       
        
        
    </body>
</html>
