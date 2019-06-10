package ddit.finalproject.team2.professor.main;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.tiles.autotag.core.runtime.annotation.Parameter;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import ddit.finalproject.team2.admin.service.KJE_IStatisticsService;
import ddit.finalproject.team2.myPack.LSY_IQuizService;
import ddit.finalproject.team2.student.service.Lsh_ILectureService;
import ddit.finalproject.team2.vo.Lsy_LectureInfos;
import ddit.finalproject.team2.vo.ProfessorVo;
import ddit.finalproject.team2.vo.UserVo;

@Controller("professorController")
@RequestMapping("/professorMain")
public class MainController {
	
	@Inject
	Lsh_ILectureService lectureService;
	
	@Inject
	LSY_IQuizService lsyService;
	
	@GetMapping("notice")
	public ModelAndView goNotice(ModelAndView mv) {
		mv.setViewName("professor/notice");
		return mv;
	}
	
	@GetMapping("MyLecture")
	public ModelAndView goMyLecturePage(ModelAndView mv, Authentication au){
		mv.setViewName("professor/myLecture");
		mv.getModel().put("id", au.getName());
		mv.getModel().put("userVo", (UserVo)au.getPrincipal());
		UserVo userInfo = (UserVo)au.getPrincipal();
		ProfessorVo professor = lsyService.retrieveProInfos(userInfo.getUser_id());
//		Map<String, String> lectureInfoMap = new HashMap<String, String>();
//		lectureInfoMap.put("user_id", userInfo.getUser_id());
//		lectureInfoMap.put("prof_degree", professor.getProf_degree());
//		Lsy_LectureInfos proLectureInfo =  lsyService.retreiveLectureInfoForList(lectureInfoMap);
//		mv.getModel().put("proLectureInfo", proLectureInfo);
		System.out.println(userInfo.getLectureList().get(0).getLecture_code());
		Lsy_LectureInfos lectureInfos = lsyService.retrieveLectureInfoForViews(userInfo.getLectureList().get(0).getLecture_code());
		mv.getModel().put("professorVo", professor);
		mv.getModel().put("lectureInfos", lectureInfos);
		Map<String,String> map=new HashMap<>();
		map.put("user_id",au.getName());
		map.put("openseme_year","2019");
		map.put("openseme_semester","1");
		mv.getModel().put("lectures",lectureService.selectLectureListbyOpenseme(map));
		return mv;
	}
	
	@GetMapping(value="SelectType/{lecture_code}", produces="application/json;charset=utf-8")
	public Lsy_LectureInfos showLectureList(@PathVariable String lecture_code) {
		Lsy_LectureInfos result = lsyService.retrieveLectureInfoForViews(lecture_code);
		if(result!=null) {
			return result;
		}
		return null;
	}
	
//	@GetMapping("myLecture/{lecture_code}")
//	public ModelAndView goMyLecture(ModelAndView mv, Authentication au, @PathVariable String lecture_code) {
//		mv.setViewName("professor/myLecture");
//		mv.getModel().put("id", au.getName());
//		mv.getModel().put("user", (UserVo)au.getPrincipal());
//		Map<String, String> lectureInfoMap = new HashMap<String, String>();
//		lectureInfoMap.put("lecture_code", lecture_code);
//		lsyService.retrieveLectureInfoForViews(lectureInfoMap);
//
//		Map<String,String> map=new HashMap<>();
//		map.put("user_id",au.getName());
//		map.put("openseme_year","2019");
//		map.put("openseme_semester","1");
//		mv.getModel().put("lectures",lectureService.selectLectureListbyOpenseme(map));
//		return mv;
//	}
//	
//	@GetMapping("myLecture")
//	public ModelAndView goMyLectureList(ModelAndView mv, Authentication au, @PathVariable String lecture_code) {
//		mv.setViewName("professor/myLecture");
//		mv.getModel().put("id", au.getName());
//		mv.getModel().put("user", (UserVo)au.getPrincipal());
//		Map<String, String> lectureInfoMap = new HashMap<String, String>();
//		lectureInfoMap.put("lecture_code", lecture_code);
//		lsyService.retrieveLectureInfoForViews(lectureInfoMap);
//
//		Map<String,String> map=new HashMap<>();
//		map.put("user_id",au.getName());
//		map.put("openseme_year","2019");
//		map.put("openseme_semester","1");
//		mv.getModel().put("lectures",lectureService.selectLectureListbyOpenseme(map));
//		return mv;
//	}
	
}
