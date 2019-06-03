package ddit.finalproject.team2.common.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import ddit.finalproject.team2.vo.RingVo;

@Repository
public interface Ljs_IRingDao {
	int insertRing(RingVo ring);
	List<RingVo> selectRingList(String user_id);
	int updateRing(String ring_code);
}
