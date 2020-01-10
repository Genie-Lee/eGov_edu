package egovframework.let.exam.service;

import java.util.List;

public interface ExamService {

	/**
	 * exam 목록조회
	 * @return 글 목록
	 * @exception Exception
	 */
	List<?> selectExamList() throws Exception;

	/**
	 * exam 글 등록
	 * @param vo
	 * @exception Exception
	 */
	void insertExam(ExamVO vo) throws Exception;
}
