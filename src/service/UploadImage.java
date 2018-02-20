package service;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import service.dao;

/**
 * Servlet implementation class UploadImage
 */
@WebServlet("/UploadImage")
@MultipartConfig(maxFileSize = 16177216)
public class UploadImage extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int result = 0;
		Connection con = null;
		String name = request.getParameter("imageName");
		Part part = request.getPart("image");
		if(part != null){
			try{
				con = dao.getConnection();
			    PreparedStatement ps = con.prepareStatement("insert into Image_Table(name,image) values(?,?)");
			    InputStream is = part.getInputStream();
			    ps.setString(1, name);
			    ps.setBlob(2, is);
			    result = ps.executeUpdate();
			}
			catch(Exception e){
				e.printStackTrace();
			}	
			finally{
				if(con != null){
					try{
						con.close();
					}
					catch(Exception e){
						e.printStackTrace();
					}
				}
			}
		}
		else{
			response.sendRedirect("Error.jsp");
		}
		if(result > 0){
	    	response.sendRedirect("Gallery");
	    }
		else{
			response.sendRedirect("Error.jsp");
		}
	}
	}

