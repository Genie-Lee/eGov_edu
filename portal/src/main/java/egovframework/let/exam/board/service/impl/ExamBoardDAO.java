package egovframework.let.exam.board.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Repository("ExamBoardDAO")
public class ExamBoardDAO extends EgovAbstractDAO {


	public List<?> list() throws Exception {
	      return list("ExamBoardDAO.list");
	   }

    
}
