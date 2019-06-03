package ddit.finalproject.team2.myPack;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import ddit.finalproject.team2.vo.Lsy_EmbraceQuizVo;
import ddit.finalproject.team2.vo.Lsy_QuizQuestionVO;


@Controller
public class ControllerForView {
	@Inject
	LSY_IQuizService service;
	
		@GetMapping("/student")
		public String chooseMain() throws IOException{
//			return "professor/window";
			return "new/gradeRank";
		}
		
		@GetMapping("/professor/register")
		public ModelAndView dadsdad(ModelAndView mav, @Validated @ModelAttribute Lsy_QuizQuestionVO quizVo) {
			mav.setViewName("professor/registerLecture");
			return mav;
		}
		
		//quiz 보기 클릭했을 때
				@GetMapping("/professor/quiz")
				public String sda(@Validated @ModelAttribute Lsy_QuizQuestionVO quizVo, Model model){
					quizVo.setClass_identifying_code("11");
					quizVo.setLecture_code("lecture_code_1");
					model.addAttribute("btnType", "quiz");
//					mav.addObject("btnType", "quiz");
					model.addAttribute("start", 1);
					model.addAttribute("end", 5);
					List<String> otherType = new ArrayList<String>();
					otherType.add("①"); otherType.add("②"); otherType.add("③"); otherType.add("④");
					model.addAttribute("number", 0);
					List<Lsy_QuizQuestionVO> thisQuiz = service.retreiveQuiz(quizVo);
					model.addAttribute("quizList", thisQuiz);
					model.addAttribute("numList", otherType);
//					mav.addObject("oneQuiz", thisQuiz);
//					mav.setViewName("new/showQuiz");
					return "new/quiz";
				}
				
				//quiz 보기 클릭했을 때
				@GetMapping("/professor/quiz2")
				public String sdda(@Validated @ModelAttribute Lsy_QuizQuestionVO quizVo, Model model){
					quizVo.setClass_identifying_code("11");
					quizVo.setLecture_code("lecture_code_1");
					model.addAttribute("btnType", "quiz");
					model.addAttribute("start", 0);
					model.addAttribute("end", 5);
					List<String> otherType = new ArrayList<String>();
					otherType.add("①"); otherType.add("②"); otherType.add("③"); otherType.add("④");
					model.addAttribute("numList", otherType);
					return "new/createQuiz";
				}
		
		//문제 하나를 수정했을 때 발생하는 post 이벤트
		@PostMapping(value="/professor/resetOneQuiz", produces="application/json;charset=utf-8")
		@ResponseBody
		public Lsy_QuizQuestionVO resetOneQuiz(@Validated @RequestBody Lsy_QuizQuestionVO quizVo, BindingResult errors) {
			if(errors.hasErrors()) {
				System.out.println("에러가 있다.");
			}
			int result = service.updateQuiz(quizVo);
			Lsy_QuizQuestionVO thisQuiz = new Lsy_QuizQuestionVO();
			if(result > 0) {
				thisQuiz = service.retrieveOneQuiz(quizVo);
			}
			return thisQuiz;
		}
		
		@PostMapping("/professor/addQuiz")
		public String addQuiz(@Validated @ModelAttribute("allQuestion") Lsy_EmbraceQuizVo allQuestion, BindingResult error){
			if(error.hasErrors()) {
				System.out.println(error);
			}
			System.out.println(allQuestion.getQuizList().get(0).getQuestion_no());
			service.insertQuiz(allQuestion);
			return "professor/quizz";
		}
		
		@GetMapping("/professor/showQuiz")
		public String showQuiz(@Validated @ModelAttribute Lsy_QuizQuestionVO quizVo, Model model) {
			quizVo.setClass_identifying_code("11");
			quizVo.setLecture_code("lecture_code_1");
			model.addAttribute("btnType", "quiz");
//			mav.addObject("btnType", "quiz");
			List<Lsy_QuizQuestionVO> thisQuiz = service.retreiveQuiz(quizVo);
			model.addAttribute("oneQuiz", thisQuiz);
//			mav.addObject("oneQuiz", thisQuiz);
//			mav.setViewName("new/showQuiz");
			return "new/showQuiz";
		}
		
		@GetMapping("/professor/show")
		public ModelAndView showQuiz2222(@Validated @ModelAttribute Lsy_QuizQuestionVO quizVo, ModelAndView mav) {
			quizVo.setClass_identifying_code("11");
			quizVo.setLecture_code("lecture_code_1");
			mav.addObject("btnType", "quiz");
			List<Lsy_QuizQuestionVO> thisQuiz = service.retreiveQuiz(quizVo);
			mav.addObject("quizList", thisQuiz);
			mav.setViewName("professor/quizTextPage4");
			return mav;
		}
		
		@GetMapping("/professor/quizPage")
		public String dsada() {
			return "professor/shoQuizz";
		}
		
		@PostMapping(value="/professor/showQuizz", produces="application/json;charset=utf-8")
		@ResponseBody
		public Lsy_QuizQuestionVO showQuizz(@Validated @RequestBody Lsy_QuizQuestionVO quizVo, BindingResult errors) {
			if(errors.hasErrors()) {
				System.out.println("에러가 있다.");
			}
			int result = service.updateQuiz(quizVo);
			Lsy_QuizQuestionVO thisQuiz = new Lsy_QuizQuestionVO();
			if(result > 0) {
				thisQuiz = service.retrieveOneQuiz(quizVo);
				System.out.println(thisQuiz);
			}
			return thisQuiz;
		}
		
		@GetMapping("/professor/gradeRank")
		public String wqeq() {
			return "professor/gradeRank";
		}
		
		@GetMapping("/professor/myInfo")
		public String dsda() {
			return "professor/myInfo";
		}
		
		@GetMapping("/main/cert	ificate")
		public String sdaqwe() {
			return "professor/certificate";
		}
		
		@GetMapping("/professor/searchGrade")
		public String sda2(){
			return "new/gradeRank";
		}
		@GetMapping("/professor/schedule")
		public String sda3(){
			return "professor/schedule";
		}
		
		@GetMapping("/professor/modal")
		public String login(){
			return "new/modalResult";
		}
		
		@GetMapping("/student/searchGrade")
		public String dsadsa(){
			return "common/login";
		}
		
		@GetMapping("/professor/modify")
		public String dasda12(@Validated @ModelAttribute Lsy_QuizQuestionVO quizInfo, Model model) {
			quizInfo.setClass_identifying_code("11");
			quizInfo.setLecture_code("lecture_code_1");
			List<Lsy_QuizQuestionVO> quizList = service.retreiveQuiz(quizInfo);
			model.addAttribute("start", 1);
			model.addAttribute("end", 5);
			model.addAttribute("quizList", quizList);
			return "new/modifyAndSave";
		}
		
		@GetMapping(value="/professor/selectType/{btnType}", produces="application/json;charset=UTF-8")
		@ResponseBody
		public Map<String, List<String>> asdsa(@PathVariable String btnType){
			Map<String, List<String>> resultMap = new HashMap<String, List<String>>();
			if(btnType.equals("survey")) {
			List<String> surveyProblemList = new ArrayList<String>(); 
			List<String> surveySelectSacri = new ArrayList<String>();
			List<String> surveySelectDiffi = new ArrayList<String>();
			
			surveyProblemList.add("문항선택");
			surveyProblemList.add("만족도");
			surveyProblemList.add("난이도");
			
			surveySelectSacri.add("매우만족");
			surveySelectSacri.add("만족");
			surveySelectSacri.add("보통");
			surveySelectSacri.add("불만족");
			surveySelectSacri.add("매우불만족");
			
			surveySelectDiffi.add("매우어려움");
			surveySelectDiffi.add("어려움");
			surveySelectDiffi.add("보통");
			surveySelectDiffi.add("쉬움");
			surveySelectDiffi.add("매우쉬움");
			
			
			resultMap.put("surveyList", surveyProblemList);
			resultMap.put("surveySC", surveySelectSacri);
			resultMap.put("surveySD", surveySelectDiffi);
			return resultMap;
			}
				else if(btnType.equals("quiz")) {
				List<String> classList = new ArrayList<String>();
				classList.add("차시선택");
				classList.add("1교시");
				classList.add("2교시");
				classList.add("3교시");
				resultMap.put("classList", classList);
				return resultMap;
				}
					else if(btnType.equals("test")) {
					List<String> examList = new ArrayList<String>();
					examList.add("시험선택");
					examList.add("중간고사");
					examList.add("기말고사");
					resultMap.put("examList", examList);
					return resultMap;
					}
						else {
							return null;
						}
			
		}
		
		
		
		
}
