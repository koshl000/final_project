package ddit.finalproject.team2.myPack;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.security.core.Authentication;
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

import ddit.finalproject.team2.professor.service.Ljs_IGradeService;
import ddit.finalproject.team2.util.AuthorityUtil;
import ddit.finalproject.team2.vo.AttendVo;
import ddit.finalproject.team2.vo.Lsy_EmbraceAnswer;
import ddit.finalproject.team2.vo.Lsy_EmbraceExamAnswer;
import ddit.finalproject.team2.vo.Lsy_EmbraceExamVo;
import ddit.finalproject.team2.vo.Lsy_EmbraceQuizVo;
import ddit.finalproject.team2.vo.Lsy_ExamQuestionVo;
import ddit.finalproject.team2.vo.Lsy_ExamVo;
import ddit.finalproject.team2.vo.Lsy_LectureInfos;
import ddit.finalproject.team2.vo.Lsy_QuizAnswerVo;
import ddit.finalproject.team2.vo.Lsy_QuizQuestionVO;
import ddit.finalproject.team2.vo.UserVo;


@Controller
public class ControllerForView {
	@Inject
	LSY_IQuizService service;
	
	@Inject
	Ljs_IGradeService ljs_service;
	
		@PostMapping("/student/submit")
		public String dsadada12(@Validated @ModelAttribute Lsy_EmbraceAnswer answerList, Model model, Authentication au) {
			Lsy_QuizQuestionVO quizVo = new Lsy_QuizQuestionVO();
			List<AttendVo> attendNo = ((UserVo)au.getPrincipal()).getAttendNoList();
			System.out.println(attendNo.get(0).getAttend_no());
			List<String> keyVal = service.stAnswerNextVal(answerList.getAnswerList().size());
			
			for (int idx = 0; idx < answerList.getAnswerList().size(); idx++) {
				answerList.getAnswerList().get(idx).setQuizAnswer_code(keyVal.get(idx));
			}
			int result = service.createStAnswer(answerList);
			if(result>0) {
				//성적테이블에 성적넣는 작업해야함
//				ljs_service.createExamGrade(material)
				model.addAttribute("close", "close");
				return "new/quiz";
			}
			return null;
		}
		
		@GetMapping("/professor/register/{lecture_code}")
		public ModelAndView dadsdad(ModelAndView mav, @Validated @ModelAttribute Lsy_QuizQuestionVO quizVo,
									@PathVariable String lecture_code, Authentication au) {
			Lsy_LectureInfos lectureInfos = service.retrieveLectureInfoForViews(lecture_code);
			List<Lsy_ExamVo> evalTypeAndCode = service.retrieveEvalStudyCodes(lecture_code);
			System.out.println(lectureInfos);
			mav.getModel().put("lectureInfos", lectureInfos);
			mav.getModel().put("evalTypeAndCode", evalTypeAndCode);
			List<String> auth = AuthorityUtil.getAuthorityList(au);
			mav.getModel().put("identifier", auth);
			mav.setViewName("professor/registerLecture");
			return mav;
		}
		
		//quiz 보기 클릭했을 때
				@GetMapping("/professor/quiz/{class_identifying_code}/{lecture_class}/{lecture_code}")
				public ModelAndView showQuizPro(@Validated @ModelAttribute Lsy_QuizQuestionVO quizVo, ModelAndView mav,
								@PathVariable String class_identifying_code,
								@PathVariable String lecture_class,
								@PathVariable String lecture_code, Authentication au){
					Map<String, String> lectureMap = new HashMap<String, String>();
					lectureMap.put("lecture_code", lecture_code);
					lectureMap.put("class_identifying_code", class_identifying_code);
					Lsy_LectureInfos lectureInfos = service.retrieveLectureInfoForOneViews(lectureMap);
					mav.getModel().put("lectureInfos", lectureInfos);
					mav.getModel().put("userVo", (UserVo)au.getPrincipal());
					List<String> auth = AuthorityUtil.getAuthorityList(au);
					mav.getModel().put("btnType", "quiz");
					mav.getModel().put("identifier", auth);
					quizVo.setClass_identifying_code(class_identifying_code);
					quizVo.setLecture_code(lecture_code);
					mav.getModel().put("start", 1);
					mav.getModel().put("end", 5);
					//학생, 교수 구분해서 정보 가져오기.
//					model.addAttribute("attend_no", "1");
					List<String> otherType = new ArrayList<String>();
					otherType.add("①"); otherType.add("②"); otherType.add("③"); otherType.add("④");
					List<Lsy_QuizQuestionVO> thisQuiz = service.retreiveQuiz(quizVo);
					mav.getModel().put("quizList", thisQuiz);
					mav.getModel().put("numList", otherType);
					mav.setViewName("new/quiz");
					return mav;
				}
				
				@GetMapping("/student/quiz/{class_identifying_code}/{lecture_class}/{lecture_code}")
				public ModelAndView showQuizPro2(@Validated @ModelAttribute Lsy_QuizQuestionVO quizVo, ModelAndView mav,
								@PathVariable String class_identifying_code,
								@PathVariable String lecture_class,
								@PathVariable String lecture_code, Authentication au){
					Map<String, String> lectureMap = new HashMap<String, String>();
					lectureMap.put("lecture_code", lecture_code);
					lectureMap.put("class_identifying_code", class_identifying_code);
					Lsy_LectureInfos lectureInfos = service.retrieveLectureInfoForOneViews(lectureMap);
					mav.getModel().put("lectureInfos", lectureInfos);
					mav.getModel().put("userVo", (UserVo)au.getPrincipal());
					List<String> auth = AuthorityUtil.getAuthorityList(au);
					mav.getModel().put("btnType", "quiz");
					mav.getModel().put("identifier", auth);
					quizVo.setClass_identifying_code(class_identifying_code);
					quizVo.setLecture_code(lecture_code);
					mav.getModel().put("start", 1);
					mav.getModel().put("end", 5);
					//학생, 교수 구분해서 정보 가져오기.
//					model.addAttribute("attend_no", "1");
					List<String> otherType = new ArrayList<String>();
					otherType.add("①"); otherType.add("②"); otherType.add("③"); otherType.add("④");
					List<Lsy_QuizQuestionVO> thisQuiz = service.retreiveQuiz(quizVo);
					mav.getModel().put("quizList", thisQuiz);
					mav.getModel().put("numList", otherType);
					mav.setViewName("new/quiz");
					return mav;
				}
				
				//quiz 등록 클릭했을 때
				@GetMapping("/professor/createQuiz/{class_identifying_code}/{lecture_class}/{lecture_code}")
				public ModelAndView sddsada(@Validated @ModelAttribute Lsy_QuizQuestionVO quizVo, ModelAndView mav,
						@PathVariable String class_identifying_code,
						@PathVariable String lecture_class,
						@PathVariable String lecture_code, Authentication au){
					Map<String, String> lectureMap = new HashMap<String, String>();
					lectureMap.put("lecture_code", lecture_code);
					lectureMap.put("class_identifying_code", class_identifying_code);
					Lsy_LectureInfos lectureInfos = service.retrieveLectureInfoForOneViews(lectureMap);
					System.out.println(lectureInfos);
					mav.getModel().put("lectureInfos", lectureInfos);
					mav.getModel().put("class_identifying_code", class_identifying_code);
					mav.getModel().put("lecture_code", lecture_code);
					mav.getModel().put("btnType", "quiz");
					mav.getModel().put("start", 0);
					mav.getModel().put("end", 5);
					List<String> otherType = new ArrayList<String>();
					otherType.add("①"); otherType.add("②"); otherType.add("③"); otherType.add("④");
					mav.getModel().put("numList", otherType);
					mav.setViewName("new/createQuiz");
					return mav;
				}
		
		//문제 하나를 수정했을 때 발생하는 post 이벤트
		@PostMapping(value="/professor/resetOneQuiz", produces="application/json;charset=utf-8")
		@ResponseBody
		public Lsy_QuizQuestionVO resetOneQuiz(@Validated @RequestBody Lsy_QuizQuestionVO quizVo, BindingResult errors) {
			int result = 0;
			System.out.println(quizVo.getQuestion_no());
			if(errors.hasErrors()) {
				System.out.println("에러가 있다.");
			} else {
				result = service.updateQuiz(quizVo);
			}
			Lsy_QuizQuestionVO thisQuiz = new Lsy_QuizQuestionVO();
			if(result > 0) {
				thisQuiz = service.retrieveOneQuiz(quizVo.getQuestion_no());
			}
			return thisQuiz;
		}
		
		@PostMapping("/professor/addQuiz")
		public String addQuiz(@Validated @ModelAttribute("allQuestion") Lsy_EmbraceQuizVo allQuestion, BindingResult error,
								Model model){
			if(error.hasErrors()) {
				System.out.println(error);
			}
			System.out.println(allQuestion);
			int result = service.createQuiz(allQuestion);
			if(result>0) {
				model.addAttribute("close", "close");
			}
			return "new/quiz";
		}
		
//		@GetMapping("/professor/showQuiz/{lecture_code}/{class_code}/{btnType}")
//		public String showQuiz(@Validated @ModelAttribute Lsy_QuizQuestionVO quizVo, Model model,
//							@PathVariable String lecture_code, @PathVariable String class_code, @PathVariable String btnType) {
//			quizVo.setClass_identifying_code("11");
//			quizVo.setLecture_code("lecture_code_1");
//			model.addAttribute("btnType", "quiz");
////			mav.addObject("btnType", "quiz");
//			List<Lsy_QuizQuestionVO> thisQuiz = service.retreiveQuiz(quizVo);
//			model.addAttribute("oneQuiz", thisQuiz);
////			mav.addObject("oneQuiz", thisQuiz);
////			mav.setViewName("new/showQuiz");
//			return "new/showQuiz";
//		}
		
//		@GetMapping("/professor/show")
//		public ModelAndView showQuiz2222(@Validated @ModelAttribute Lsy_QuizQuestionVO quizVo, ModelAndView mav) {
//			quizVo.setClass_identifying_code("11");
//			quizVo.setLecture_code("lecture_code_1");
//			mav.addObject("btnType", "quiz");
//			List<Lsy_QuizQuestionVO> thisQuiz = service.retreiveQuiz(quizVo);
//			mav.addObject("quizList", thisQuiz);
//			mav.setViewName("professor/quizTextPage4");
//			return mav;
//		}
		
//		@GetMapping("/new/createSurvey")
//		public String dsada21(Model model) {
//			model.addAttribute("btnType", "survey");
//			return "new/survey";
//		}

		@GetMapping("/professor/showExam/{evalType}/{evalCode}/{lecture_code}/{class_identifying_code}")
		public ModelAndView showExam(ModelAndView mav, @PathVariable String evalType,
								@PathVariable String evalCode, @PathVariable String lecture_code,
								Authentication au, @PathVariable String class_identifying_code) {
			HashMap<String, String> examMap = new HashMap<String, String>();
			examMap.put("examType", evalType);
			examMap.put("lecture_code", lecture_code);
			mav.getModel().put("btnType", "exam");
			List<String> auth = AuthorityUtil.getAuthorityList(au);
			mav.getModel().put("identifier", auth);
			mav.getModel().put("userVo", (UserVo)au.getPrincipal());
			Lsy_ExamVo examVo = service.retrieveExamList(examMap);
			System.out.println(evalType+"/"+lecture_code+"/"+auth+"/"+examVo);
			mav.getModel().put("examVo", examVo);
			Map<String, String> lectureMap = new HashMap<String, String>();
			lectureMap.put("lecture_code", lecture_code);
			lectureMap.put("class_identifying_code", class_identifying_code);
			Lsy_LectureInfos lectureInfos = service.retrieveLectureInfoForOneViews(lectureMap);
			mav.getModel().put("lecture_code", lecture_code);
			mav.getModel().put("start", 0);
			mav.getModel().put("end", 5);
			mav.getModel().put("lectureInfos", lectureInfos);
			List<String> otherType = new ArrayList<String>();
			otherType.add("①"); otherType.add("②"); otherType.add("③"); otherType.add("④");
			mav.getModel().put("numList", otherType);
			mav.setViewName("new/exam");
			return mav;
		}
		
		@GetMapping("/student/showExam/{evalType}/{evalCode}/{lecture_code}")
		public ModelAndView showExamSt(ModelAndView mav, @PathVariable String evalType,
								@PathVariable String evalCode, @PathVariable String lecture_code,
								Authentication au) {
			HashMap<String, String> examMap = new HashMap<String, String>();
			examMap.put("examType", evalType);
			examMap.put("lecture_code", lecture_code);
			mav.getModel().put("btnType", "exam");
			List<String> auth = AuthorityUtil.getAuthorityList(au);
			mav.getModel().put("identifier", auth);
			mav.getModel().put("userVo", (UserVo)au.getPrincipal());
			Lsy_ExamVo examVo = service.retrieveExamList(examMap);
			System.out.println(evalType+"/"+lecture_code+"/"+auth+"/"+examVo);
			mav.getModel().put("examVo", examVo);
			mav.getModel().put("lecture_code", lecture_code);
			mav.getModel().put("start", 0);
			mav.getModel().put("end", 5);
			List<String> otherType = new ArrayList<String>();
			otherType.add("①"); otherType.add("②"); otherType.add("③"); otherType.add("④");
			mav.getModel().put("numList", otherType);
			mav.setViewName("new/exam");
			return mav;
		}
		
		@GetMapping("/professor/createExam/{evalType}/{evalCode}/{lecture_code}")
		public ModelAndView asdad(ModelAndView mav, @PathVariable String evalType,
				@PathVariable String evalCode, @PathVariable String lecture_code,
				Authentication au) {
			HashMap<String, String> examMap = new HashMap<String, String>();
			examMap.put("examType", evalType);
			examMap.put("lecture_code", lecture_code);
			Lsy_ExamVo examVo = service.retrieveExamList(examMap);
			mav.getModel().put("btnType", "exam");
			mav.getModel().put("lectureInfos", examVo);
			mav.getModel().put("lecture_code", lecture_code);
			mav.getModel().put("start", 0);
			mav.getModel().put("end", 5);
			List<String> auth = AuthorityUtil.getAuthorityList(au);
			mav.getModel().put("identifier", auth);
			mav.getModel().put("userVo", (UserVo)au.getPrincipal());
			mav.setViewName("new/createQuestion");
			return mav;
		}
		
		@PostMapping("/professor/createExam/{lecture_code}")
		public String dasddsda23132(@Validated @ModelAttribute Lsy_EmbraceExamVo examVo, 
									ModelAndView mav, @PathVariable String lecture_code,
									Authentication au) {
			int problemSize = 20; //나중엔 문제의 사이즈로 변환해주기 지금은 5개만 해놔서 이렇게 하드코딩한 것.
			int problemIdx = 0;
			if(examVo!=null) {
				HashMap<String, String> examMap = new HashMap<String, String>();
				examMap.put("examType", examVo.getExamList().get(0).getExam_type().substring(0, 2));
				examMap.put("lecture_code", lecture_code);
				examMap.put("problemSize", String.valueOf(problemSize));
				HashMap<String, Object> examNoAndStudyCode = (HashMap<String, Object>) service.examNoNextVal(examMap);
				examMap.put("evalCode", examNoAndStudyCode.get("studyCode").toString());
				List<String> problemSeq = (List<String>) examNoAndStudyCode.get("problemSeq");
				examVo.getExamList().get(0).setExam_no(examNoAndStudyCode.get("examNo").toString());
				examVo.getExamList().get(0).setEvalStudy_code(examNoAndStudyCode.get("studyCode").toString());
				if(examVo.getExamList().get(0).getQuestionList()!=null) {
					for (int j = 0; j < examVo.getExamList().get(0).getQuestionList().size(); j++) {
						examVo.getExamList().get(0).getQuestionList().get(j).setExam_no(examNoAndStudyCode.get("examNo").toString());
						if(examVo.getExamList().get(0).getQuestionList().get(j).getProblemList()!=null) {
							for (int k = 0; k < examVo.getExamList().get(0).getQuestionList().get(j).getProblemList().size(); k++) {
								examVo.getExamList().get(0).getQuestionList().get(j).getProblemList().get(k).setExam_no(examNoAndStudyCode.get("examNo").toString());
								examVo.getExamList().get(0).getQuestionList().get(j).getProblemList().get(k).setProblem_no(problemSeq.get(problemIdx));
								problemIdx++;
							}
						}
					}
				}
				int result = service.createExam(examVo);
				if(result>0) {
					Lsy_ExamVo result2 = service.retrieveExamList(examMap);
					mav.getModel().put("close", "close");
					mav.getModel().put("btnType", "exam");
					return "new/exam";
				}
			}
			return "new/exam";
		}
		
		@PostMapping(value="/professor/updateQuestion", produces="application/json;charset=utf-8")
		@ResponseBody
		public Lsy_ExamVo dsada123(@Validated @RequestBody Lsy_ExamQuestionVo examVo, BindingResult errors) {
			System.out.println(examVo);
			if(examVo!=null) {
				int result = service.updateExam(examVo);
				Map<String, String> examMap = new HashMap<String, String>();
				examMap.put("exam_no", examVo.getExam_no());
				examMap.put("question_no", examVo.getQuestion_no());
				examMap.put("exam_type", examVo.getExam_type());
				Lsy_ExamVo ajaxExam = service.retrieveOneExam(examMap);
				return ajaxExam;
			}
			return null;
		}
		
//		@PostMapping(value="/professor/showQuizz", produces="application/json;charset=utf-8")
//		@ResponseBody
//		public Lsy_QuizQuestionVO showQuizz(@Validated @RequestBody Lsy_QuizQuestionVO quizVo, BindingResult errors) {
//			if(errors.hasErrors()) {
//				System.out.println("에러가 있다.");
//			}
//			int result = service.updateQuiz(quizVo);
//			Lsy_QuizQuestionVO thisQuiz = new Lsy_QuizQuestionVO();
//			if(result > 0) {
//				thisQuiz = service.retrieveOneQuiz(quizVo);
//				System.out.println(thisQuiz);
//			}
//			return thisQuiz;
//		}
		
		@PostMapping("/professor/createExamAnswer")
		public String sdad(@Validated @ModelAttribute Lsy_EmbraceExamAnswer answerList, BindingResult errors, Model model) {
			List<String> result = null;
			model.addAttribute("result", "실패");
			if(!errors.hasErrors()) {
				result = service.answerNoSeqVal(answerList.getAnswerList().size());
			}
			if(result!=null) {
				for (int i = 0; i < answerList.getAnswerList().size(); i++) {
					answerList.getAnswerList().get(i).setAnswer_no(result.get(i));
				}
			}
			int result2 = service.createExamAnswer(answerList);
			if(result2>0) {
//				service.
				model.addAttribute("result", "성공");
			}
			return "new/exam";
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
		public Map<String, List<String>> asdsa(@PathVariable("btnType") String btnType){
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
					else if(btnType.equals("exam")) {
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
