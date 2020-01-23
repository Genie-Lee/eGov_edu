package egovframework.let.exam.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.let.exam.service.EgovExamService;
import egovframework.let.exam.service.ExamVO;

@Controller
public class EgovExamController {
	
	@Resource(name = "EgovExamService")
	private EgovExamService examService;
	
	/**
	 * 글 목록 조회
	 * @param searchVO
	 * @param model
	 * @return "/exam/EgovExamListInquire"
	 * @throws Exception
	 */
	@RequestMapping(value="/exam/ExamListInqire.do")
	public String selectExamList(ModelMap model) throws Exception {
		
		model.addAttribute("resultList", examService.selectExamList());
		
		return "/exam/EgovExamListInqire";
	}
	
	/**
	 * 글 상세정보 조회
	 * @param examVO
	 * @param searchVO
	 * @param model
	 * @return "/exam/EgovExamListDetailInquire"
	 * @throws Exception
	 */
	@RequestMapping("/exam/ExamListDetailInquire.do")
	public String selectExamListDetail(ExamVO examVO, ModelMap model) throws Exception {
	
		ExamVO result = examService.selectExamListDetail(examVO);
		model.addAttribute("result", result);

		return "/exam/EgovExamDetailInqire";
	}
	
	/**
	 * 글 등록을 위한 전 처리
	 * @param serchVO
	 * @param model
	 * @return "/exam/EgoExamCnRegist"
	 * @throws Exception
	 */
	@RequestMapping("/exam/ExamCnRegistView.do")
	public String insertExamCnView(Model model) throws Exception {
		
		model.addAttribute("examVO",new ExamVO());
		
		return "/exam/EgovExamCnRegist";
		
	}
	
	/**
	 * 글을 등록
	 * @param searchVO
	 * @return "forward:/exam/ExamListInqire.do"
	 * @throws Exception
	 */
	@RequestMapping("/exam/ExamCnRegist.do")
	public String insertExamCn(@ModelAttribute("examVO") ExamVO examVO) throws Exception {
		
		examService.insertExamCn(examVO);
		
		return "forward:/exam/ExamListInqire.do";
	}
	
	

}
