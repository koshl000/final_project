package ddit.finalproject.team2.myPack.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import ddit.finalproject.team2.vo.Lsy_EmbraceAnswer;
import ddit.finalproject.team2.vo.Lsy_EmbraceExamAnswer;
import ddit.finalproject.team2.vo.Lsy_EmbraceExamVo;
import ddit.finalproject.team2.vo.Lsy_EmbraceQuizVo;
import ddit.finalproject.team2.vo.Lsy_ExamProblemVo;
import ddit.finalproject.team2.vo.Lsy_ExamQuestionVo;
import ddit.finalproject.team2.vo.Lsy_ExamVo;
import ddit.finalproject.team2.vo.Lsy_LectureInfos;
import ddit.finalproject.team2.vo.Lsy_QuizProblemVo;
import ddit.finalproject.team2.vo.Lsy_QuizQuestionVO;
import ddit.finalproject.team2.vo.ProfessorVo;

@Repository
public interface LSY_QuizDAO {
	public List<Lsy_QuizQuestionVO> selectQuizList(Lsy_QuizQuestionVO quizList);
	public Lsy_QuizQuestionVO selectOneQuiz(String question_no);
	public Lsy_ExamVo selectOneExam(Map<String, String> examMap);
	
	public int insertQuiz(Lsy_EmbraceQuizVo quizChunk);
	public int insertStAnswer(Lsy_EmbraceAnswer stQuizChunk);
	public int insertExam(Lsy_EmbraceExamVo examChunk);
	public int insertExamAnswer(Lsy_EmbraceExamAnswer answerList);
	
	public List<Lsy_QuizQuestionVO> markingTest(Lsy_EmbraceAnswer stQuizChunk);
	
	public int updateQuiz(Lsy_QuizQuestionVO quizVo);
	public int updateQuizProblems(Lsy_QuizProblemVo problemVo);
	public int updateExam(Lsy_ExamQuestionVo examVo);
	public int updateExamProblems(Lsy_ExamProblemVo problemVo);
	
	public List<String> keyNextVal(int quizSize);
	public List<String> stAnswerNextVal(int quizSize);
	public List<String> problemNoSeqVal(int problemSize);
	public String examNoNextVal();
	public List<String> answerNoSeqVal(int answerSize);
	
	public Lsy_ExamVo selectStudyCode(Map<String, String> examMap);
	public Lsy_ExamVo selectExamList(Map<String, String> examMap);
	public Lsy_LectureInfos selectLectureInfoForViews(String lecture_code);
	public Lsy_LectureInfos selectLectureInfoForOneViews(Map<String, String> lectureMap);
	public ProfessorVo selectProInfos(String user_id);
	public List<Lsy_LectureInfos> selectLectureInfoForList(Map<String, String> proMap);
	public List<Lsy_ExamVo> selectEvalStudyCodes(String lecture_code);
	public String selectExamNo(Map<String, String> examMap);
} 
