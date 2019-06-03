
package ddit.finalproject.team2.student.controller.subjectpage;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import ddit.finalproject.team2.admin.service.KJE_IStatisticsService;
import ddit.finalproject.team2.student.dao.KJE_IStatisticsStuDao;
import ddit.finalproject.team2.student.service.Lsh_ILectureService;
import ddit.finalproject.team2.vo.UserVo;

/**
 * @author 이종선
 * @version 1.0
 * @see <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2019. 5. 14.      이종선       최초작성
 * Copyright (c) 2019 by DDIT All right reserved
 *
 * 과목페이지 화면의 하위 항목들로 이동하기 위한 controller
 * </pre>
 * @since 2019. 5. 14.
 */
@Controller
@RequestMapping("/subjectPage/{lecture_code}")
public class SubjectPageController {

    @Inject
    KJE_IStatisticsService statisticsService;
    
    @Inject
    KJE_IStatisticsStuDao statisticsstudao;
    
    @Inject
    Lsh_ILectureService lectureService;
    
    

    /**
     * 교육목표 화면으로 이동하기 위한 command handler
     *
     * @return
     */
    @GetMapping("eduGoal")
    public ModelAndView goGoal(ModelAndView mv, Authentication authentication, @PathVariable String lecture_code,
                               HttpServletRequest request) {

        Map<String, String> userinfo = new HashMap<>();
        userinfo.put("user_id", authentication.getName());
        userinfo.put("lecture_code", lecture_code);
        userinfo.put("acc_ip", request.getRemoteAddr());
        statisticsService.recodeLectureAccessStats(userinfo);
        mv.setViewName("student/submenu/eduGoal");
        mv.getModel().put("user", (UserVo)authentication.getPrincipal());
        return mv;
    }

    /**
     * 교수소개 화면으로 이동하기 위한 command handler
     *
     * @return
     */
    @GetMapping("professorIntro")
    public ModelAndView goIntroduction(ModelAndView mv, Authentication authentication) {
        mv.setViewName("student/submenu/professorIntro");
        mv.getModel().put("user", (UserVo)authentication.getPrincipal());
        return mv;
    }

    /**
     * 강의페이지 화면으로 이동하기 위한 command handler
     *
     * @param mv
     * @param au
     * @return
     */
    @GetMapping("lecturePage/{class_identifying_code}")
    @Transactional
    public ModelAndView goContinueLectureList(ModelAndView mv, Authentication au, HttpServletRequest req, @PathVariable String lecture_code,
                                              @PathVariable String class_identifying_code,@RequestParam(required = false) String first) {
        Map<String, String> map = new HashMap<>();
        map.put("lecture_code", lecture_code);
        map.put("user_id", au.getName());
        map.put("class_identifying_code", class_identifying_code);
        map.put("replay_time", "0");
        map.put("isplaying", class_identifying_code);
        mv.setViewName("student/exclude/lecturePage");
        mv.getModel().put("videoList", lectureService.selectVideoListbyLecture(map));
        mv.getModel().put("completeList", lectureService.selectAbsenceYN(map));
        if(first!=null && first.equals("y")){
            mv.getModel().put("continuePlay", lectureService.selectContinuePlay(map));
        }else{
            mv.getModel().put("continuePlay",lectureService.selectPlay(map));
        }
        mv.getModel().put("user", (UserVo)au.getPrincipal());
        return mv;
    }

    @GetMapping("lecturePage")
    @Transactional
    public RedirectView redirectWithContinueLecture(ModelAndView mv, Authentication au, @PathVariable String lecture_code) {
        Map<String, String> map = new HashMap<>();
        map.put("user_id", au.getName());
        map.put("lecture_code", lecture_code);
        Map<String, String> continuePlay = lectureService.selectContinuePlay(map);
        String class_code = continuePlay.get("CLASS_IDENTIFYING_CODE");
        return new RedirectView("lecturePage/" + class_code+"?first=y");
    }

    @PostMapping("lecturePage")
    @Transactional
    public void updateContinuePlay(Authentication au,@PathVariable String lecture_code,@RequestBody Map<String, String> map) {
        map.put("lecture_code", lecture_code);
        map.put("user_id", au.getName());
        map.put("isplaying",(String) map.get("class_identifying_code"));
        map.put("replay_time",map.get("replay_time"));
        lectureService.updateContinuePlay(map);
        lectureService.updateIdentifyCode(map);
    }

    /**
     * 게시판 화면으로 이동하기 위한 command handler
     *
     * @param mv
     * @param au
     * @return
     */
    @GetMapping("lectureBoard")
    public ModelAndView goBoard(@PathVariable String lecture_code, ModelAndView mv, Authentication au) {
        mv.setViewName("student/submenu/lectureBoard");
        mv.getModel().put("user", (UserVo) au.getPrincipal());
        mv.getModel().put("lectureCode", lecture_code);
        return mv;
    }

    /**
     * 화상채팅 화면으로 이동하기 위한 command handler
     *
     * @param mv
     * @param au
     * @return
     */
    @GetMapping("mantoman")
    public ModelAndView goFaceChat(ModelAndView mv, Authentication au) {
        mv.setViewName("student/submenu/mantoman");
        mv.getModel().put("id", au.getName());
        mv.getModel().put("user", (UserVo)au.getPrincipal());
        return mv;
    }

    /**
     * 과제물 화면으로 이동하기 위한 command handler
     *
     * @param mv
     * @param au
     * @return
     */
    @GetMapping("lectureAssignment")
    public ModelAndView goAssignment(ModelAndView mv, Authentication au,@PathVariable String lecture_code) {
        mv.setViewName("student/submenu/lectureAssignment");
        mv.getModel().put("id", au.getName());
        mv.getModel().put("user", (UserVo)au.getPrincipal());
        mv.getModel().put("lecture_code", lecture_code);
        String lecture_name = statisticsstudao.selectLectureName(lecture_code);
        mv.getModel().put("lecture_name", lecture_name);
        return mv;
    }

    /**
     * 학생용 학습현황 페이지로 이동하는 command handler
     *
     * @param mv
     * @param au
     * @return
     */
    @GetMapping("studyState")
    public ModelAndView goStudy(ModelAndView mv, Authentication au ,@PathVariable String lecture_code) {
        mv.setViewName("student/submenu/studyState");
        mv.getModel().put("id", au.getName());
        mv.getModel().put("user", (UserVo)au.getPrincipal());
        mv.getModel().put("lecture_code", lecture_code);
        return mv;
    }

    /**
     * 설문지 화면으로 이동하기 위한 command handler
     *
     * @param mv
     * @param au
     * @return
     */
    @GetMapping("survey")
    public ModelAndView goSurvey(ModelAndView mv, Authentication au) {
        mv.setViewName("student/submenu/survey");
        mv.getModel().put("id", au.getName());
        mv.getModel().put("user", (UserVo)au.getPrincipal());
        return mv;
    }
}
