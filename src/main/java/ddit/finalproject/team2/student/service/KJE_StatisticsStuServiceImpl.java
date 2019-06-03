package ddit.finalproject.team2.student.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import ddit.finalproject.team2.student.dao.KJE_IStatisticsStuDao;
import ddit.finalproject.team2.vo.GradeVo;

@Service
public class KJE_StatisticsStuServiceImpl implements KJE_IStatisticsStuService{
	
	@Inject
	KJE_IStatisticsStuDao statisticsStuDao; 
	
	@Override
	public GradeVo getStudyState(String attend_no) {
		GradeVo userGrade = statisticsStuDao.selectStudyState(attend_no);
		return userGrade;
	}

	@Override
	public GradeVo getAvgStudyState(String lecture_code) {
		GradeVo avgGrade =statisticsStuDao.selectAvgStudyState(lecture_code);
		return avgGrade;
	}

	@Override
	public String getLectureName(String lecture_code) {
		
		String LectureName = statisticsStuDao.selectLectureName(lecture_code);
		
		return LectureName;
	}

}
