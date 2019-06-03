package ddit.finalproject.team2.student.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import ddit.finalproject.team2.vo.Jch_LectureVo;

@Repository
public interface Jch_AllLectureDao {

	List<Jch_LectureVo> getAllLectureList();

}
