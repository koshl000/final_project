package ddit.finalproject.team2.student.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import ddit.finalproject.team2.student.dao.Ljs_ILectureDao;
import ddit.finalproject.team2.vo.LectureVo;

@Service
public class Ljs_LectureServiceImpl implements Ljs_ILectureService{

	@Inject
	Ljs_ILectureDao dao;

	@Override
	public LectureVo retrieveLecture(String lecture_code) {
		return dao.selectLecture(lecture_code);
	}
	
	
}
