package board;

import java.sql.Date;

public class NotifyBean {
	private int nno;
	private String spec;
	private String subject;
	private	String content;
	private Date reg_date;
	
	public NotifyBean() {
		super();
	}
	public NotifyBean(int nno, String spec, String subject, String content, Date reg_date) {
		super();
		this.nno = nno;
		this.spec = spec;
		this.subject = subject;
		this.content = content;
		this.reg_date = reg_date;
	}
	public int getNno() {
		return nno;
	}
	public void setNno(int nno) {
		this.nno = nno;
	}
	public String getSpec() {
		return spec;
	}
	public void setSpec(String spec) {
		this.spec = spec;
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
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	
	
}
