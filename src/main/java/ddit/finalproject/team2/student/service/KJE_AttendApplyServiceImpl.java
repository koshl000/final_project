package ddit.finalproject.team2.student.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ddit.finalproject.team2.student.dao.KJE_IattendApplyDao;
import ddit.finalproject.team2.vo.KJE_attendApplyVo;
import ddit.finalproject.team2.vo.LecturePlanVo;

@Transactional
@Service
public class KJE_AttendApplyServiceImpl implements KJE_IAttendApplyService {

	@Inject
	KJE_IattendApplyDao attendApplyDao;
	
	@Override
	public List<KJE_attendApplyVo> retriveAttendApplyList(Map<String, String> stuInfo) {
		List<KJE_attendApplyVo> attendApplyList = attendApplyDao.selectAttendApplyList(stuInfo);
		return attendApplyList;
	}

	@Override
	public List<KJE_attendApplyVo> retriveAttendApplyCompList(Map<String, String> stuInfo) {
		List<KJE_attendApplyVo> attendApplycompList= attendApplyDao.selectAttendApplyCompList(stuInfo);
		
		return attendApplycompList;
	}

	@Override
	public LecturePlanVo retriveLecturePlan(String lecture_code) {
		LecturePlanVo lecturePlan = attendApplyDao.selectLecturePlan(lecture_code);
		return lecturePlan;
	}

	@Override
	public int CreateAttend(Map<String, String> stuInfo) {
		int rowCnt = attendApplyDao.insertAttend(stuInfo);
		String lecture_code = stuInfo.get("lecture_code");
		
		attendApplyDao.plusLecture_current(lecture_code);
		return rowCnt;
	}

	@Override
	public int removeAttend(String attend_no) {
		attendApplyDao.minusLecture_current(attend_no);
		int rowCnt= attendApplyDao.deleteAttend(attend_no);
		return rowCnt;
	}

	@Override
	public String retriveSumCredit(String user_id) {
		String sumCredit = attendApplyDao.selectSumCredit(user_id);
		return sumCredit;
	}

}
