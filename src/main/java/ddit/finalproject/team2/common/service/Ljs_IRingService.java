package ddit.finalproject.team2.common.service;

import java.util.List;

import ddit.finalproject.team2.util.enumpack.ServiceResult;
import ddit.finalproject.team2.vo.Ljs_InvitationVo;
import ddit.finalproject.team2.vo.RingVo;

public interface Ljs_IRingService {
	List<RingVo> retrieveRingList(String user_id);
	ServiceResult modifyRing(String ring_code);
	ServiceResult createInvitationRing(Ljs_InvitationVo vo);
}
