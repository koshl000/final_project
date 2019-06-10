package ddit.finalproject.team2.student.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import ddit.finalproject.team2.vo.LectureVo;

@Repository
public interface Ljs_ILectureDao {
	LectureVo selectLecture(String lecture_code);
}
