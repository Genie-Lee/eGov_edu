package egovframework.let.exam.service;

import java.util.List;

public interface ExamService {

	/**
	 * exam 목록조회
	 * @return 글 목록
	 * @exception Exception
	 */
	List<?> selectExamList(ExamSubVO searchVO) throws Exception;
	
	/**
	 * exam 글 갯수 조회
	 * @param searchVO
	 * @return 글 갯수
	 */
	int selectExamListTotCnt(ExamSubVO searchVO);

	/**
	 * exam 글 등록
	 * @param vo
	 * @exception Exception
	 */
	void insertExam(ExamVO vo) throws Exception;

	/**
	 * exam 상세조회
	 * @param vo
	 * @return 조회 글
	 * @exception Exception
	 */
	ExamVO selectExamRead(ExamVO examVO) throws Exception;

	/**
	 * exam 수정
	 * @param vo
	 * @exception Exception
	 */
	void updateExam(ExamVO vo) throws Exception;

	/**
	 * exam 삭제
	 * @param vo
	 * @exception Exception
	 */
	void deleteExam(ExamVO vo) throws Exception;

}
