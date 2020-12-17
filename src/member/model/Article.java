package member.model;

import java.util.Date;

import article.model.Writer;

public class Article {
	private Integer number;
	private Writer writer;
	private String title;
	private Date regDate;
	private Date modifielDate;
	private int readCount;
	
	public Article(Integer number, Writer writer, String title, Date regDate, Date modifielDate, int readCount) {
		this.number = number;
		this.writer = writer;
		this.title = title;
		this.regDate = regDate;
		this.modifielDate = modifielDate;
		this.readCount = readCount;
	}
	
	public Integer getNumber() {
		return number;
	}
	
	public void setNumber(Integer number) {
		this.number = number;
	}
	
	public Writer getWriter() {
		return writer;
	}
	
	public void setWriter(Writer writer) {
		this.writer = writer;
	}
	
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public Date getRegDate() {
		return regDate;
	}
	
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	public Date getModifielDate() {
		return modifielDate;
	}
	
	public void setModifielDate(Date modifielDate) {
		this.modifielDate = modifielDate;
	}
	
	public int getReadCount() {
		return readCount;
	}
	
	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}
	
	
}
