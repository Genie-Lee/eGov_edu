package egovframework.let.exam.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.let.exam.service.ExamVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("examDAO")
public class ExamDAO extends EgovAbstractDAO {

	/** 글 목록
	 * @param searchVO
	 * @return 글 목록
	 * @throws Exception
	 */
	public List<?> selectExamList() throws Exception {
		return list("examDAO.selectExamList");
	}

	/**
	 * 글 상세내용 조회
	 * @param vo
	 * @return 조회한 글
	 * @exception Exceptionx
	 */
	public ExamVO selectExamListDetail(ExamVO examVO) throws Exception {

		return (ExamVO) select("examDAO.selectExamListDetail", examVO);
	}

	public void insertExamCn(ExamVO examVO) {

		insert("examDAO.insertExamCn", examVO);
		
	}

}
