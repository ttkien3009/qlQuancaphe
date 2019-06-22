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

import Code.duongdan;
import Code.Student;

@SuppressWarnings("serial")
public class AddStudentServlet extends HttpServlet{
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
			Student lt = new Student();

			FileItem fi = (FileItem) i.next();
			lt.setMaSV(fi.getString());
			System.out.println(lt.getMaSV());

			fi = (FileItem) i.next();
			String HoTen = URLEncoder.encode(fi.getString(), "ISO-8859-1");
			HoTen = URLDecoder.decode(HoTen, "UTF-8");
			lt.setHoTen(HoTen);
			System.out.println(HoTen);
			
			fi = (FileItem) i.next();
			String Phai = URLEncoder.encode(fi.getString(), "ISO-8859-1");
			Phai = URLDecoder.decode(Phai, "UTF-8");
			lt.setPhai(Phai);
			System.out.println(Phai);
			
			fi = (FileItem) i.next();
			lt.setNgaySinh(fi.getString());
			System.out.println(lt.getNgaySinh());

			
			fi = (FileItem) i.next();
			String QueQuan = URLEncoder.encode(fi.getString(), "ISO-8859-1");
			QueQuan = URLDecoder.decode(QueQuan, "UTF-8");
			lt.setQueQuan(QueQuan);
			System.out.println(QueQuan);

			
			fi = (FileItem) i.next();
			lt.setCMND(fi.getString());
			System.out.println(lt.getCMND());

			
			fi = (FileItem) i.next();
			lt.setSoDienThoai(fi.getString());
			System.out.println(lt.getSoDienThoai());

			
			fi = (FileItem) i.next();
			String khoa = URLEncoder.encode(fi.getString(), "ISO-8859-1");
			khoa = URLDecoder.decode(khoa, "UTF-8");
			lt.setKhoa(khoa);
			System.out.println(khoa);
			
			fi = (FileItem) i.next();
			String nghanh = URLEncoder.encode(fi.getString(), "ISO-8859-1");
			nghanh = URLDecoder.decode(nghanh, "UTF-8");
			lt.setNghanh(nghanh);
			System.out.println(nghanh);
			
			fi = (FileItem) i.next();
			String tinhtrang = URLEncoder.encode(fi.getString(), "ISO-8859-1");
			tinhtrang = URLDecoder.decode(tinhtrang, "UTF-8");
			lt.setTinhTrang(tinhtrang);
			System.out.println(tinhtrang);
			
			fi = (FileItem) i.next();
			lt.setTinChiDaHoc(Integer.parseInt(fi.getString()));
			System.out.println(lt.getTinChiDaHoc());

			
			fi = (FileItem) i.next();
			lt.setTinChiDangNo(Integer.parseInt(fi.getString()));
			System.out.println(lt.getTinChiDangNo());

			
			fi = (FileItem) i.next();
			lt.setEmail(fi.getString());
			System.out.println(lt.getEmail());

			while (i.hasNext()) {
				fi = (FileItem) i.next();
				if (!fi.isFormField()) {
					String fileName = fi.getName();
					lt.setHinhSV(fileName);
					file = new File("");
					uploadPath = getServletContext().getRealPath("") + File.separator + "/src/main/webapp/Upload/"
							+ fileName;
					uploadPath = duongdan.Duongdan(uploadPath);
					System.out.println(uploadPath);
					file = new File(uploadPath);
					fi.write(file);
				}
			}
			System.out.println("picture\n" + lt.getHinhSV());
			if (lt.Save()) {
				response.sendRedirect("Admin.jsp?tmp=ListStudent");
			} else {
				response.sendRedirect("index.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
