package ddit.finalproject.team2.common.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import ddit.finalproject.team2.common.dao.KJE_ChatBotDao;
import ddit.finalproject.team2.util.exception.CommonException;
import ddit.finalproject.team2.vo.KJE_ChatBotScheduleResponseVo;
import ddit.finalproject.team2.vo.KJE_ScheduleVo;
import ddit.finalproject.team2.vo.OpenSemesterVo;
import ddit.finalproject.team2.vo.ScheduleVo;

@Service
public class KJE_ChatBotServiceImpl implements KJE_IChatBotService{
	
	@Inject
	KJE_ChatBotDao chatBotDao;
	
	@Override
	public List<KJE_ChatBotScheduleResponseVo> getOpenSemester(Map<String, String> semester) {
		List<KJE_ChatBotScheduleResponseVo> scheduleResponseList = new ArrayList<>();
		OpenSemesterVo openSemesTer = chatBotDao.selectOpenSemester(semester);
		KJE_ChatBotScheduleResponseVo scheduleResponse = new KJE_ChatBotScheduleResponseVo();
		
		if(openSemesTer==null){
			throw new CommonException("일정이 없습니다.");
		}else{
			String target = semester.get("target");
			scheduleResponse.setScheduleName(target);

			if(target.equals("수강신청기간")){
				scheduleResponse.setStartSchedule(openSemesTer.getOpenseme_attend1().substring(0, 10));
				scheduleResponse.setEndSchedule(openSemesTer.getOpenseme_attend2().substring(0, 10));
				scheduleResponseList.add(scheduleResponse);
			}else if(target.equals("강의평가기간")){
				scheduleResponse.setStartSchedule(openSemesTer.getOpenseme_evaluate1().substring(0, 10));
				scheduleResponse.setEndSchedule(openSemesTer.getOpenseme_evaluate2().substring(0, 10));
				scheduleResponseList.add(scheduleResponse);
			}else if(target.equals("성적열람기간")){
				scheduleResponse.setStartSchedule(openSemesTer.getOpenseme_checkgrade3().substring(0, 10));
				scheduleResponse.setEndSchedule(openSemesTer.getOpenseme_checkgrade4().substring(0, 10));
				scheduleResponseList.add(scheduleResponse);
			}else if(target.equals("개별일정")){
				String user_id=semester.get("user_id");
				List<KJE_ScheduleVo>ScheduleList = chatBotDao.selectSchedule(user_id);
				for(int i = 0;i<ScheduleList.size();i++){
					KJE_ChatBotScheduleResponseVo scheduleResp = new KJE_ChatBotScheduleResponseVo();
					scheduleResp.setScheduleName("개별일정");
					scheduleResp.setScheduleName(ScheduleList.get(i).getLecture_name()+" "+ScheduleList.get(i).getSchedule_title());
					scheduleResp.setStartSchedule(ScheduleList.get(i).getSchedule_start().substring(0,10));
					scheduleResp.setEndSchedule(ScheduleList.get(i).getSchedule_end().substring(0, 10));
					scheduleResponseList.add(scheduleResp);
				}
			}
			
		}
		
		return scheduleResponseList;
	}

}
