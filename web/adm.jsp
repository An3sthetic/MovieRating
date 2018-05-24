<%-- 
    Document   : adm
    Created on : Mar 13, 2017, 7:58:12 AM
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
        <form name="adm" action="uploadservelet" method="POST" enctype="multipart/form-data">
            <table border="0">

                <tbody>
                    <tr>
                        <td>Name: </td>
                        <td><input type="text" name="name" value="" size="50" /></td>
                    </tr>
                    <tr>
                        <td>Description:</td>
                        <td><textarea name="des" rows="5" cols="110"> </textarea></td>
                    </tr>
                    <tr>
                        <td>Starring:</td>
                        <td><input type="text" name="starring" value="" size="50" /></td>
                    </tr>
                    <tr>
                        <td>Genre:</td>
                        <td><input type="text" name="genre" value="" size="50" /></td>
                    </tr>
                    <tr>
                        <td>Image:</td>
                        <td><input type="file" name="img"/></td>
                    </tr>
                    <tr>
                        <td>Release Date:</td>
                        <td><input type="date" name="reldate"/></td>
                    </tr>
                </tbody>
            </table>
            <input type="reset" value="Clear" name="Clear"/>
            <input type="submit" value="Submit" name="Submit"/>
        </form>
    </body>
</html>
