package Servlet;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Code.DBConnection;
import Code.MonDK;

public class CheckoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String taikhoan = request.getParameter("TaiKhoan");
		String mamon = "";
		String malop = "";
		String sotinchi = "";
		String ca = "";
		String thu = "";
		String phong = "";
		String thoigianbatdau = "";
		String thoigianketthuc = "";

		int total = 0;

		HttpSession session_listSubject_MaMon = request.getSession();
		HttpSession session_listSubject_MaLop = request.getSession();
		HttpSession session_listSubject_SoTinChi = request.getSession();
		HttpSession session_listSubject_Ca = request.getSession();
		HttpSession session_listSubject_Thu = request.getSession();
		HttpSession session_listSubject_Phong = request.getSession();
		HttpSession session_listSubject_ThoiGianBatDau = request.getSession();
		HttpSession session_listSubject_ThoiGianKetThuc = request.getSession();

		mamon = session_listSubject_MaMon.getAttribute("mamon").toString();
		malop = session_listSubject_MaLop.getAttribute("malop").toString();
		sotinchi = session_listSubject_SoTinChi.getAttribute("sotinchi").toString();
		ca = session_listSubject_Ca.getAttribute("ca").toString();
		thu = session_listSubject_Thu.getAttribute("thu").toString();
		phong = session_listSubject_Phong.getAttribute("phong").toString();
		thoigianbatdau = session_listSubject_ThoiGianBatDau.getAttribute("thoigianbatdau").toString();
		thoigianketthuc = session_listSubject_ThoiGianKetThuc.getAttribute("thoigianketthuc").toString();

		String pattern = "yyyy/MM/dd HH:mm:ss";
		DateFormat df = new SimpleDateFormat(pattern);
		Date today = Calendar.getInstance().getTime();
		String ngay = df.format(today);
		// String masv = request.getParameter("TaiKhoan");
		int hi = 0;
		int ha = 0;

		MonDK sc = new MonDK();

		/*
		 * try { //madk = sc.getCount() + 1; } catch (ClassNotFoundException e1) { //
		 * TODO Auto-generated catch block e1.printStackTrace(); } catch (SQLException
		 * e1) { System.out.println("Không đếm được số môn học"); e1.printStackTrace();
		 * }
		 */

		String[] array_mamon = mamon.split(";");
		String[] array_malop = malop.split(";");
		String[] array_sotinchi = sotinchi.split(";");
		String[] array_ca = ca.split(";");
		String[] array_thu = thu.split(";");
		String[] array_phong = phong.split(";");
		String[] array_thoigianbatdau = thoigianbatdau.split(";");
		String[] array_thoigianketthuc = thoigianketthuc.split(";");

		int i;
		Connection con = null;
		PreparedStatement preparedStatement = null;

		int check = 1;

		Statement statement = null;
		ResultSet resultSet = null;
		String MaMon = "";
		String MaSV = "";

		con = DBConnection.createConnection();
		String emailSV = null;
		String sv = null;

		String query = "SELECT MaSV,Email FROM SinhVien";
		try {
			statement = con.createStatement();
			resultSet = statement.executeQuery(query);
			while (resultSet.next()) {
				sv = resultSet.getString("MaSV");
				if (taikhoan.equals(sv)) {
					emailSV = resultSet.getString("Email");
					break;
				}
			}
		} catch (SQLException e1) {
			System.out.println("Không chạy đc câu lệnh lấy email");
			e1.printStackTrace();
		}
		try {
			System.out.println("Email: " + emailSV);

			resultSet = statement.executeQuery("select * from lichhocsv");

			while (resultSet.next()) {
				MaMon = resultSet.getString("MaMon");
				MaSV = resultSet.getString("MaSV");
				if (MaMon.equals("MaMon") == true && MaSV.equals("MaSV") == true) {
					check = 0;
					break;
				}
			}
			if (check == 1) {

				for (i = 0; i < array_mamon.length; i++) {
					total = total + Integer.parseInt(array_sotinchi[i]);
					/*
					 * preparedStatement =
					 * con.prepareStatement("insert into lichhocsv values (?,?,?,?,?,?,?,?,?,?)");
					 * preparedStatement.setString(2, masv); preparedStatement.setString(3,
					 * array_mamon[i]); preparedStatement.setString(4, array_malop[i]);
					 * preparedStatement.setString(4, array_sotinchi[i]);
					 * preparedStatement.setString(5, array_ca[i]); preparedStatement.setString(6,
					 * array_thu[i]); preparedStatement.setString(7, array_phong[i]);
					 * preparedStatement.setString(8, ngay); preparedStatement.setString(9,
					 * array_thoigianbatdau[i]); preparedStatement.setString(10,
					 * array_thoigianketthuc[i]); hi = preparedStatement.executeUpdate();
					 */

					// int soluong = Integer.parseInt(array_qualiti[i]);
					System.out.println(array_mamon[i]);
					preparedStatement = con.prepareStatement("insert into lichhocsv values (?,?,?,?,?,?,?,?,?)");
					preparedStatement.setString(1, taikhoan);
					preparedStatement.setString(2, array_mamon[i]);
					preparedStatement.setString(3, array_malop[i]);
					preparedStatement.setString(4, array_sotinchi[i]);
					preparedStatement.setString(5, array_ca[i]);
					preparedStatement.setString(6, array_thu[i]);
					preparedStatement.setString(7, array_phong[i]);
					preparedStatement.setString(8, array_thoigianbatdau[i]);
					preparedStatement.setString(9, array_thoigianketthuc[i]);

					hi = preparedStatement.executeUpdate();

					preparedStatement = con.prepareStatement("insert into diemsv values (?,?,?,?)");
					preparedStatement.setString(1, taikhoan);
					preparedStatement.setString(2, array_mamon[i]);
					preparedStatement.setString(3, array_malop[i]);
					preparedStatement.setFloat(4, 0);

					ha = preparedStatement.executeUpdate();

				}

			}

			total = 0;
			// cart_price = 0;
			final String username_mail = "quanlysinhvien123@gmail.com";
			final String password = "QuanLySinhVien123";
			String subject = "Xác nhận môn học đăng ký";
			String text = "<strong>Môn học: " + mamon + " - </strong><i> Đăng ký ngày " + ngay + "</i> <ul>";
			for (i = 0; i < array_mamon.length; i++) {
				// cart_price = Integer.parseInt(array_qualiti[i]) *
				// Integer.parseInt(array_price[i]);
				total = total + Integer.parseInt(array_sotinchi[i]);
				text += "<li>Mã môn học: " + array_mamon[i] + ". Số tín chỉ: " + array_sotinchi[i] + ". Mã lớp: "
						+ array_malop[i] + ". Phòng: " + array_phong[i] + ". Ca: " + array_ca[i] + ". Thu: "
						+ array_thu[i] + ". Thời Gian Bắt Đầu: " + array_thoigianbatdau[i] + ". Thời Gian Kết Thúc: "
						+ array_thoigianketthuc[i] + "</li>";
			}

			text += "Tổng số tín chỉ: <strong>" + total + " tín chỉ </strong>";
			Properties props = System.getProperties();

			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.starttls.enable", "true");
			props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
			props.put("mail.smtp.port", "587");
			props.put("mail.smtp.user", username_mail);
			props.put("mail.smtp.password", password);

			Session session_mail = Session.getInstance(props, new javax.mail.Authenticator() {
				@Override
				protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
					return new javax.mail.PasswordAuthentication(username_mail, password);
				}
			});

			Session session = Session.getDefaultInstance(props);

			try {
				Message message = new MimeMessage(session_mail);
				message.setHeader("Content-Type", "text/plain; charset=UTF-8");
				message.setFrom(new InternetAddress(username_mail));
				message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(emailSV));
				message.setSubject(subject);
				message.setContent(text, "text/html; charset=utf-8");
				Transport transport = session.getTransport("smtp");
				transport.connect("smtp.gmail.com", username_mail, password);
				transport.sendMessage(message, message.getAllRecipients());
				transport.close();

			} catch (MessagingException e) {
				throw new RuntimeException(e);
			}

		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if (hi != 0 & ha != 0)
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		else
			request.getRequestDispatcher("XacNhanDangKy.jsp").forward(request, response);

	}
}
