package ddit.finalproject.team2.myPack;


import java.util.List;

import ddit.finalproject.team2.vo.Lsy_EmbraceQuizVo;
import ddit.finalproject.team2.vo.Lsy_QuizProblemVo;
import ddit.finalproject.team2.vo.Lsy_QuizQuestionVO;


public interface LSY_IQuizService {
	public int insertQuiz(Lsy_EmbraceQuizVo quizChunk);
	
	public List<Lsy_QuizQuestionVO> retreiveQuiz(Lsy_QuizQuestionVO quizList);
	public Lsy_QuizQuestionVO retrieveOneQuiz(Lsy_QuizQuestionVO oneQuiz);
	
	public int updateQuiz(Lsy_QuizQuestionVO quizVo);
	public int updateProblems(Lsy_QuizProblemVo problemVo);
	
	public List<String> keyNextVal(int quizSize);
}
