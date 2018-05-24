<%-- 
    Document   : login.jsp
    Created on : Mar 9, 2017, 2:58:55 PM
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
                <form name="login" action="log.jsp"  method="POST">
            <table border="0">

                <tbody>
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
