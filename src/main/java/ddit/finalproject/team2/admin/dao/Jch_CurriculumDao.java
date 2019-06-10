package ddit.finalproject.team2.admin.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import ddit.finalproject.team2.vo.Jch_LectureVo;
import ddit.finalproject.team2.vo.Jch_OpenSemesterVo;
import ddit.finalproject.team2.vo.Jch_UserVo;

@Repository
public interface Jch_CurriculumDao {

	List<Jch_UserVo> getProfList();

	List<Jch_LectureVo> getLowerList();

	Jch_OpenSemesterVo getOpenSemester();

	int insertLecutre(Jch_LectureVo lecture);

	List<Jch_LectureVo> getLectureList(String name);

}
