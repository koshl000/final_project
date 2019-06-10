package ddit.finalproject.team2.professor.service;

import java.util.Calendar;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import ddit.finalproject.team2.professor.dao.Ljs_IPropSearchGradeDao;
import ddit.finalproject.team2.vo.LectureVo;
import ddit.finalproject.team2.vo.OpenSemesterVo;

@Service
public class Ljs_PropSearchGradeServiceImpl implements Ljs_IPropSearchGradeService{
	@Inject
	Ljs_IPropSearchGradeDao dao;

	@Override
	public List<LectureVo> retrieveLectureListforProfessor(LectureVo lecture) {
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
		
		return dao.selectLectureListForProfessor(lecture);
	}

}
