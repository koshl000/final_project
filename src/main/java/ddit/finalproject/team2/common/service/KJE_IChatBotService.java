package ddit.finalproject.team2.common.service;

import java.util.List;
import java.util.Map;

import ddit.finalproject.team2.vo.KJE_ChatBotScheduleResponseVo;
import ddit.finalproject.team2.vo.OpenSemesterVo;

public interface KJE_IChatBotService {

	/**
	 * 해당 년도, 학기의 일정정보를 가저오는 메서드
	 * @param semester 해당 학기의 학기, 일정정보
	 * @return
	 */
	List<KJE_ChatBotScheduleResponseVo> getOpenSemester(Map<String, String> semester);
	
}
