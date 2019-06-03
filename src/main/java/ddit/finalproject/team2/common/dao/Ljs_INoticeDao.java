package ddit.finalproject.team2.common.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import ddit.finalproject.team2.vo.Ljs_BoardVo;

@Repository
public interface Ljs_INoticeDao {
	List<Ljs_BoardVo> selectNoticeList();
	List<Ljs_BoardVo> selectNotice(String notice_no);
	int incrementHit(String notice_no);
}
