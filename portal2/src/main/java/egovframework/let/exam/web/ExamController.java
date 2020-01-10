package egovframework.let.exam.web;


import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.let.exam.service.ExamService;
import egovframework.let.exam.service.ExamVO;


@Controller
public class ExamController {

	@Resource(name = "ExamService")
	private ExamService examService;
	
	//Validation 관련
	@Autowired
	private DefaultBeanValidator beanValidator;
	
	/*	
 	@RequestMapping(value="/exam/ExamView.do")
	public String examView() throws Exception{
		return "exam/ExamView";
	}*/

	/**
	 *exam 목록조회
	 *@param model
	 *@return "exam/ExamView"
	 *@throws Exception
	 */
	@RequestMapping(value="/exam/ExamView.do")
	public String selectExamList(ModelMap model) throws Exception{
		
		model.addAttribute("resultList", examService.selectExamList());
				
		return "exam/ExamView";
	}
	
	/**
	 * exam 페이지 이동
	 * @param model
	 * @return "/exam/ExamRegistView"
	 */
	@RequestMapping("/exam/ExamRegistView.do")
	public String insertExamView(Model model) {
		
		model.addAttribute("examVO", new ExamVO());
		return "/exam/ExamRegistView";
	}
	
	/**
	 *exam 글 등록
	 *@param model
	 *@return "exam/ExamRegister"
	 *@throws Exception
	 */
	@RequestMapping("/exam/ExamRegist.do")
	public String insertExam(@ModelAttribute("examVO") ExamVO examVO, BindingResult bindingResult) throws Exception{
		
		beanValidator.validate(examVO, bindingResult);
		
		if(bindingResult.hasErrors()) {
		
			return "/exam/ExamRegister";
			
		}
		
		return "forward:/exam/ExamView.do";
	}
		
}
