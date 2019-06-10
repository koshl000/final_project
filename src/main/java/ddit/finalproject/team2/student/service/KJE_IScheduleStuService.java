package ddit.finalproject.team2.student.service;

import java.util.List;
import java.util.Map;

import ddit.finalproject.team2.vo.KJE_fullcalenderVo;

public interface KJE_IScheduleStuService {
	public Map<String,List<KJE_fullcalenderVo>> retriveScheduleStuList(String user_id);

}
