package board;

import java.sql.Date;

public class ReplyBean {
	/*
	rno number primary key,
	bno number not null,
	r_writer varchar2(20) not null,
	r_content varchar2(150) not null,
	r_reg_date date default sysdate,
	r_ip varchar2(15) not null
	 */
	
	private int rno;
	private String bno;
	private String r_writer;
	private String r_content;
	private Date r_reg_date;
	private String r_ip;
	
	public ReplyBean() {
		super();
	}
	public ReplyBean(int rno, String bno, String r_writer, String r_content, Date r_reg_date, String r_ip) {
		super();
		this.rno = rno;
		this.bno = bno;
		this.r_writer = r_writer;
		this.r_content = r_content;
		this.r_reg_date = r_reg_date;
		this.r_ip = r_ip;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public String getBno() {
		return bno;
	}
	public void setBno(String bno) {
		this.bno = bno;
	}
	public String getR_writer() {
		return r_writer;
	}
	public void setR_writer(String r_writer) {
		this.r_writer = r_writer;
	}
	public String getR_content() {
		return r_content;
	}
	public void setR_content(String r_content) {
		this.r_content = r_content;
	}
	public Date getR_reg_date() {
		return r_reg_date;
	}
	public void setR_reg_date(Date r_reg_date) {
		this.r_reg_date = r_reg_date;
	}
	public String getR_ip() {
		return r_ip;
	}
	public void setR_ip(String r_ip) {
		this.r_ip = r_ip;
	}
	
	
}
