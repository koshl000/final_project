package ddit.finalproject.team2.myPack;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ddit.finalproject.team2.myPack.dao.LSY_QuizDAO;
import ddit.finalproject.team2.professor.service.Ljs_IGradeService;
import ddit.finalproject.team2.util.enumpack.ServiceResult;
import ddit.finalproject.team2.vo.Ljs_EvaluationMaterialVo;
import ddit.finalproject.team2.vo.Lsy_EmbraceAnswer;
import ddit.finalproject.team2.vo.Lsy_EmbraceExamAnswer;
import ddit.finalproject.team2.vo.Lsy_EmbraceExamVo;
import ddit.finalproject.team2.vo.Lsy_EmbraceQuizVo;
import ddit.finalproject.team2.vo.Lsy_ExamProblemVo;
import ddit.finalproject.team2.vo.Lsy_ExamQuestionVo;
import ddit.finalproject.team2.vo.Lsy_ExamVo;
import ddit.finalproject.team2.vo.Lsy_LectureInfos;
import ddit.finalproject.team2.vo.Lsy_QuizAnswerVo;
import ddit.finalproject.team2.vo.Lsy_QuizProblemVo;
import ddit.finalproject.team2.vo.Lsy_QuizQuestionVO;
import ddit.finalproject.team2.vo.ProfessorVo;


@Service
public class LSY_QuizServiceImpl implements LSY_IQuizService{
	@Inject
	LSY_QuizDAO quizDao;
	
//	@Inject
//	Ljs_IGradeService ljsService;
	
	@Override
	@Transactional
	public int createQuiz(Lsy_EmbraceQuizVo quizChunk) {
		int quizSize = quizChunk.getQuizList().size();
		List<String> keyList = keyNextVal(quizSize);
		
		for (int i = 0; i < quizSize; i++) {
			quizChunk.getQuizList().get(i).setQuestion_no(keyList.get(i));
		}
		
		
		int result = quizDao.insertQuiz(quizChunk);
		if(result>0) {
			return result;
		}
		return 0;
	}
	
	@Override
	@Transactional
	public int createStAnswer(Lsy_EmbraceAnswer stQuizChunk, Lsy_QuizQuestionVO quizMap) {
		int standard = 0;
		List<String> keys = quizDao.stAnswerNextVal(stQuizChunk.getAnswerList().size());
		for (int i = 0; i < stQuizChunk.getAnswerList().size(); i++) {
			stQuizChunk.getAnswerList().get(i).setQuizAnswer_code(keys.get(i));
		}
		List<Lsy_QuizQuestionVO> result2 = retreiveQuiz(quizMap);
		if(result2!=null) {
			for (int i = 0; i < result2.size(); i++) {
				if(result2.get(i).getQuestion_no().equals(stQuizChunk.getAnswerList().get(i).getQuestion_no())) {
					boolean flag = result2.get(i).getQuestion_answer().equals(stQuizChunk.getAnswerList().get(i).getStSelect_no());
					if(flag==true) {
						standard++;
					}
				}
			}
		}
		if(standard > 2) {
			int result = quizDao.insertStAnswer(stQuizChunk);
		}
		return standard;
	}
	
	@Override
	public List<Lsy_QuizQuestionVO> retreiveQuiz(Lsy_QuizQuestionVO quizInfo) {
		List<Lsy_QuizQuestionVO> thisQuiz = quizDao.selectQuizList(quizInfo);
		if(thisQuiz!=null) {
			return thisQuiz;
		}
		return null;
	}

	@Override
	@Transactional
	public int updateQuiz(Lsy_QuizQuestionVO quizChunk) {
		int result = quizDao.updateQuiz(quizChunk);
		int result2 = 0;
		if(result>0) {
			for (int i = 0; i < quizChunk.getProblemList().size(); i++) {
				result2 += updateProblems(quizChunk.getProblemList().get(i));
			}
			if(result2>0) {
				return result2;
			}
		}
		return result2;
	}

	@Override
	@Transactional
	public int updateProblems(Lsy_QuizProblemVo problemVo) {
		int result = 0; 
		result = quizDao.updateQuizProblems(problemVo);
		if(result>0) {
			return result;
		}
		return result;
	}

	@Override
	@Transactional
	public List<String> keyNextVal(int quizSize) {
		List<String> keyVal = quizDao.keyNextVal(quizSize);
		return keyVal;
	}
	
	@Override
	public Lsy_QuizQuestionVO retrieveOneQuiz(String question_no) {
		Lsy_QuizQuestionVO oneQuizz = quizDao.selectOneQuiz(question_no);
		return oneQuizz;
	}

	@Override
	@Transactional
	public List<String> stAnswerNextVal(int quizSize) {
		List<String> keyVal = quizDao.stAnswerNextVal(quizSize);
		return keyVal;
	}
	
	public List<String> markingTest(List<Lsy_QuizQuestionVO> realAnswer, List<Lsy_QuizAnswerVo> stAnswer) {
		List<String> answerFlag = new ArrayList<String>();
		if(realAnswer.size()==stAnswer.size()) {
			for (int idx = 0; idx < realAnswer.size(); idx++) {
				if(realAnswer.get(idx).getQuestion_answer().replace(" ", "").equals(stAnswer.get(idx).getStSelect_no().replace(" ", ""))) {
					answerFlag.add("O");
				} else {
					answerFlag.add("X");
				}
			}
		}
		return null;
	}

	@Override
	public List<Lsy_QuizQuestionVO> markingTest(Lsy_EmbraceAnswer stQuizChunk) {
		List<Lsy_QuizQuestionVO> result = quizDao.markingTest(stQuizChunk);
		return result;
	}

	@Override
	@Transactional
	public Map<String, Object> examNoNextVal(HashMap<String, String> examMap) {
		String result = quizDao.examNoNextVal();
		Map<String, Object> returnMap = new HashMap<String, Object>();
		if(result!=null) {
			String evalstudy_code = retrieveStudyCode(examMap);
			examMap.put("evalstudy_code", evalstudy_code);
			String examNo = selectExamNo(examMap);
			List<String> problemSeq = problemNoSeqVal(Integer.parseInt(examMap.get("problemSize")));
			returnMap.put("createExamNo", result);
			returnMap.put("examNo", examNo);
			returnMap.put("studyCode", evalstudy_code);
			returnMap.put("problemSeq", problemSeq);
		}
		return returnMap;
	}

	@Override
	public String retrieveStudyCode(HashMap<String, String> examMap) {
		String result = quizDao.selectStudyCode(examMap);
		return result;
	}

	@Override
	@Transactional
	public int createExam(Lsy_EmbraceExamVo examChunk) {
		int result = quizDao.insertExam(examChunk);
		return result;
	}

	@Override
	public Lsy_ExamVo retrieveExamList(HashMap<String, String> examMap) {
		String evalstudy_code = retrieveStudyCode(examMap);
		examMap.put("evalstudy_code", evalstudy_code);
		if(evalstudy_code!=null) {
			examMap.put("evalCode", evalstudy_code);
			String examNo = selectExamNo(examMap);
			if(examNo!=null) {
				examMap.put("exam_no", examNo);
				Lsy_ExamVo result2 = quizDao.selectExamList(examMap);
				return result2;
			} 
		}
		return null;
	}

	@Override
	public List<String> problemNoSeqVal(int problemSize) {
		List<String> problemSeqVal = quizDao.problemNoSeqVal(problemSize);
		return problemSeqVal;
	}

	@Override
	@Transactional
	public int updateExam(Lsy_ExamQuestionVo examVo) {
		int result = quizDao.updateExam(examVo);
		int result2 = 0;
		if(result>0) {
			for (int i = 0; i < examVo.getProblemList().size(); i++) {
				result2 += updateExamProblems(examVo.getProblemList().get(i));
			}
			if(result2>0) {
				return result2;
			}
		}
		return result2;
	}

	@Override
	@Transactional
	public int updateExamProblems(Lsy_ExamProblemVo problemVo) {
		int result = 0; 
		result = quizDao.updateExamProblems(problemVo);
		if(result>0) {
			return result;
		}
		return result;
	}

	@Override
	public Lsy_ExamVo retrieveOneExam(String examNo) {
		Lsy_ExamVo result = quizDao.selectOneExam(examNo);
		if(result!=null) {
			return result;
		}
		return null;
	}

	@Override
	public List<String> answerNoSeqVal(int answerSize) {
		List<String> result = quizDao.answerNoSeqVal(answerSize);
		if(result!=null) {
			return result;
		}
		return null;
	}

	@Override
	@Transactional
	public int createExamAnswer(Lsy_EmbraceExamAnswer answerList, Ljs_EvaluationMaterialVo material, String exam_type) {
		int result = quizDao.insertExamAnswer(answerList);
		if(result>0) {
//			ljsService.createExamGrade(material);
//			if("기말".equals(exam_type)) {
//				ServiceResult serviceResult = ljsService.createAbsenceAndAssignmentGrade(material);
//				if(ServiceResult.OK.equals(serviceResult)) {
					return result;
//				}
//			}
		}
		return 0;
	}

	@Override
	public Lsy_LectureInfos retrieveLectureInfoForViews(String lecture_code) {
		Lsy_LectureInfos lectureInfoVo = quizDao.selectLectureInfoForViews(lecture_code);
		if(lectureInfoVo!=null) {
			return lectureInfoVo;
		}
		return null;
	}

	@Override
	public ProfessorVo retrieveProInfos(String user_id) {
		ProfessorVo proInfos = quizDao.selectProInfos(user_id);
		if(proInfos!=null) {
			return proInfos;
		}
		return null;
	}

	@Override
	public Lsy_LectureInfos retreiveLectureInfoForList(Map<String, String> proMap) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Lsy_LectureInfos retrieveLectureInfoForOneViews(Map<String, String> lectureMap) {
		Lsy_LectureInfos result = quizDao.selectLectureInfoForOneViews(lectureMap);
		if(result!=null) {
			return result;
		}
		return null;
	}

	@Override
	public List<Lsy_ExamVo> retrieveEvalStudyCodes(String lecture_code) {
		List<Lsy_ExamVo> result = quizDao.selectEvalStudyCodes(lecture_code);
		if(result!=null) {
			return result;
		}
		return null;
	}

	@Override
	public String selectExamNo(Map<String, String> examMap) {
		String examNo = quizDao.selectExamNo(examMap);
		if(examNo!=null) {
			return examNo;
		}
		return null;
	}

	@Override
	public Lsy_ExamVo retrieveUpdatedExam(Map<String, String> examMap) {
		Lsy_ExamVo result = quizDao.selectUpdatedExam(examMap);
		if(result!=null) {
			return result;
		}
		return null;
	}

//	@Override
//	public List<Lsy_LectureInfos> retreiveLectureInfoForList(Map<String, String> proMap) {
//		List<Lsy_LectureInfos> lectureInfo = quizDao.selectLectureInfoForList(proMap);
//		if(lectureInfo!=null) {
//			return lectureInfo;
//		}
//		return null;
//	}
}
