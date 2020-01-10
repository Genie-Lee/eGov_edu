package egovframework.let.exam.web;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class ExamController {

/*	@Resource(name = "ExamService")
	private ExamService examService;*/
	
	@RequestMapping(value="/exam/ExamView.do")
	public String examList() throws Exception{
		return "exam/ExamView";
	}
	
}
