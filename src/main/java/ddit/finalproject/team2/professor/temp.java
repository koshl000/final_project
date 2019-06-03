package ddit.finalproject.team2.professor;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.inject.Inject;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ddit.finalproject.team2.admin.service.KJE_IStatisticsService;
import ddit.finalproject.team2.vo.OpenSemesterVo;

@Controller
@RequestMapping("/professor")
public class temp {
	
	@Inject
	KJE_IStatisticsService statisticsService;
	
    @GetMapping("/lectureList")
    String lectureList(){
        return "/professor/lectureList";
    }
    
    @GetMapping("/assignment") //교수-과제물관리 페이지
	public ModelAndView goaAsignment(ModelAndView mv, Authentication au) {
    	
    	Date date = new Date();
		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyyMMdd");
		String todayString =sdFormat.format(date);
		OpenSemesterVo thisTimeSemester =statisticsService.getThisTimeSemester(todayString);
		String openseme_no =thisTimeSemester.getOpenseme_no();
		
		mv.addObject("lectureList", statisticsService.getStLecture(openseme_no));
		mv.addObject("user_id", au.getName());
    	
		mv.setViewName("professor/giveAssignment");
		return mv;
	}
}
