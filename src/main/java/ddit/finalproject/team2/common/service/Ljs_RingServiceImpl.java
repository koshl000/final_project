package ddit.finalproject.team2.common.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ConcurrentMap;
import java.util.concurrent.CopyOnWriteArrayList;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.socket.WebSocketSession;

import ddit.finalproject.team2.common.dao.Ljs_IRingDao;
import ddit.finalproject.team2.util.RingUtils;
import ddit.finalproject.team2.util.enumpack.ServiceResult;
import ddit.finalproject.team2.vo.Ljs_InvitationVo;
import ddit.finalproject.team2.vo.RingVo;

@Service
public class Ljs_RingServiceImpl implements Ljs_IRingService{
	@Inject
	Ljs_IRingDao dao;
	
	@Resource(name="socketSessionMap")
	ConcurrentMap<String, CopyOnWriteArrayList<WebSocketSession>> socketSessionMap;

	@Override
	public List<RingVo> retrieveRingList(String user_id) {
		return dao.selectRingList(user_id);
	}

	@Override
	public ServiceResult modifyRing(String ring_code) {
		ServiceResult result = ServiceResult.FAILED;
		int cnt = dao.updateRing(ring_code);
		if(cnt>0){
			result = ServiceResult.OK;
		}
		return result;
	}

	@Override
	public ServiceResult createInvitationRing(Ljs_InvitationVo vo) {
		ServiceResult result = ServiceResult.FAILED;
		List<String> list = new ArrayList<>();
		list.add(vo.getTargetId());
		try {
			RingUtils.ringForInvitation(vo.getLecture_code(), vo.getRoomId(), list, dao, socketSessionMap);
			result = ServiceResult.OK;
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}
}
