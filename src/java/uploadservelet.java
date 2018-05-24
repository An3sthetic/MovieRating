

import com.sun.corba.se.spi.presentation.rmi.StubAdapter;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import static java.lang.System.out;
import mov.dbconnect;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet(("/uploadservelet"))
@MultipartConfig(maxFileSize = 16177215)
public class uploadservelet extends HttpServlet
{
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter())
        {
            
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet uploadservelet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet uploadservelet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
        processRequest(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {
       String name=request.getParameter("name");
       String des=request.getParameter("des");
       String starring=request.getParameter("starring");
       String genre=request.getParameter("genre");
       String reldate=request.getParameter("reldate");
        InputStream inputStream = null; 
         
        
        Part filePart = request.getPart("img");
        if (filePart != null) {
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());
            inputStream = filePart.getInputStream();
        }
        
        try
        {
            PreparedStatement ps= new dbconnect().ConnectDB().prepareStatement("insert into movie values(?,?,?,?,?,?)");
            ps.setString(1, name);
            ps.setString(2, des);
            ps.setString(3, starring);
            ps.setString(4, genre);
            ps.setBlob(5, inputStream);
            ps.setString(6, reldate);
            ps.executeUpdate();
            
        }
        catch(Exception e)
        {
        out.println(e);
        }
        PrintWriter out = response.getWriter();
        out.println("successfully added");
        response.setHeader("Refresh", "3;url=adm.jsp");
    }


    @Override
    public String getServletInfo()
    {
        return "Short description";
    }// </editor-fold>

}
