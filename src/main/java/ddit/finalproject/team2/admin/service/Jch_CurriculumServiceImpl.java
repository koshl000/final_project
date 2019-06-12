package ddit.finalproject.team2.admin.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import ddit.finalproject.team2.admin.dao.Jch_CurriculumDao;
import ddit.finalproject.team2.util.enumpack.ServiceResult;
import ddit.finalproject.team2.vo.Jch_LecturePlanVo;
import ddit.finalproject.team2.vo.Jch_LectureVo;
import ddit.finalproject.team2.vo.Jch_LectureWeekVo;
import ddit.finalproject.team2.vo.Jch_OpenSemesterVo;
import ddit.finalproject.team2.vo.Jch_SMSVo;
import ddit.finalproject.team2.vo.Jch_UserVo;

@Service
public class Jch_CurriculumServiceImpl implements Jch_CurriculumService {

	@Inject
	Jch_CurriculumDao curDao;
	
	@Override
	public List<Jch_UserVo> getProfList() {
		return curDao.getProfList();
	}

	@Override
	public List<Jch_LectureVo> getLowerList() {
		return curDao.getLowerList();
	}

	@Override
	public Jch_OpenSemesterVo getOpenSemester() {
		return curDao.getOpenSemester();
	}

	@Override
	public ServiceResult insertLecutre(Jch_LectureVo lecture) {
		int rowCnt = curDao.insertLecutre(lecture);
		ServiceResult result = ServiceResult.FAILED;
		if (rowCnt > 0) {
			result = ServiceResult.OK;
		}
		return result;
	}

	@Override
	public List<Jch_LectureVo> getLectureList(String name) {
		List<Jch_LectureVo> lecList = curDao.getLectureList(name);
		 
		for(Jch_LectureVo vo : lecList) {
			if(vo.getChecklec()==0) 
				vo.setLectureAddBtn("<button class='btn btn-default notika-btn-default waves-effect lectureAddBtn'>주차등록</button>");
			if(vo.getCheckplan()==0) 
				vo.setLecturePlanBtn("<button class='btn btn-default notika-btn-default waves-effect lecPlanAddBtn'>등록</button>");
			vo.setLecture_code("<a href='register/"+vo.getLecture_code()+"'>"+vo.getLecture_code()+"</a>");
		}
		return lecList;
	}

	@Override
	public ServiceResult insertLectureWeekList(Jch_LectureWeekVo vo) {
		int rowCnt = curDao.insertLectureWeekList(vo);
		ServiceResult result = ServiceResult.FAILED;
		if (rowCnt > 0) {
			result = ServiceResult.OK;
		}
		return result;
	}

	@Override
	public ServiceResult getLectureCode(String code) {
		int rowCnt = curDao.getLectureCode(code);
		ServiceResult result = ServiceResult.FAILED;
		if (rowCnt > 0) {
			result = ServiceResult.OK;
		}
		return result;
	}

	@Override
	public Jch_UserVo getProfInfo(String name) {
		return curDao.getProfInfo(name);
	}

	@Override
	public Jch_LecturePlanVo getLecturePlanVO() {
		return curDao.getLecturePlanVO();
	}

	@Override
	public ServiceResult insertLecturePlan(Jch_LecturePlanVo vo) {
		int rowCnt = curDao.insertLecturePlan(vo);
		ServiceResult result = ServiceResult.FAILED;
		if (rowCnt > 0) {
			result = ServiceResult.OK;
		}
		return result;
	}

	@Override
	public Jch_LecturePlanVo getLecturePlanView(String no) {
		return curDao.getLecturePlanView(no);
	}

	@Override
	public Jch_LectureVo getLectureData(String no) {
		return curDao.getLectureData(no);
	}

}
