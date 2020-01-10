package egovframework.let.exam.board.web;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.let.exam.board.service.ExamBoardService;
import egovframework.rte.psl.dataaccess.EgovAbstractDAO;

@Controller
public class EgovExamBoardController {

	@Resource(name = "ExamBoardService")
    private ExamBoardService examBoardService;

	@RequestMapping("/exam/board/EgovExamMain.do")
	public String list()throws Exception{
		
		return "/exam/board/EgovExamMain";
	}
	
/*	@RequestMapping("/exam/board/ExamList.do")
	   public String ExamList(ModelMap model) throws Exception{
		
		model.addAttribute("list", ExamBoardService.list());
		
		return "/exam/board/ExamList";
	         
	   }*/

}
