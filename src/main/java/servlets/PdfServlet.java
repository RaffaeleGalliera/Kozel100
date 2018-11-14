package servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.OutputStream;

import static global.Constants.LOG_DIR;

@WebServlet("/getPdf")
public class PdfServlet extends HttpServlet {




    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        String filename = "companies.pdf";
        String filepath = LOG_DIR;

        response.setStatus(200);
        response.setContentType("application/pdf; name=\"" + filename + "\"");
        response.setHeader("Content-Disposition","inline; filename=\"" + filename + "\"");

        int i;
        byte[] buffer = new byte[1048];

        java.io.FileInputStream fileInputStream=new java.io.FileInputStream(filepath + filename);

        while ((i=fileInputStream.read(buffer)) != -1) {

            response.getOutputStream().write(buffer,0,i);
        }

        fileInputStream.close();


    }

}