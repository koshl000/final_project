package ddit.finalproject.team2.util;

import java.io.IOException;
import java.util.List;
import java.util.Map.Entry;
import java.util.concurrent.ConcurrentMap;
import java.util.concurrent.CopyOnWriteArrayList;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import ddit.finalproject.team2.common.dao.Ljs_IRingDao;
import ddit.finalproject.team2.util.enumpack.RingType;
import ddit.finalproject.team2.vo.AttendVo;
import ddit.finalproject.team2.vo.RingVo;
import ddit.finalproject.team2.vo.UserVo;

public class RingUtils {
	public static void ringForInvitation(String lecture_code, String roomId, List<String> targetIdList, Ljs_IRingDao ringDao
			, ConcurrentMap<String, CopyOnWriteArrayList<WebSocketSession>> socketSessionMap) throws IOException{
		UserVo me = (UserVo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String message = "<"+RingType.INVITATION.getTitle()+"> "+me.getUser_name()+" 님이 초대를 보냈습니다.";
		for(String id : targetIdList){
			ringDao.insertRing(
					new RingVo(null, id, me.getUser_id(), RingType.INVITATION.getTitle(), null
							, "/subjectPage/"+lecture_code+"/mantoman?roomId="+roomId
							, null, null, "N", message));
		}
		
		if(socketSessionMap.size()>0){
			for(Entry<String, CopyOnWriteArrayList<WebSocketSession>> e : socketSessionMap.entrySet()){
				for(WebSocketSession session : e.getValue()){
					UserVo user = (UserVo) ((Authentication)session.getPrincipal()).getPrincipal();
					if(targetIdList.contains(user.getUser_id())){
						session.sendMessage(new TextMessage(message));
					}
				}
			}
		}
	}
	
	public static void ringForAssignment(List<AttendVo> attendList, Ljs_IRingDao ringDao
			, ConcurrentMap<String, CopyOnWriteArrayList<WebSocketSession>> socketSessionMap) throws IOException{
		UserVo me = (UserVo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String message = "<"+RingType.ASSIGNMENT.getTitle()+"> "+me.getUser_name()+" 님이 새 과제물을 등록했습니다.";
		for(AttendVo attender : attendList){
			ringDao.insertRing(
					new RingVo(null, attender.getUser_id(), me.getUser_id(), RingType.INVITATION.getTitle(), null
							, "/subjectPage/"+attender.getLecture_code()+"/lectureAssignment"
							, null, null, "N", message));
		}
		
		if(socketSessionMap.size()>0){
			for(Entry<String, CopyOnWriteArrayList<WebSocketSession>> e : socketSessionMap.entrySet()){
				for(WebSocketSession session : e.getValue()){
					UserVo user = (UserVo) ((Authentication)session.getPrincipal()).getPrincipal();
					for(AttendVo attender : attendList){
						if(attender.getUser_id().equals(user.getUser_id())){
							session.sendMessage(new TextMessage(message));
						}
					}
				}
			}
		}
	}
}
