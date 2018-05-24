package mov;


import java.sql.Connection;
import java.sql.DriverManager;



public class dbconnect
{
        private static final long serialVersionUID = 1L;
    Connection conn=null;
    public Connection ConnectDB(){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn=DriverManager.getConnection("jdbc:mysql://localhost/movierating","root","");
            return conn;
        }
        catch(Exception e){
            System.err.println(e);
        return null;
        }
    }
}
