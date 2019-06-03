package ddit.finalproject.team2.admin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import ddit.finalproject.team2.admin.dao.KJE_IStatisticsDao;
import ddit.finalproject.team2.vo.AttendVo;
import ddit.finalproject.team2.vo.KJE_BoardTypeCntVo;
import ddit.finalproject.team2.vo.KJE_OperationStatisticsVo;
import ddit.finalproject.team2.vo.KJE_ProfessorVo;
import ddit.finalproject.team2.vo.KJE_ReplyTypeCntVo;
import ddit.finalproject.team2.vo.KJE_SemesterVo;
import ddit.finalproject.team2.vo.KJE_StlectureVo;
import ddit.finalproject.team2.vo.KJE_TimeStatisticsVo;
import ddit.finalproject.team2.vo.LectureAccessStatsVo;
import ddit.finalproject.team2.vo.OpenSemesterVo;
import ddit.finalproject.team2.vo.OrganizationVo;
import ddit.finalproject.team2.vo.PortalAccessStatsVo;

@Service
public class KJE_StatisticsServiceImpl implements KJE_IStatisticsService {

	@Inject
	KJE_IStatisticsDao statisticsDao;
	
	@Override
	public List<OrganizationVo> getUpperOrganization() {
		 List<OrganizationVo> upperOrganizationList = statisticsDao.selectUpperOrganization();
		return upperOrganizationList;
	}

	@Override
	public List<OrganizationVo> getLowerOrganization() {
		 List<OrganizationVo> lowerOrganizationList = statisticsDao.selectLowerOrganization();
		return lowerOrganizationList;
	}

	@Override
	public int recodeLectureAccessStats(Map<String, String> userinfo) {
		AttendVo attend = statisticsDao.selectAttend(userinfo);
		LectureAccessStatsVo lectureAccessStats = new LectureAccessStatsVo();
		lectureAccessStats.setAcc_ip(userinfo.get("acc_ip"));
		lectureAccessStats.setAttend_no(attend.getAttend_no());
		int result = statisticsDao.insertLectureAccessStats(lectureAccessStats);
		
		return result;
	}
	
	@Override
	public int recodeMainAccessStats(PortalAccessStatsVo potalAccessStats) {
		int result = statisticsDao.insertMainAccessStats(potalAccessStats);
		return result;
	}


	@Override
	public List<KJE_TimeStatisticsVo> getLectureStatistics(Map<String, String> stinfo) {
		List<KJE_TimeStatisticsVo> timeStatisticsList = statisticsDao.selectLectureStatistics(stinfo); 
		return timeStatisticsList;
	}

	@Override
	public List<KJE_ProfessorVo> getProfessorList() {
		List<KJE_ProfessorVo> professorList = statisticsDao.selectProfessorList();
		return professorList;
	}

	@Override
	public Map<String, String> getProBehaviorStatistics(Map<String, String> stinfo) {
		Map<String, String> proBehaviorSta = new HashMap<String, String>();
		List<KJE_BoardTypeCntVo> boardCntList =statisticsDao.selectBoardTypeCnt(stinfo);
		KJE_ReplyTypeCntVo replyCnt= statisticsDao.selectReplyTypeCnt(stinfo);
		if(boardCntList.size()==0){
			proBehaviorSta.put("notice","0");
			proBehaviorSta.put("normal","0");
		}else{

			for(int i=0;i<boardCntList.size();i++){
				if("강좌공지".equals(boardCntList.get(i).getBoard_type())){
					proBehaviorSta.put("notice",boardCntList.get(i).getBoard_cnt());
				}else if("일반".equals(boardCntList.get(i).getBoard_type())){
					proBehaviorSta.put("normal",boardCntList.get(i).getBoard_cnt());
				}
				
			}
			
		}
		if(replyCnt==null){
			
			proBehaviorSta.put("reply","0");
		}else{
			
			proBehaviorSta.put("reply",replyCnt.getReply_cnt());
		}
		
		return proBehaviorSta;
	}

	@Override
	public List<KJE_TimeStatisticsVo> getPotalStatistics(Map<String, String> stinfo) {
		List<KJE_TimeStatisticsVo> timeStatisticsList = statisticsDao.selectPotalStatistics(stinfo); 
		return timeStatisticsList;
	}

	@Override
	public List<KJE_SemesterVo> getSemesterList() {
		List<KJE_SemesterVo> semesterList = statisticsDao.selectSemesterList();
		return semesterList;
	}

	@Override
	public List<KJE_OperationStatisticsVo> getOperationStList(Map<String, String> stinfo) {
		List<KJE_OperationStatisticsVo> OperationStList = statisticsDao.selectOperationStList(stinfo);
		
		return OperationStList;
	}

	@Override
	public OpenSemesterVo getThisTimeSemester(String today) {
		OpenSemesterVo openseme_no = statisticsDao.selectThisTimeSemester(today);
		return openseme_no;
	}

	@Override
	public List<KJE_StlectureVo> getStLecture(String openseme_no) {
		 List<KJE_StlectureVo> stLectureList = statisticsDao.selectStLecture(openseme_no);
			return stLectureList;
	}

	
	

}
