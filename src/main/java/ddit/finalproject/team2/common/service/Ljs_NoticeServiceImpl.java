package ddit.finalproject.team2.common.service;

import java.io.IOException;
import java.util.List;
import java.util.Map.Entry;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.util.MultiValueMap;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import ddit.finalproject.team2.common.dao.Ljs_INoticeAttachmentDao;
import ddit.finalproject.team2.common.dao.Ljs_INoticeDao;
import ddit.finalproject.team2.common.dao.Ljs_IRingDao;
import ddit.finalproject.team2.student.dao.Ljs_IAttendDao;
import ddit.finalproject.team2.vo.AttachmentVo;
import ddit.finalproject.team2.vo.AttendVo;
import ddit.finalproject.team2.vo.LectureVo;
import ddit.finalproject.team2.vo.Ljs_BoardVo;
import ddit.finalproject.team2.vo.RingVo;
import ddit.finalproject.team2.vo.UserVo;

@Service
public class Ljs_NoticeServiceImpl implements Ljs_INoticeService{
	@Inject
	Ljs_INoticeDao noticeDao;
	
	@Inject
	Ljs_INoticeAttachmentDao attachmentDao;
	
	@Inject
	Ljs_IAttendDao attendDao;
	
	@Inject
	Ljs_IRingDao ringDao;
	
	@Resource(name="socketSessionMap")
	MultiValueMap<String, WebSocketSession> socketSessionMap;
	
	@Override
	public List<Ljs_BoardVo> retrieveNoticeList() {
		List<Ljs_BoardVo> list = noticeDao.selectNoticeList();
		
		if(list.size()>0){
			for(int i=0; i<list.size(); i++){
				Ljs_BoardVo vo = list.get(i);
				vo.setBoard_title(vo.getBoard_title(), vo.getBoard_no());
			}
		}
		return list;
	}

	@Override
	public List<Ljs_BoardVo> retrieveNotice(String notice_no) {
		List<Ljs_BoardVo> list = noticeDao.selectNotice(notice_no);
		return list;
	}

	@Override
	public AttachmentVo downloadAttachment(String file_no) {
		AttachmentVo vo = attachmentDao.selectAttachment(file_no);
		return vo;
	}

}
