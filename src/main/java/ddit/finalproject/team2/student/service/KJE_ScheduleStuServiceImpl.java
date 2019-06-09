package ddit.finalproject.team2.student.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.stereotype.Service;

import ddit.finalproject.team2.admin.dao.KJE_IManageBasicInfoDao;
import ddit.finalproject.team2.admin.dao.KJE_IStatisticsDao;
import ddit.finalproject.team2.student.dao.KJE_IScheduleStuDao;
import ddit.finalproject.team2.vo.KJE_OpenSemesterVo;
import ddit.finalproject.team2.vo.KJE_ScheduleVo;
import ddit.finalproject.team2.vo.KJE_fullcalenderVo;
import ddit.finalproject.team2.vo.OpenSemesterVo;

@Service
public class KJE_ScheduleStuServiceImpl implements KJE_IScheduleStuService {
	
	@Inject
	KJE_IScheduleStuDao scheduleStuDao; 
	
	@Inject
	KJE_IManageBasicInfoDao manageBasicInfoDao; 
	
	@Inject
	KJE_IStatisticsDao statisticsDao;

	@Override
	public Map<String, List<KJE_fullcalenderVo>> retriveScheduleStuList(String user_id) {
 		
		List<KJE_fullcalenderVo> schedule = new ArrayList<>();
		List<KJE_ScheduleVo> scheduleList = scheduleStuDao.selectScheduleList(user_id);
		Map<String, List<KJE_fullcalenderVo>> resp = new HashedMap();

		for(int i=0;i<scheduleList.size();i++){
			KJE_fullcalenderVo calender = new KJE_fullcalenderVo();
			calender.setSeq(scheduleList.get(i).getSchedule_no());
			calender.setTitle(scheduleList.get(i).getLecture_name()+":"+scheduleList.get(i).getSchedule_title());
			calender.setWriteDate(scheduleList.get(i).getSchedule_add());
			calender.setStartDate(scheduleList.get(i).getSchedule_start());
			calender.setEndDate(scheduleList.get(i).getSchedule_end());
			calender.setBgcolor(scheduleList.get(i).getSchedule_color());
			calender.setStatus("use");
			schedule.add(calender);
		}
		
		
		Date date = new Date();
		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyyMMdd");
		String todayString =sdFormat.format(date);
		OpenSemesterVo thisTimeSemester =statisticsDao.selectThisTimeSemester(todayString);
		String openseme_no =thisTimeSemester.getOpenseme_no();
		KJE_OpenSemesterVo openSemesterVo= manageBasicInfoDao.selectBInfo(openseme_no);
		
		KJE_fullcalenderVo attend = new KJE_fullcalenderVo();
		attend.setSeq("s1");
		attend.setTitle("수강신청기간");
		attend.setWriteDate(openSemesterVo.getOpenseme_attend1());
		attend.setStartDate(openSemesterVo.getOpenseme_attend1());
		attend.setEndDate(openSemesterVo.getOpenseme_attend2());
		attend.setBgcolor("#00c292");
		attend.setStatus("use");
		schedule.add(attend);
		
		KJE_fullcalenderVo checkgradeMidterm = new KJE_fullcalenderVo();
		checkgradeMidterm.setSeq("s2");
		checkgradeMidterm.setTitle("중간고사 성적 열람기간");
		checkgradeMidterm.setWriteDate(openSemesterVo.getOpenseme_checkgrade1());
		checkgradeMidterm.setStartDate(openSemesterVo.getOpenseme_checkgrade1());
		checkgradeMidterm.setEndDate(openSemesterVo.getOpenseme_checkgrade2());
		checkgradeMidterm.setBgcolor("#00c292");
		checkgradeMidterm.setStatus("use");
		schedule.add(checkgradeMidterm);
		
		KJE_fullcalenderVo checkgradeFinals = new KJE_fullcalenderVo();
		checkgradeFinals.setSeq("s3");
		checkgradeFinals.setTitle("기말고사 성적 열람기간");
		checkgradeFinals.setWriteDate(openSemesterVo.getOpenseme_checkgrade3());
		checkgradeFinals.setStartDate(openSemesterVo.getOpenseme_checkgrade3());
		checkgradeFinals.setEndDate(openSemesterVo.getOpenseme_checkgrade4());
		checkgradeFinals.setBgcolor("#00c292");
		checkgradeFinals.setStatus("use");
		schedule.add(checkgradeFinals);
		
		KJE_fullcalenderVo evaluate= new KJE_fullcalenderVo();
		evaluate.setSeq("s4");
		evaluate.setTitle("강의평가기간");
		evaluate.setWriteDate(openSemesterVo.getOpenseme_evaluate1());
		evaluate.setStartDate(openSemesterVo.getOpenseme_evaluate1());
		evaluate.setEndDate(openSemesterVo.getOpenseme_evaluate2());
		evaluate.setBgcolor("#00c292");
		evaluate.setStatus("use");
		schedule.add(evaluate);
		
		resp.put("schedule",schedule);
		return resp;
	}

}
