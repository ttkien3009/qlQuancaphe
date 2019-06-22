package Servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import Code.Score;
import Code.UpdateScore;

@SuppressWarnings("serial")
public class UpdateScoreServlet extends HttpServlet {
	private final int maxFileSize = 50 * 1024 * 1024;
	private File file;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		@SuppressWarnings("unused")
		PrintWriter out = response.getWriter();
		DiskFileItemFactory factory = new DiskFileItemFactory();
		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setSizeMax(maxFileSize);
		String uploadPath;
		try {
			List<FileItem> fileItems = upload.parseRequest(request);
			Iterator<FileItem> i = fileItems.iterator();
			Score lt = new Score();

			FileItem fi = (FileItem) i.next();
			lt.setMaSV(fi.getString());
			System.out.println(lt.getMaSV());
			
			fi = (FileItem) i.next();
			lt.setMaMon(fi.getString());
			System.out.println(lt.getMaMon());
			
			fi = (FileItem) i.next();
			lt.setMaLop(fi.getString());
			System.out.println(lt.getMaLop());
			
			fi = (FileItem) i.next();
			lt.setDiem(Float.parseFloat(fi.getString()));
			System.out.println(lt.getDiem());
			
			

			UpdateScore update = new UpdateScore();
			if (update.authenticateUpdate(lt).equals("SUCCESS")) {
				response.sendRedirect("Admin.jsp?tmp=ListScore");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
