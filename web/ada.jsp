<%-- 
    Document   : ada
    Created on : Mar 18, 2017, 3:39:26 AM
    Author     : Anesthetic
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form name="ada" action="addmin.jsp"  method="POST">
            <table border="0">

                <tbody>
                    <tr>
                        <td>UseId: </td>
                        <td><input type="text" name="id" value="" size="50" /></td>
                    </tr>
                    <tr>
                        <td>Username: </td>
                        <td><input type="text" name="name" value="" size="50" /></td>
                    </tr>
                    <tr>
                        <td>Email: </td>
                        <td><input type="text" name="mail" value="" size="50" /></td>
                    </tr>
                    <tr>
                        <td>Password:</td>
                        <td><input type="text" name="pass" value="" size="50" /></td>
                    </tr>
                    
                </tbody>
            </table>
            <input type="reset" value="Clear" name="Clear"/>
            <input type="submit" value="Submit" name="Submit"/>
        </form>
    </body>
</html>
