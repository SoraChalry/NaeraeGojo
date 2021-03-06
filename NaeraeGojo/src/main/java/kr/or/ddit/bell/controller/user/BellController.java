package kr.or.ddit.bell.controller.user;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;










import kr.or.ddit.bell.service.IBellService;
import kr.or.ddit.vo.EmpVO;
import kr.or.ddit.vo.FeedbackVO;
import kr.or.ddit.vo.IssueVO;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/user/bell/")
public class BellController {
	
	
	@Resource
	private IBellService service;
	
	@RequestMapping(value="/bellList")
	public ModelAndView bellList(ModelAndView andview, HttpServletRequest request, HttpSession session
								, Map<String, String> params) throws Exception{
		
		String emp_code = ((EmpVO) session.getAttribute("LOGIN_EMPINFO")).getEmp_code();
		params.put("emp_code", emp_code);
		
		
		//이슈
		String listCnt = service.getIssueCount(params);  // 이슈count
		List<IssueVO> issueList = service.getIssueList(params);
		
		//받은피드백리스트
		String receivefeedCnt = service.getFeedbackCnt(params);  //받은 피드백 count
		List<FeedbackVO> receivefbList = service.receivefbList(params);
		
		//보낸피드백리스트
		String sendfeedCnt = service.getsenFeedCnt(params);
		List<FeedbackVO> sendfbList = service.sendfbList(params);
		
		andview.addObject("issueList", issueList); // 이슈 리스트
		andview.addObject("listCnt", listCnt); // 이슈 카운트
		andview.addObject("receivefbList", receivefbList); // 받은 피드백 리스트
		andview.addObject("receivefeedCnt", receivefeedCnt); // 받은 피드백 count
		andview.addObject("sendfeedCnt", sendfeedCnt); // 보낸 피드백 count
		andview.addObject("sendfbList", sendfbList); // 보낸 피드백 리스트
		
		andview.setViewName("user/bellNotice/bellList");
		return andview;
	}
	
	@RequestMapping("issueAlarm")
	public ModelAndView issueALARM(ModelAndView andView, String issue_code, Map<String, String> param) throws Exception{
		
		param.put("issue_code", issue_code);
		service.issueAlarm(param);
		
		andView.addObject("dd", "가즈아");
		andView.setViewName("jsonConvertView"); 
		return andView;
	}
	

	
	
	
	
	public ModelAndView updateComputation(ModelAndView andView) throws Exception{
		
		return null;
	}
	
	public String insertComputation() throws Exception{
		
		return null;
	}
	
	public String deleteComputation() throws Exception{
		
		return null;
	}
}

