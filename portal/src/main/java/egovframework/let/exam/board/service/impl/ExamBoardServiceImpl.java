package egovframework.let.exam.board.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.let.exam.board.service.ExamBoardService;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;


@Service("ExamBoardService")
public class ExamBoardServiceImpl extends EgovAbstractServiceImpl implements ExamBoardService{

	@Resource(name="ExamBoardDAO")
    private ExamBoardDAO examBoardDAO;

	@Override
	public List<?> list() throws Exception {
	     
	return examBoardDAO.list("ExamBoardDAO.list");
	  
	}
	
}




