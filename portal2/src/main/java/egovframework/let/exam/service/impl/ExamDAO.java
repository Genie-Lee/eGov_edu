package egovframework.let.exam.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.let.exam.service.ExamSubVO;
import egovframework.let.exam.service.ExamVO;
import egovframework.let.uss.olh.faq.service.FaqManageVO;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("ExamDAO")
public class ExamDAO extends EgovAbstractDAO {

	/**
	 * exam 목록조회
	 * @param searchVO
	 * @return 글 목록
	 * @exception Exception
	 */
	public List<?> selectExamList(ExamSubVO searchVO) throws Exception {
		return list("ExamDAO.selectExamList", searchVO);
	}
	
	/**
	 * exam 글 갯수 조회
	 * @param searchVO
	 * @return 글 갯수
	 */
	public int selectExamListTotCnt(ExamSubVO searchVO) {

		return (Integer) select("ExamDAO.selectExamListTotCnt", searchVO);
	}
	
	/**
	 * exam 글 등록
	 * @param vo
	 * @exception Exception
	 */
	public void insertExam(ExamVO vo) throws Exception {
		insert("ExamDAO.insertExam", vo);
	}

	/**
	 * exam 상세조회
	 * @param vo
	 * @return 조회 글
	 * @exception Exception
	 */
	public ExamVO selectExamRead(ExamVO vo) throws Exception {

        return (ExamVO) select("ExamDAO.selectExamRead", vo);

    }

	/**
	 * exam 수정
	 * @param vo
	 * @exception Exception
	 */
	public void updateExam(ExamVO vo) throws Exception {

		update("ExamDAO.updateExam", vo);
		
	}

	/**
	 * exam 삭제
	 * @param vo
	 * @exception Exception
	 */
	public void deleteExam(ExamVO vo) throws Exception {

		update("ExamDAO.deleteExam", vo);
	}

}
