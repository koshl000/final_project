package ddit.finalproject.team2.common.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import ddit.finalproject.team2.common.dao.Ljs_IRingDao;
import ddit.finalproject.team2.util.enumpack.ServiceResult;
import ddit.finalproject.team2.vo.RingVo;

@Service
public class Ljs_RingServiceImpl implements Ljs_IRingService{
	@Inject
	Ljs_IRingDao dao;

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

}
