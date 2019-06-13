package ddit.finalproject.team2.student.service;

import java.util.ArrayList;
import java.util.Calendar;
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
import ddit.finalproject.team2.vo.Ljs_GradeDetailVo;
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
		List<Ljs_SearchGradeVo> searchData = dao.selectAverageList(user_id);
		float pastTotalGrade = 0;
		int pastTotalCredit = 0;
		for(Ljs_SearchGradeVo search : searchData){
			search.setSeme(search.getSemester().getOpenseme_year()+"학년도/"+search.getSemester().getOpenseme_semester()+"학기"
				, search.getSemester().getOpenseme_no());
			
			int semeYear = Integer.parseInt(search.getSemester().getOpenseme_year());
			int year = Calendar.getInstance().get(1);
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
			
			List<AttendVo> completeList = new ArrayList<>();
			for(GradeVo grade : search.getAverageList()){
				String average = grade.getAverage();
				if(average!=null){
					if(max<=Float.parseFloat(average)){
						AttendVo attend = attendDao.selectAttend(grade.getAttend_no());
						completeList.add(attend);
					}
				}
			}
			search.setCompleteLecture(completeList.size()+"");
			
			int totalCredit = 0;
			int completeCredit = 0;
			float totalGrade = 0;
			for(LectureVo lecture : search.getLectureList()){
				totalCredit+=Integer.parseInt(lecture.getLecture_credit());
				for(AttendVo attend : completeList){
					if(attend.getLecture_code().equals(lecture.getLecture_code())){
						int credit = Integer.parseInt(lecture.getLecture_credit());
						completeCredit += credit;
						for(GradeVo grade : search.getAverageList()){
							if(attend.getAttend_no().equals(grade.getAttend_no())){
								totalGrade += Float.parseFloat(grade.getAverage())*credit;
								search.getAverageList().remove(grade);
								break;
							}
						}
						completeList.remove(attend);
						break;
					}
				}
			}
			pastTotalCredit += totalCredit;
			pastTotalGrade += totalGrade;
			search.setCompleteCredit(completeCredit+"");
			search.setTotalGrade((int)totalGrade+"");
			search.setTotalAverage(Math.floor(totalGrade/totalCredit*100)/100f+"");
			search.setAccumulateAverage(Math.floor(pastTotalGrade/pastTotalCredit*100)/100f+"");
		}
		return searchData;
	}

	@Override
	public List<Ljs_GradeDetailVo> retrieveGradeDetail(Ljs_GradeDetailVo detail) {
		List<Ljs_GradeDetailVo> detailList = dao.selectGradeDetail(detail);
		List<GradeRankVo> rankList = rankDao.selectGradeRank(detail.getOpenseme_no());
		
		float rateA = 0;
		float rateB = 0;
		float[] minArr = new float[5];
		for(GradeRankVo rank : rankList){
			int type = RankType.matchType(rank);
			minArr[type] = Float.parseFloat(rank.getGraderank_min());
		}
		
		int countA = 0;
		int countB = 0;
		for(Ljs_GradeDetailVo de : detailList){
			int lecture_current = 40;
			int capacityA = (int) (lecture_current*rateA/100);
			int capacityB = (int) (lecture_current*rateB/100);
			if(de.getGrade().getAverage()!=null){
				float average = Float.parseFloat(de.getGrade().getAverage());
				for(int i=0; i<minArr.length; i++){
					if(average>=minArr[0]){
						de.setRank("A");
					}else if(average>=minArr[1]){
							de.setRank("B");
					}else if(average>=minArr[2]){
						de.setRank("C");
					}else if(average>=minArr[3]){
						de.setRank("D");
					}else{
						de.setRank("F");
					}
				}
			}
		}
		return detailList;
	}
}

