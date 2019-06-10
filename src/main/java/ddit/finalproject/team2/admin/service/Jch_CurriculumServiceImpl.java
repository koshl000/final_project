package ddit.finalproject.team2.admin.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import ddit.finalproject.team2.admin.dao.Jch_CurriculumDao;
import ddit.finalproject.team2.util.enumpack.ServiceResult;
import ddit.finalproject.team2.vo.Jch_LectureVo;
import ddit.finalproject.team2.vo.Jch_OpenSemesterVo;
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
		return curDao.getLectureList(name);
	}

}
