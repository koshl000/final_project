package ddit.finalproject.team2.common.service;

import java.io.IOException;
import java.util.List;
import java.util.Map.Entry;
import java.util.concurrent.ConcurrentMap;
import java.util.concurrent.CopyOnWriteArrayList;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import ddit.finalproject.team2.common.dao.Ljs_INoticeAttachmentDao;
import ddit.finalproject.team2.common.dao.Ljs_INoticeDao;
import ddit.finalproject.team2.common.dao.Ljs_IRingDao;
import ddit.finalproject.team2.common.dao.Ljs_IUserDao;
import ddit.finalproject.team2.vo.AttachmentVo;
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
	Ljs_IUserDao userDao;
	
	@Inject
	Ljs_IRingDao ringDao;
	
	@Resource(name="socketSessionMap")
	ConcurrentMap<String, CopyOnWriteArrayList<WebSocketSession>> socketSessionMap;
	
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
	
	private void processRing(Ljs_BoardVo board) throws IOException{
		//알림 처리(DB)
		UserVo me = (UserVo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String message = "<공지사항> "+me.getUser_name()+" 님이 새 글을 작성했습니다.";
		List<UserVo> userList = userDao.selectUserList();
		for(UserVo user : userList){
			if(!user.getUser_id().equals(me.getUser_id())){
				ringDao.insertRing(new RingVo(null, user.getUser_id(), me.getUser_id()
						, "공지사항", null, "/notice/"+board.getBoard_no(), null, null, "N", message));
			}
		}
		
		//알림 처리(푸쉬 메세지)
		for(Entry<String, CopyOnWriteArrayList<WebSocketSession>> e : socketSessionMap.entrySet()){
			for(WebSocketSession session : e.getValue()){
				UserVo user = (UserVo) ((Authentication)session.getPrincipal()).getPrincipal();
				if(!user.getUser_id().equals(me.getUser_id())){
					session.sendMessage(new TextMessage(message));
				}
			}
		}
	}

}
