package egovframework.let.exam.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.let.exam.service.ExamVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("ExamDAO")
public class ExamDAO extends EgovAbstractDAO {

	/**
	 * exam 목록조회
	 * @return 글 목록
	 * @exception Exception
	 */
	public List<?> selectExamList() throws Exception {
		return list("ExamDAO.selectExamList");
	}
	
	/**
	 * exam 글 등록
	 * @param vo
	 * @exception Exception
	 */
	public void insertExam(ExamVO vo) throws Exception {
		insert("ExamDAO.inserExam", vo);
	}

}
