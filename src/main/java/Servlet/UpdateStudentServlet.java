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
import Code.UpdateStudent;

@SuppressWarnings("serial")
public class UpdateStudentServlet extends HttpServlet {
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
			/*String HoTen = URLEncoder.encode(fi.getString(), "ISO-8859-1");
			HoTen = URLDecoder.decode(HoTen, "UTF-8");*/
			lt.setHoTen(fi.getString());
			System.out.println(lt.getHoTen());
			
			fi = (FileItem) i.next();
			/*String Phai = URLEncoder.encode(fi.getString(), "ISO-8859-1");
			Phai = URLDecoder.decode(Phai, "UTF-8");*/
			lt.setPhai(fi.getString());
			System.out.println(lt.getPhai());
			
			fi = (FileItem) i.next();
			lt.setNgaySinh(fi.getString());
			System.out.println(lt.getNgaySinh());

			
			fi = (FileItem) i.next();
			/*String QueQuan = URLEncoder.encode(fi.getString(), "ISO-8859-1");
			QueQuan = URLDecoder.decode(QueQuan, "UTF-8");*/
			lt.setQueQuan(fi.getString());
			System.out.println(lt.getQueQuan());

			
			fi = (FileItem) i.next();
			lt.setCMND(fi.getString());
			System.out.println(lt.getCMND());

			
			fi = (FileItem) i.next();
			lt.setSoDienThoai(fi.getString());
			System.out.println(lt.getSoDienThoai());

			
			fi = (FileItem) i.next();
			/*String khoa = URLEncoder.encode(fi.getString(), "ISO-8859-1");
			khoa = URLDecoder.decode(khoa, "UTF-8");*/
			lt.setKhoa(fi.getString());
			System.out.println(lt.getKhoa());
			
			fi = (FileItem) i.next();
			/*String nghanh = URLEncoder.encode(fi.getString(), "ISO-8859-1");
			nghanh = URLDecoder.decode(nghanh, "UTF-8");*/
			lt.setNghanh(fi.getString());
			System.out.println(lt.getNghanh());
			
			fi = (FileItem) i.next();
			/*String tinhtrang = URLEncoder.encode(fi.getString(), "ISO-8859-1");
			tinhtrang = URLDecoder.decode(tinhtrang, "UTF-8");*/
			lt.setTinhTrang(fi.getString());
			System.out.println(lt.getTinhTrang());
			
			fi = (FileItem) i.next();
			lt.setTinChiDaHoc(Integer.parseInt(fi.getString()));
			System.out.println(lt.getTinChiDaHoc());

			
			fi = (FileItem) i.next();
			lt.setTinChiDangNo(Integer.parseInt(fi.getString()));
			System.out.println(lt.getTinChiDangNo());

			
			fi = (FileItem) i.next();
			/*String hanhkiem = URLEncoder.encode(fi.getString(), "ISO-8859-1");
			hanhkiem = URLDecoder.decode(hanhkiem, "UTF-8");*/
			lt.setEmail(fi.getString());
			System.out.println(lt.getEmail());
			
			while (i.hasNext()) {
				fi = (FileItem) i.next();
				if (!fi.isFormField()) {
					String fileName = fi.getName();
					lt.setHinhSV(fileName);
					System.out.println(fileName);
					file = new File("");
					uploadPath = getServletContext().getRealPath("") + File.separator + "src/main/webapp/Upload/"
							+ fileName;
					System.out.println(uploadPath);
					uploadPath = duongdan.Duongdan(uploadPath);
					System.out.println(uploadPath);
					file = new File(uploadPath);
					fi.write(file);
				}
			}
			System.out.println("picture\n" + lt.getHinhSV());
			UpdateStudent update = new UpdateStudent();
			if (update.authenticateUpdate(lt).equals("SUCCESS")) {
				response.sendRedirect("Admin.jsp?tmp=ListStudent");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
