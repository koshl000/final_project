package ddit.finalproject.team2.student.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import ddit.finalproject.team2.student.dao.Jch_AllLectureDao;
import ddit.finalproject.team2.vo.Jch_LectureVo;

@Service
public class Jch_AllLectureServiceImpl implements Jch_AllLectureService {
	@Inject Jch_AllLectureDao lecDao;

	@Override
	public List<Jch_LectureVo> getAllLectureList() {
		return lecDao.getAllLectureList();
	}
}
