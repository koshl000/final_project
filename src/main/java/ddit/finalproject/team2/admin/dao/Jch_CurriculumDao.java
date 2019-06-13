package ddit.finalproject.team2.admin.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import ddit.finalproject.team2.vo.Jch_LecturePlanVo;
import ddit.finalproject.team2.vo.Jch_LectureVo;
import ddit.finalproject.team2.vo.Jch_LectureWeekVo;
import ddit.finalproject.team2.vo.Jch_OpenSemesterVo;
import ddit.finalproject.team2.vo.Jch_UserVo;

@Repository
public interface Jch_CurriculumDao {

	List<Jch_UserVo> getProfList();

	List<Jch_LectureVo> getLowerList();

	Jch_OpenSemesterVo getOpenSemester();

	int insertLecutre(Jch_LectureVo lecture);

	List<Jch_LectureVo> getLectureList(String name);

	int insertLectureWeekList(Jch_LectureWeekVo vo);

	int getLectureCode(String code);

	Jch_UserVo getProfInfo(String name);

	Jch_LecturePlanVo getLecturePlanVO();

	int insertLecturePlan(Jch_LecturePlanVo vo);

	Jch_LecturePlanVo getLecturePlanView(String no);

	Jch_LectureVo getLectureData(String no);

	int updateLecutre(Jch_LectureVo lecture);

}
