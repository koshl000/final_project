package ddit.finalproject.team2.student.service;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.flash;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import ddit.finalproject.team2.professor.dao.Ljs_IGradeRankDao;
import ddit.finalproject.team2.student.dao.Ljs_IAttendDao;
import ddit.finalproject.team2.student.dao.Ljs_ISearchGradeDao;
import ddit.finalproject.team2.util.enumpack.RankType;
import ddit.finalproject.team2.vo.AttendVo;
import ddit.finalproject.team2.vo.GradeRankVo;
import ddit.finalproject.team2.vo.GradeVo;
import ddit.finalproject.team2.vo.LectureVo;
import ddit.finalproject.team2.vo.Ljs_SearchGradeVo;

@Service
public class Ljs_SearchGradeServiceImpl implements Ljs_ISearchGradeService{
	@Inject
	Ljs_ISearchGradeDao dao;
	
	@Inject
	Ljs_IGradeRankDao rankDao;
	
	@Inject
	Ljs_IAttendDao attendDao;

	@Override
	public List<Ljs_SearchGradeVo> retrieveGradeList(String user_id) {
		List<Ljs_SearchGradeVo> averageList = dao.selectAverageList(user_id);
		for(Ljs_SearchGradeVo search : averageList){
			search.setSeme(search.getSemester().getOpenseme_year()+"학년도/"+search.getSemester().getOpenseme_semester()+"학기");
			
			int semeYear = Integer.parseInt(search.getSemester().getOpenseme_year());
			int year = Calendar.YEAR;
			String current = search.getMe().getCurrent_year();
			search.setGrade(Integer.parseInt(current)+(year-semeYear)+"학년");
			
			search.setTotalLecture(search.getLectureList().size()+"");
			List<GradeRankVo> rankList = rankDao.selectGradeRank(search.getSemester().getOpenseme_no());
			int max = 0;
			for(GradeRankVo rank : rankList){
				if(RankType.F.equals(rank.getGraderank_rank())){
					max = Integer.parseInt(rank.getGraderank_max());
					break;
				}
			}
			
			int completeCredit = 0;
			int totalCredit = 0;
			List<AttendVo> fList = new ArrayList<>();
			for(GradeVo grade : search.getAverageList()){
				if(max>Integer.parseInt(grade.getAverage())){
					AttendVo attend = attendDao.selectAttend(grade.getAttend_no());
					fList.add(attend);
				}
			}
			search.setCompleteLecture(search.getLectureList().size()-fList.size()+"");
			
			for(LectureVo lecture : search.getLectureList()){
				totalCredit+=Integer.parseInt(lecture.getLecture_credit());
				for(AttendVo attend : fList){
					if(attend.getLecture_code().equals(lecture.getLecture_code())){
						completeCredit+=Integer.parseInt(lecture.getLecture_credit());
						break;
					}
				}
			}
		}
		return averageList;
	}
}
