package egovframework.let.exam.service;

public class ExamVO {

	/** 게시물 번호  */
	private String eno;
	
	/** 제목 */
	private String title;
	
	/** 내용 */
	private String content;
	
	/** 작성자 */
	private String writer;
	
	/** 등록일 */
	private String regdate;
	
	/** 유저 아이디 코드번호 */
	private String esntl_Id = "";
	
	
	public String getEno() {
		return eno;
	}

	public void setEno(String eno) {
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

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getEsntl_Id() {
		return esntl_Id;
	}

	public void setEsntl_Id(String esntl_Id) {
		this.esntl_Id = esntl_Id;
	}
	
}
