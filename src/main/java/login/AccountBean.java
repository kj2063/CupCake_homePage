package login;

public class AccountBean {
	private int no;
	private String id;
	private String pw;
	private String email;
	private String name;
	private int rrn1;
	private int rrn2;
	private int hp1;
	private int hp2;
	private int hp3;
	private String joindate;
	
	
	
	public AccountBean() {
		super();
	}
	
	public AccountBean(int no, String id, String pw, String email, String name, int rrn1, int rrn2, int hp1, int hp2,
			int hp3, String joindate) {
		super();
		this.no = no;
		this.id = id;
		this.pw = pw;
		this.email = email;
		this.name = name;
		this.rrn1 = rrn1;
		this.rrn2 = rrn2;
		this.hp1 = hp1;
		this.hp2 = hp2;
		this.hp3 = hp3;
		this.joindate = joindate;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getRrn1() {
		return rrn1;
	}
	public void setRrn1(int rrn1) {
		this.rrn1 = rrn1;
	}
	public int getRrn2() {
		return rrn2;
	}
	public void setRrn2(int rrn2) {
		this.rrn2 = rrn2;
	}
	public int getHp1() {
		return hp1;
	}
	public void setHp1(int hp1) {
		this.hp1 = hp1;
	}
	public int getHp2() {
		return hp2;
	}
	public void setHp2(int hp2) {
		this.hp2 = hp2;
	}
	public int getHp3() {
		return hp3;
	}
	public void setHp3(int hp3) {
		this.hp3 = hp3;
	}
	public String getJoindate() {
		return joindate;
	}
	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}
	
	
}
