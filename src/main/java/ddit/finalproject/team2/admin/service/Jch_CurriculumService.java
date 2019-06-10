package ddit.finalproject.team2.admin.service;

import java.util.List;

import ddit.finalproject.team2.util.enumpack.ServiceResult;
import ddit.finalproject.team2.vo.Jch_LectureVo;
import ddit.finalproject.team2.vo.Jch_OpenSemesterVo;
import ddit.finalproject.team2.vo.Jch_UserVo;

public interface Jch_CurriculumService {

	List<Jch_UserVo> getProfList();

	List<Jch_LectureVo> getLowerList();

	Jch_OpenSemesterVo getOpenSemester();

	ServiceResult insertLecutre(Jch_LectureVo lecture);

	List<Jch_LectureVo> getLectureList(String name);

}
