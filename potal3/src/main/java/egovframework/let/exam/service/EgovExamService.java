package egovframework.let.exam.service;

import java.util.List;

public interface EgovExamService {
	
	/**
	 * 글 목록 조회
	 * @param searchVO
	 * @return 글 목록
	 * @exception Exception
	 */
	List<?> selectExamList() throws Exception;

	/**
	 * 글 조회
	 * @param examVO
	 * @return 조회한 글
	 * @throws Exception
	 */
	ExamVO selectExamListDetail(ExamVO examVO) throws Exception;

	/**
	 * 글 등록
	 * @param examVO
	 * @throws Exception
	 */
	void insertExamCn(ExamVO examVO) throws Exception;

}
