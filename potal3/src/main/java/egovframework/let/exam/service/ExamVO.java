package egovframework.let.exam.service;

public class ExamVO {

	private static final long serialVersionUID = 1L;

	/** 글 ID */
	private String examId;

	/** 글 제목 */
	private String examSj;
	
	/** 글 내용 */
	private String examCn;

	/** 조회횟수 */
	private String inqireCo;

	/** 첨부파일ID */
	private String atchFileId;

	/** 최초등록시점 */
	private String frstRegisterPnttm;

	/** 최초등록자ID */
	private String frstRegisterId;

	/** 최종수정시점 */
	private String lastUpdusrPnttm;

	/** 최종수정자ID */
	private String lastUpdusrId;

	
	public String getExamId() {
		return examId;
	}
	public void setExamId(String examId) {
		this.examId = examId;
	}
	public String getExamSj() {
		return examSj;
	}
	public void setExamSj(String examSj) {
		this.examSj = examSj;
	}
	public String getExamCn() {
		return examCn;
	}
	public void setExamCn(String examCn) {
		this.examCn = examCn;
	}
	public String getInqireCo() {
		return inqireCo;
	}
	public void setInqireCo(String inqireCo) {
		this.inqireCo = inqireCo;
	}
	public String getAtchFileId() {
		return atchFileId;
	}
	public void setAtchFileId(String atchFileId) {
		this.atchFileId = atchFileId;
	}
	public String getFrstRegisterPnttm() {
		return frstRegisterPnttm;
	}
	public void setFrstRegisterPnttm(String frstRegisterPnttm) {
		this.frstRegisterPnttm = frstRegisterPnttm;
	}
	public String getFrstRegisterId() {
		return frstRegisterId;
	}
	public void setFrstRegisterId(String frstRegisterId) {
		this.frstRegisterId = frstRegisterId;
	}
	public String getLastUpdusrPnttm() {
		return lastUpdusrPnttm;
	}
	public void setLastUpdusrPnttm(String lastUpdusrPnttm) {
		this.lastUpdusrPnttm = lastUpdusrPnttm;
	}
	public String getLastUpdusrId() {
		return lastUpdusrId;
	}
	public void setLastUpdusrId(String lastUpdusrId) {
		this.lastUpdusrId = lastUpdusrId;
	}
//	public String getEXAM_ID() {
//		return EXAM_ID;
//	}
//	public void setEXAM_ID(String eXAM_ID) {
//		EXAM_ID = eXAM_ID;
//	}
//	public String getEXAM_SJ() {
//		return EXAM_SJ;
//	}
//	public void setEXAM_SJ(String eXAM_SJ) {
//		EXAM_SJ = eXAM_SJ;
//	}
//	public String getEXAM_CN() {
//		return EXAM_CN;
//	}
//	public void setEXAM_CN(String eXAM_CN) {
//		EXAM_CN = eXAM_CN;
//	}

	
	
	
}
