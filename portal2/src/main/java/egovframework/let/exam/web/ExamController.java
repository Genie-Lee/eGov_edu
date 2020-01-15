package egovframework.let.exam.web;


import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springmodules.validation.commons.DefaultBeanValidator;

import egovframework.let.exam.service.ExamService;
import egovframework.let.exam.service.ExamSubVO;
import egovframework.let.exam.service.ExamVO;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;


@Controller
public class ExamController {

	@Resource(name = "ExamService")
	private ExamService examService;
	
	/** EgovPropertyService */
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;
	
	//Validation 관련
	@Autowired
	private DefaultBeanValidator beanValidator;
	
	/*	
 	@RequestMapping(value="/exam/ExamView.do")
	public String examView() throws Exception{
		return "exam/ExamView";
	}*/

	/**
	 * exam 목록조회
	 * @param model
	 * @return "exam/ExamView"
	 * @throws Exception
	 */
	@RequestMapping(value="/exam/ExamView.do")
	public String selectExamList(@ModelAttribute("searchVO") ExamSubVO searchVO, ModelMap model) throws Exception{
		
		/** paging*/
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(searchVO.getPageIndex());
		paginationInfo.setRecordCountPerPage(searchVO.getPageUnit());
		paginationInfo.setPageSize(searchVO.getPageSize());
		
		searchVO.setFirstIndex(paginationInfo.getFirstRecordIndex());
		searchVO.setLastIndex(paginationInfo.getLastRecordIndex());
		searchVO.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());	
		
		model.addAttribute("resultList", examService.selectExamList(searchVO));
		
		int totCnt = examService.selectExamListTotCnt(searchVO);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		
		return "/exam/ExamView";
	}
	
	/**
	 * exam 등록 페이지 이동
	 * @param model
	 * @return "/exam/ExamRegistView"
	 * @throws Exception
	 */
	@RequestMapping("/exam/ExamRegistView.do")
	public String insertExamView(@ModelAttribute("searchVO") ExamSubVO searchVO, Model model) throws Exception {
		
		model.addAttribute("examVO", new ExamVO());
		return "/exam/ExamRegistView";
	}
	
	/**
	 * exam 글 등록
	 * @param model
	 * @return "exam/ExamRegister"
	 * @throws Exception
	 */
	@RequestMapping("/exam/ExamRegist.do")
	public String insertExam(@ModelAttribute("examVO") ExamVO examVO, BindingResult bindingResult) throws Exception{
		
		beanValidator.validate(examVO, bindingResult);
		
		if(bindingResult.hasErrors()) {
		
			return "/exam/ExamRegistView";
			
		}
		
		examService.insertExam(examVO);
		
		return "redirect:/exam/ExamView.do";
		/**
		 *  url 변화 없음 forward:
		 *  객체 정보 재사용 시 forward: (페이징관련 pageIndex 재사용)
		 *  url 변화 필요시 redirect:
		 */
		
		
	}
	
	/**
	 * exam 상세조회
	 * @param examVO
	 * @param model
	 * @return "exam/ExamRead"
	 * @throws Exception
	 */
	@RequestMapping("/exam/ExamRead.do")
	public String selectExamRead(ExamVO examVO, @ModelAttribute("searchVO") ExamSubVO searchVO, ModelMap model) throws Exception {
		
		ExamVO vo = examService.selectExamRead(examVO);
		
		model.addAttribute("result", vo);
		
		return "/exam/ExamReadView";
		
	}
	
	/**
	 * exam 수정 페이지 이동
	 * @param eno
	 * @param model
	 * @return "/exam/ExamUpdtView"
	 * @throws Exception
	 */
	@RequestMapping("/exam/ExamUpdtView.do")
	public String updateExamView(@RequestParam("eno") String eno, @ModelAttribute("searchVO") ExamSubVO searchVO, ModelMap model) throws Exception{
		
		ExamVO examVO = new ExamVO();
		
		// PK 세팅
		examVO.setEno(eno);
		
		/*model.addAttribute("pageIndex", searchVO.getPageIndex());*/
		
		model.addAttribute(selectExamRead(examVO, searchVO, model));
		
		model.addAttribute("examVO", examService.selectExamRead(examVO));
		
		return "/exam/ExamUpdtView";
		
	}
	
	/**
	 * exam 수정
	 * @param examVO
	 * @parambindingResult
	 * @param model
	 * @return "forward:/exam/ExamView.do"
	 * @throws Exception
	 */
	@RequestMapping("/exam/ExamUpdt.do")
	public String updateExam (@ModelAttribute("examVO") ExamVO examVO, @ModelAttribute("searchVO") ExamSubVO searchVO, BindingResult bindingResult, ModelMap model) throws Exception{
		
		//Validation
		beanValidator.validate(examVO, bindingResult);
		
		if(bindingResult.hasErrors()) {
			
			return "/exam/ExamUpdtView";
					
		}
		
		examService.updateExam(examVO);
		
		return "forward:/exam/ExamView.do";
		
		//객체 정보 재사용 시 forward: (페이징관련 pageIndex 재사용)
	
	}
	
	/**
	 * exam 삭제
	 * @param examVO
	 * @return "forward:/exam/ExamView.do"
	 * @throws Exception
	 */
	@RequestMapping("/exam/ExamDelete.do")
	public String deleteExam(ExamVO examVO, @ModelAttribute("searchVO") ExamSubVO searchVO) throws Exception{
		
		examService.deleteExam(examVO);
		
		return "forward:/exam/ExamView.do";
		
	}
}
