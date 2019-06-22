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

import Code.Subject;

@SuppressWarnings("serial")
public class AddSubjectServlet extends HttpServlet{
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
			Subject lt = new Subject();

			FileItem fi = (FileItem) i.next();
			lt.setMaLop(fi.getString());
			System.out.println(lt.getMaLop());
			
			fi = (FileItem) i.next();
			lt.setMaMon(fi.getString());
			System.out.println(lt.getMaMon());

			fi = (FileItem) i.next();
			String TenMon = URLEncoder.encode(fi.getString(), "ISO-8859-1");
			TenMon = URLDecoder.decode(TenMon, "UTF-8");
			lt.setTenMon(TenMon);
			System.out.println(TenMon);
			
			fi = (FileItem) i.next();
			lt.setSoTinChi(Integer.parseInt(fi.getString()));
			System.out.println(lt.getSoTinChi());
			
			fi = (FileItem) i.next();
			String GiangVien = URLEncoder.encode(fi.getString(), "ISO-8859-1");
			GiangVien = URLDecoder.decode(GiangVien, "UTF-8");
			lt.setGiangVien(GiangVien);
			System.out.println(GiangVien);
			
			fi = (FileItem) i.next();
			lt.setCa(Integer.parseInt(fi.getString()));
			System.out.println(lt.getCa());
			
			fi = (FileItem) i.next();
			lt.setThu(Integer.parseInt(fi.getString()));
			System.out.println(lt.getThu());
			
			fi = (FileItem) i.next();
			lt.setPhong(fi.getString());
			System.out.println(lt.getPhong());
			
			fi = (FileItem) i.next();
			lt.setThoiGianBatDau(fi.getString());
			System.out.println(lt.getThoiGianBatDau());
			
			fi = (FileItem) i.next();
			lt.setThoiGianKetThuc(fi.getString());
			System.out.println(lt.getThoiGianKetThuc());
			
			if (lt.Save()) {
				response.sendRedirect("Admin.jsp?tmp=ListSubject");
			} else {
				response.sendRedirect("index.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
