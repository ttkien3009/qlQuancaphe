package Code;

public class duongdan {

	public static String Duongdan(String chuoi)
	{
		String chuoi2 = "";
		chuoi2 = chuoi.replace(".metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\", "");  
     
		return chuoi2;
		
	}
}
