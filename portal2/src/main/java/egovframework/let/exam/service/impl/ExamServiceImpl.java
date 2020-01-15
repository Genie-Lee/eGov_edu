package egovframework.let.exam.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.aspectj.apache.bcel.generic.ReturnaddressType;
import org.springframework.stereotype.Service;

import egovframework.let.exam.service.ExamService;
import egovframework.let.exam.service.ExamSubVO;
import egovframework.let.exam.service.ExamVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("ExamService")
public class ExamServiceImpl extends EgovAbstractServiceImpl implements ExamService {

	@Resource(name="ExamDAO")
	private ExamDAO examDAO;
	
	/**
	 * exam 목록조회
	 * @return 글 목록
	 * @exception Exception
	 */
	@Override
	public List<?> selectExamList(ExamSubVO searchVO) throws Exception {
		return examDAO.selectExamList(searchVO);
	}
	
	/**
	 * exam 글 갯수 조회
	 * @param searchVO
	 * @return 글 갯수
	 */
	@Override
	public int selectExamListTotCnt(ExamSubVO searchVO) {
		return examDAO.selectExamListTotCnt(searchVO);
	}

	/**
	 * exam 글 등록
	 * @param vo
	 * @exception Exception
	 */
	@Override
	public void insertExam(ExamVO vo) throws Exception {
		examDAO.insertExam(vo);
	}

	/**
	 * exam 상세조회
	 * @param vo - 조회할 정보 담긴 ExamVO
	 * @return 조회 글
	 * @exception Exception
	 */
	@Override
	public ExamVO selectExamRead(ExamVO vo) throws Exception {
		ExamVO resultVO = examDAO.selectExamRead(vo);
		if (resultVO == null) {
			throw processException("info.nodata.msg");
		}
		return resultVO;
	}

	/**
	 * exam 수정
	 * @param vo
	 * @exception Exception
	 */
	@Override
	public void updateExam(ExamVO vo) throws Exception {

		examDAO.updateExam(vo);
	}

	/**
	 * exam 삭제
	 * @param vo
	 * @exception Exception
	 */
	@Override
	public void deleteExam(ExamVO vo) throws Exception {

		examDAO.deleteExam(vo);
	}

	
}
