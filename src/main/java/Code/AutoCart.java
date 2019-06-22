package Code;

public class AutoCart extends Subject{
	String MaLop;
	String MaMon;
	int SoTinChi;
	int Ca;
	int Thu;
	String Phong;
	String ThoiGianBatDau;
	String ThoiGianKetThuc;
	
	public String getMaLop() {
		return MaLop;
	}
	public void setMaLop(String MaLop) {
		this.MaLop = MaLop;
	}
	public String getMaMon() {
		return MaMon;
	}
	public void setMaMon(String MaMon) {
		this.MaMon = MaMon;
	}
	public int getSoTinChi() {
		return SoTinChi;
	}
	public void setSoTinChi(int SoTinChi) {
		this.SoTinChi = SoTinChi;
	}
	public int getCa() {
		return Ca;
	}
	public void setCa(int Ca) {
		this.Ca = Ca;
	}
	public int getThu() {
		return Thu;
	}
	public String getPhong() {
		return Phong;
	}
	public void setPhong(String Phong) {
		this.Phong = Phong;
	}
	public String getThoiGianBatDau() {
		return ThoiGianBatDau;
	}
	public void setThoiGianBatDau(String ThoiGianBatDau) {
		this.ThoiGianBatDau = ThoiGianBatDau;
	}
	public String getThoiGianKetThuc() {
		return ThoiGianKetThuc;
	}
	public void setThoiGianKetThuc(String ThoiGianKetThuc) {
		this.ThoiGianKetThuc = ThoiGianKetThuc;
	}
	

	
	public int check_String(String chuoi, String key) {
		String[] output = chuoi.split(";");
		for (int i = 0; i<output.length; i++){
			if(output[i].equals(key)) {
				return i;
			}
		}	
		return -1;
	}
	public String CapNhatSL(String chuoi, int key) {
		String[] output = chuoi.split(";");
		chuoi ="";
		for (int i = 0; i<output.length; i++){
			if(i==key) {
				if(i==0) {	
					output[i] = String.valueOf(Integer.parseInt(output[i]) + 1);
					chuoi = output[i];
				}else {
					output[i]= String.valueOf(Integer.parseInt(output[i]) + 1);
					chuoi = chuoi + ";" + output[i];
				}							
			}else {
				if(i==0) {
					chuoi = output[i];
				}else {
					chuoi = chuoi + ";" + output[i];
				}
			}
		}			
		return chuoi;
	}
	public String XoaMon(String chuoi, int key) {	
		String[] output = chuoi.split(";");
		System.out.println("\noutput ="+ output.length);
		chuoi ="";
		int i =0;		
		for(i=0; i< output.length; i++) {
			if( i == key) {
				if(output.length ==1){
					chuoi = "";					
				}else if(output.length -1 == key) {					
					chuoi = chuoi;
				}else{
					if(chuoi=="") {
						chuoi = output[i+1];
						i=i+1;
					}else {
						chuoi = chuoi + ";"+ output[i+1];
						i=i+1;
					}
				}			
			}else {
					if(chuoi=="") {
						chuoi = output[i];		
					}else {
					chuoi = chuoi +";"+ output[i];				
				}
			}			
		}
		return chuoi;
	}
}
