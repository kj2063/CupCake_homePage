package product;

public class ProductBean {
	private int pno;
	private String pcat; 
	private String pname; 
	private String pimage;
	private int price; 
	private String pspec;
	private String pcontents;
	
	private int p_num;
	private int tot_price;
	
	public ProductBean() {
		super();
	}
	public ProductBean(int pno, String pcat, String pname, String pimage, int price, String pspec, String pcontents) {
		super();
		this.pno = pno;
		this.pcat = pcat;
		this.pname = pname;
		this.pimage = pimage;
		this.price = price;
		this.pspec = pspec;
		this.pcontents = pcontents;
	}
	
	
	public int getP_num() {
		return p_num;
	}
	public void setP_num(int p_num) {
		this.p_num = p_num;
	}
	public int getTot_price() {
		return tot_price;
	}
	public void setTot_price(int tot_price) {
		this.tot_price = tot_price;
	}
	public int getPno() {
		return pno;
	}
	public void setPno(int pno) {
		this.pno = pno;
	}
	public String getPcat() {
		return pcat;
	}
	public void setPcat(String pcat) {
		this.pcat = pcat;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getPimage() {
		return pimage;
	}
	public void setPimage(String pimage) {
		this.pimage = pimage;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getPspec() {
		return pspec;
	}
	public void setPspec(String pspec) {
		this.pspec = pspec;
	}
	public String getPcontents() {
		return pcontents;
	}
	public void setPcontents(String pcontents) {
		this.pcontents = pcontents;
	}

}
