package product;

public class OrderBean {
	/*
	ono number primary key, -- 주문번호(ordseq)
	memno number not null, -- 회원번호
	pno varchar2(20) not null, -- 상품번호
	p_num varchar2(20) not null, -- 상품갯수
	tot_price number not null, -- 전체가격
	ord_date date default sysdate, --주문일
	takeout_date varchar2(10) not null --수취일
	
	no number not null primary key,
	id varchar2(20) not null unique,
	pw varchar2(20) not null,
	email varchar2(30) not null,
	name varchar2(20) not null,
	rrn1 number(6) not null,
	rrn2 number(7) not null,
	hp1 number(3) not null,
	hp2 number(4) not null,
	hp3 number(4) not null,
	joindate date default sysdate
	*/
	private int ono;
	private int memno;
	private String pno;
	private String p_num;
	private int tot_price;
	private String ord_date;
	private String takeout_date;
	
	private String id;
	private String name;
	private int hp1;
	private int hp2;
	private int hp3;
	
	
	
	public OrderBean(int ono, int memno, String pno, String p_num, int tot_price, String ord_date, String takeout_date,
			String id, String name, int hp1, int hp2, int hp3) {
		super();
		this.ono = ono;
		this.memno = memno;
		this.pno = pno;
		this.p_num = p_num;
		this.tot_price = tot_price;
		this.ord_date = ord_date;
		this.takeout_date = takeout_date;
		this.id = id;
		this.name = name;
		this.hp1 = hp1;
		this.hp2 = hp2;
		this.hp3 = hp3;
	}
	public OrderBean() {
		super();
	}
	public OrderBean(int ono, int memno, String pno, String p_num, int tot_price, String ord_date,
			String takeout_date) {
		super();
		this.ono = ono;
		this.memno = memno;
		this.pno = pno;
		this.p_num = p_num;
		this.tot_price = tot_price;
		this.ord_date = ord_date;
		this.takeout_date = takeout_date;
	}
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public int getOno() {
		return ono;
	}
	public void setOno(int ono) {
		this.ono = ono;
	}
	public int getMemno() {
		return memno;
	}
	public void setMemno(int memno) {
		this.memno = memno;
	}
	public String getPno() {
		return pno;
	}
	public void setPno(String pno) {
		this.pno = pno;
	}
	public String getP_num() {
		return p_num;
	}
	public void setP_num(String p_num) {
		this.p_num = p_num;
	}
	public int getTot_price() {
		return tot_price;
	}
	public void setTot_price(int tot_price) {
		this.tot_price = tot_price;
	}
	public String getOrd_date() {
		return ord_date;
	}
	public void setOrd_date(String ord_date) {
		this.ord_date = ord_date;
	}
	public String getTakeout_date() {
		return takeout_date;
	}
	public void setTakeout_date(String takeout_date) {
		this.takeout_date = takeout_date;
	}
	
	
}
