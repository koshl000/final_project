package ddit.finalproject.team2.admin.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import ddit.finalproject.team2.common.dao.Ljs_INoticeDao;
import ddit.finalproject.team2.student.dao.Ljs_IBoardDao;
import ddit.finalproject.team2.vo.Ljs_BoardVo;

@Service
public class Ljs_ManageBoardServiceImpl implements Ljs_IManageBoardService{
	@Inject
	Ljs_IBoardDao boardDao;
	
	@Inject
	Ljs_INoticeDao noticeDao;

	@Override
	public List<Ljs_BoardVo> retrieveAllBoard() {
		return null;
	}

}
