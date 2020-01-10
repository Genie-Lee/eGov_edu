package egovframework.let.exam.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.let.exam.service.ExamService;
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
	public List<?> selectExamList() throws Exception {
		return examDAO.selectExamList();
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

}
