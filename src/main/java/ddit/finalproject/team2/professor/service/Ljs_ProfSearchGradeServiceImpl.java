package ddit.finalproject.team2.professor.service;

import java.util.Calendar;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import ddit.finalproject.team2.professor.dao.Ljs_IProfSearchGradeDao;
import ddit.finalproject.team2.vo.LectureVo;
import ddit.finalproject.team2.vo.Ljs_AttendVo;
import ddit.finalproject.team2.vo.OpenSemesterVo;

@Service
public class Ljs_ProfSearchGradeServiceImpl implements Ljs_IProfSearchGradeService{
	@Inject
	Ljs_IProfSearchGradeDao dao;

	private void setSemesterDetail(LectureVo lecture){
		int year = Calendar.getInstance().get(1);
		int month = Calendar.getInstance().get(2);
		String semester = null;
		if(month<=6){
			semester = "1";
		}else {
			semester = "2";
		}
		
		OpenSemesterVo vo = new OpenSemesterVo(year+"", semester);
		String openseme_no = dao.selectOpensemeNo(vo);
		lecture.setOpenseme_no(openseme_no);
	}
	
	@Override
	public List<LectureVo> retrieveLectureListforProfessor(LectureVo lecture) {
		setSemesterDetail(lecture);
		List<LectureVo> lectureList = dao.selectLectureListForProfessor(lecture);
		for(LectureVo lec : lectureList){
			lec.setLecture_name(lec.getLecture_name(), lec.getLecture_code());
		}
		return lectureList;
	}

	@Override
	public List<Ljs_AttendVo> retrieveAttendList(String lecture_code) {
		return dao.selectAttendList(lecture_code);
	}

	@Override
	public List<LectureVo> retrieveLectureListForOpenChat(LectureVo lecture) {
		setSemesterDetail(lecture);
		List<LectureVo> list = dao.selectLectureListForProfessor(lecture);
		for(LectureVo lec : list){
			lec.setOpenBtn(lec.getLecture_code());
		}
		return list;
	}

}
