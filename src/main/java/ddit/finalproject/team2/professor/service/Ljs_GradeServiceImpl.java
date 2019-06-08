package ddit.finalproject.team2.professor.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import ddit.finalproject.team2.professor.dao.Ljs_IEvaluationDao;
import ddit.finalproject.team2.professor.dao.Ljs_IGradeDao;
import ddit.finalproject.team2.student.dao.Ljs_IAttendDao;
import ddit.finalproject.team2.util.enumpack.EvaluationType;
import ddit.finalproject.team2.util.enumpack.ServiceResult;
import ddit.finalproject.team2.util.exception.CommonException;
import ddit.finalproject.team2.vo.AbsenceVo;
import ddit.finalproject.team2.vo.AssignmentVo;
import ddit.finalproject.team2.vo.AttendVo;
import ddit.finalproject.team2.vo.EvaluationStudyVo;
import ddit.finalproject.team2.vo.ExamAnswerVo;
import ddit.finalproject.team2.vo.ExamQuestionVo;
import ddit.finalproject.team2.vo.GradeVo;
import ddit.finalproject.team2.vo.Ljs_EvaluationMaterialVo;
import ddit.finalproject.team2.vo.Ljs_ExamVo;
import ddit.finalproject.team2.vo.SubmitFileVo;

@Service
public class Ljs_GradeServiceImpl implements Ljs_IGradeService{
	@Inject
	Ljs_IEvaluationDao evaluationDao;
	
	@Inject
	Ljs_IGradeDao gradeDao;
	
	@Inject
	Ljs_IAttendDao attendDao;
	
	private String[] evaluateRate(Ljs_EvaluationMaterialVo vo){
		String[] rateArr = new String[4];
		for(EvaluationStudyVo eval : vo.getEvaluationRatio()){
			//반영비율 확보
			EvaluationType.getRateArr(eval.getEvalstudy_type(), eval.getEvalstudy_ratio(), rateArr);
		}
		
		return rateArr;
	}
	
	private GradeVo evaluateExam(String[] rateArr, Ljs_EvaluationMaterialVo vo){
		List<Ljs_ExamVo> examList = vo.getExams();
		GradeVo grade = null;
		if(examList.size()>0){
			for(Ljs_ExamVo exam : examList){
				if(exam!=null){
					grade = new GradeVo(vo.getAttend_no());
					List<ExamQuestionVo> questionList = exam.getQuestionList();
					List<ExamAnswerVo> answerList = exam.getAnswerList();
					
					int score = 0;
					for(int i=0; i<questionList.size(); i++){
						ExamQuestionVo questionVo = questionList.get(i);
						ExamAnswerVo answerVo = answerList.get(i);
						if(questionVo.getQuestion_no().equals(answerVo.getQuestion_no())){
							boolean correct = false;
							if(questionVo.getObjective_answer()!=null){
								//객관식 문항
								if(questionVo.getObjective_answer().equals(answerVo.getProblem_no())){
									correct = true;
								}
							}else if(questionVo.getSubjective_answer()!=null){
								//주관식 문항
								if(questionVo.getSubjective_answer().equals(answerVo.getSubjective_answer())){
									correct = true;
								}
							}else{
								//에러
								throw new CommonException("문제오류 : 답안이 존재하지 않음");
							}
							
							if(correct){
								score++;
							}
						}
					}
					
					String evaluatedScore = (score*5/100f*Integer.parseInt(rateArr[0])*100+0.5f)/100+"";
					if(EvaluationType.MIDTERM.getText().equals(exam.getExam_type())){
						grade.setGrade_midterm(evaluatedScore);
					}else{
						grade.setGrade_final(evaluatedScore);
					}
				}
			}
		}
		return grade;
	}
	
	private GradeVo evaluateAbsenceAndAssignment(String[] rateArr, Ljs_EvaluationMaterialVo vo){
		//출석
		GradeVo grade = new GradeVo(vo.getAttend_no());
		int absDays = 0;
		int absenceScore = 0;
		List<AbsenceVo> absenceList = vo.getAbsenceList();
		if(absenceList.size()>0){
			for(AbsenceVo absence : absenceList){
				if("Y".equals(absence.getAbsence_yn())){
					absDays++;
				}
			}
		}
		
		int percentage = (int)((float)(absDays/absenceList.size())*100+0.5f);
		if(percentage>=80){
			absenceScore = 100;
		}
		grade.setGrade_absence(absenceScore+"");
		
		//과제
		evaluateAssignment(rateArr, vo, grade);
		
		return grade;
	}
	
	private void evaluateAssignment(String[] rateArr, Ljs_EvaluationMaterialVo vo, GradeVo grade){
		List<AssignmentVo> assignNoList = vo.getAssignmentNoList();
		int score = 0;
		float oneAssignmentPoint = 0;
		float assignmentScore = 0;
		if(assignNoList.size()>0){
			List<SubmitFileVo> fileList = vo.getSubmitFileList();
			if(fileList.size()>0){
				for(AssignmentVo no : assignNoList){
					for(SubmitFileVo file : fileList){
						if(no.equals(file.getAssignment_no()) && "P".equals(file.getFile_markscore())){
							score++;
						}
					}
				}
			}
			oneAssignmentPoint = Math.round(100f/assignNoList.size()*100)/100f;
		}
		
		assignmentScore = oneAssignmentPoint*score;
		grade.setGrade_assignment(assignmentScore+"");
	}
	
	@Override
	public ServiceResult createExamGrade(Ljs_EvaluationMaterialVo material) {
		ServiceResult result = ServiceResult.FAILED;
		Ljs_EvaluationMaterialVo vo = evaluationDao.selectExam(material);
		if(vo!=null){
			String[] rateArr = evaluateRate(vo);
			GradeVo grade = evaluateExam(rateArr, vo);
			GradeVo inserted = gradeDao.selectGrade(vo.getAttend_no());
			int cnt = 0;
			if(inserted==null){
				cnt = gradeDao.insertGrade(grade);
			}else{
				inserted.setGrade_final(grade.getGrade_final());
				cnt = gradeDao.updateGrade(inserted);
			}
			if(cnt>0){
				result = ServiceResult.OK;
			}
		}
		return result;
		
	}

	@Override
	public ServiceResult createAbsenceAndAssignmentGrade(Ljs_EvaluationMaterialVo material) {
		ServiceResult result = ServiceResult.FAILED;
		Ljs_EvaluationMaterialVo vo = evaluationDao.selectAbsenceAndAssignment(material);
		if(vo!=null){
			String[] rateArr = evaluateRate(vo);
			GradeVo grade = evaluateAbsenceAndAssignment(rateArr, vo);
			GradeVo inserted = gradeDao.selectGrade(vo.getAttend_no());
			int cnt = 0;
			if(inserted==null){
				cnt = gradeDao.insertGrade(grade);
			}else{
				inserted.setGrade_absence(grade.getGrade_absence());
				inserted.setGrade_assignment(grade.getGrade_assignment());
				cnt = gradeDao.updateGrade(inserted);
			}
			if(cnt>0){
				result = ServiceResult.OK;
			}
		}
		return result;
	}

	@Override
	public ServiceResult evaluateAverage(String lecture_code) {
		ServiceResult result = ServiceResult.FAILED;
		List<GradeVo> gradeList = gradeDao.selectGradeList(lecture_code);
		List<AttendVo> attendList = attendDao.selectAttendList(lecture_code);
		
		for(GradeVo grade : gradeList){
			if(gradeList.size()>0 && gradeList.size()==attendList.size() && grade.getGrade_assignment()!=null){
				float total = Float.parseFloat(grade.getGrade_midterm()) + Float.parseFloat(grade.getGrade_final())
					+ Float.parseFloat(grade.getGrade_absence()) + Float.parseFloat(grade.getGrade_assignment());
				grade.setAverage(Math.floor(total*45/1000*100)/100f+"");
			}else{
				throw new CommonException("성적이 취합되지 않은 학생이 존재합니다.");
			}
		}
		
		int cnt = gradeDao.updateGradeAll(gradeList);
		if(cnt>0){
			result = ServiceResult.OK;
		}
		return result;
	}

}
