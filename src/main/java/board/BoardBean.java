package board;

import java.sql.Date;

public class BoardBean {
	/*
	bno number primary key,
	writer varchar2(20) not null,
	ip varchar2(15) not null,
	subject varchar2(50) not null,
	content varchar2(300) not null,
	readcount number default 0,
	reg_date date default sysdate
	 */
	
	private int bno;
	private String writer;
	private String ip;
	private String subject;
	private String content;
	private int readcount;
	private Date reg_date;
	
	public BoardBean() {
		super();
	}
	public BoardBean(int bno, String writer, String ip, String subject, String content, int readcount,
			Date reg_date) {
		super();
		this.bno = bno;
		this.writer = writer;
		this.ip = ip;
		this.subject = subject;
		this.content = content;
		this.readcount = readcount;
		this.reg_date = reg_date;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	
	
}
