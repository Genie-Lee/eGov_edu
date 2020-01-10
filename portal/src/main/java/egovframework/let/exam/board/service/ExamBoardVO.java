package egovframework.let.exam.board.service;

import java.util.Date;

public class ExamBoardVO{


	private static final long serialVersionUID = 1L;
	
	 /** ENO */
    private Long eno;
    
    /** TITLE */
    private String title;
    
    /** CONTENT */
    private String content;
    
    /** WRITER */
    private String writer;
    
    /** REGDATE */
    private Date regdate;

	public Long getEno() {
		return eno;
	}

	public void setEno(Long eno) {
		this.eno = eno;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

   

}
