package egovframework.let.exam.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.let.exam.service.EgovExamService;
import egovframework.let.exam.service.ExamVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("EgovExamService")
public class EgovExamServiceImpl extends EgovAbstractServiceImpl implements EgovExamService {
	
	@Resource(name="examDAO")
	private ExamDAO examDAO;
	
	/** 
	 * 글 목록 조회
	 * @param serchVO
	 * @return 글목록
	 * @exception Exception
	 */
	@Override
	public List<?> selectExamList() throws Exception {
		return examDAO.selectExamList();
	}
	
	/**
	 * 글 조회
	 * @param vo
	 * @return 조회한 글
	 * @exception Exception
	 */
	@Override 
	public ExamVO selectExamListDetail(ExamVO examVO) throws Exception {
		ExamVO resultVO = examDAO.selectExamListDetail(examVO);
//		if (resultVO == null)
//			throw processException("info.nodata.msg");
		return resultVO;
	}

	/**
	 * 글을 등록
	 * @param vo
	 * @exception Exception
	 */
	@Override
	public void insertExamCn(ExamVO examVO) throws Exception {
		
		examDAO.insertExamCn(examVO);
		
	}

}
