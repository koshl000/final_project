package ddit.finalproject.team2.student.service;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Map.Entry;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.MultiValueMap;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import ddit.finalproject.team2.common.dao.Ljs_IRingDao;
import ddit.finalproject.team2.student.dao.Ljs_IAttachmentDao;
import ddit.finalproject.team2.student.dao.Ljs_IAttendDao;
import ddit.finalproject.team2.student.dao.Ljs_IBoardDao;
import ddit.finalproject.team2.student.dao.Ljs_IReplyDao;
import ddit.finalproject.team2.util.enumpack.ServiceResult;
import ddit.finalproject.team2.util.exception.CommonException;
import ddit.finalproject.team2.vo.AttachmentVo;
import ddit.finalproject.team2.vo.AttendVo;
import ddit.finalproject.team2.vo.LectureVo;
import ddit.finalproject.team2.vo.Ljs_BoardVo;
import ddit.finalproject.team2.vo.RingVo;
import ddit.finalproject.team2.vo.UserVo;

@Service
public class Ljs_BoardServiceImpl implements Ljs_IBoardService{
	@Inject
	Ljs_IBoardDao boardDao;
	
	@Inject
	Ljs_IReplyDao replyDao;
	
	@Inject
	Ljs_IAttendDao attendDao;
	
	@Inject
	WebApplicationContext container;
	
	@Value("#{appInfo['attachmentPath']}")
	String attachmentPath;
	
	@Inject
	Ljs_IAttachmentDao attachmentDao;
	
	@Inject
	Ljs_IRingDao ringDao;
	
	@Resource(name="socketSessionMap")
	MultiValueMap<String, WebSocketSession> socketSessionMap;
	
	public void preProcessAttachmentList(Ljs_BoardVo board){
		List<AttachmentVo> attachList = board.getAttachmentList();
		if(attachList==null) return;
		
		int i=1;
		for(AttachmentVo vo : attachList){
			String saveName = UUID.randomUUID().toString();
			File saveFile = new File(attachmentPath, saveName);
			vo.setFile_path(saveFile.getAbsolutePath());
			vo.setFile_order(i+"");
			i++;
		}
	}
	
	private void processAttachment(Ljs_BoardVo board){
		preProcessAttachmentList(board);
		
		List<AttachmentVo> attachList = board.getAttachmentList();
		if(attachList!=null && attachList.size()>0){
			attachmentDao.insertAttachmentAll(board);
			for(AttachmentVo vo : attachList){
				String savePath = vo.getFile_path();
				MultipartFile item = vo.getFileItem();
				try(
					InputStream is = item.getInputStream();
					){
					FileUtils.copyInputStreamToFile(is, new File(savePath));
				} catch (IOException e) {
					throw new RuntimeException(e);
				}
			}
		}
		
		String[] delAttachNos = board.getDeleteAttachmentNos();
		if(delAttachNos!=null && delAttachNos.length>0){
			List<AttachmentVo> delAttachList = attachmentDao.selectAttachmentList(board);
			attachmentDao.deleteAttachmentAll(board);
			deleteRealAttachment(delAttachList);
		}
	}
	
	private void deleteRealAttachment(List<AttachmentVo> attachmentList){
		if(attachmentList!=null){
			for(AttachmentVo vo : attachmentList){
				if(vo==null) continue;
				String savedPath = vo.getFile_path();
				if(savedPath!=null){
					FileUtils.deleteQuietly(new File(savedPath));
				}
			}
		}
	}
	
	@Override
	public List<Ljs_BoardVo> retrieveBoardList(String lecture_code) {
		List<Ljs_BoardVo> boardList = boardDao.selectBoardList(lecture_code);
		
		if(boardList.size()>0){
			for(int i=0; i<boardList.size(); i++){
				Ljs_BoardVo vo = boardList.get(i);
				vo.setBoard_title(vo.getBoard_title(), vo.getBoard_no());
				vo.setReplycount(replyDao.selectReplyCount(vo.getBoard_no()));
			}
		}
		
		return boardList;
	}

	@Override
	public List<Ljs_BoardVo> retrieveBoard(String board_no) {
		boardDao.incrementHit(board_no);
		
		List<Ljs_BoardVo> board = boardDao.selectboard(board_no);
		if(board.size()>0){
			for(Ljs_BoardVo b : board){
				b.setBoard_attachmentcount(b.getSavedAttachmentList().size()+"");
				if(b.getAttend_no()==null){
					b.setUser(boardDao.selectWriterIdByLectureCode(b.getLecture_code()));
				}else{
					b.setUser(boardDao.selectWriterIdByAttendNo(b.getAttend_no()));
				}
			}
		}
		return board;
	}

	@Override
	public AttachmentVo downloadAttachment(String attachment_no) {
		AttachmentVo vo = attachmentDao.selectAttacment(attachment_no);
		return vo;
	}

	@Transactional
	@Override
	public ServiceResult createBoard(Ljs_BoardVo board) throws IOException {
		ServiceResult result = ServiceResult.FAILED;
		board.setAttend_no(attendDao.selectAttendNo(board));
		int cnt = boardDao.insertBoard(board);
		if(cnt>0){
			processAttachment(board);
			processRing(board);
			
			result = ServiceResult.OK;
		}
		return result;
	}

	@Transactional
	@Override
	public ServiceResult removeBoard(Ljs_BoardVo board) {
		ServiceResult result = ServiceResult.FAILED;
		List<Ljs_BoardVo> savedList = boardDao.selectboard(board.getBoard_no());
		if(savedList.size()==0) throw new CommonException("해당 게시글 없음");
		
		Ljs_BoardVo saved = null;
		for(Ljs_BoardVo a : savedList){
			if(a.getBoard_no().equals(board.getBoard_no())){
				saved = a;
				break;
			}
		}
		
		if(replyDao.selectReplyList(saved.getBoard_no()).size()!=0){
			replyDao.deleteAllReply(board.getBoard_no());
		}
		
		int cnt = 0;
		List<AttachmentVo> attachList = saved.getSavedAttachmentList();
		if(attachList!=null){
			String[] delNoArr = new String[attachList.size()];
			for(int i=0; i<attachList.size(); i++){
				delNoArr[i] = attachList.get(i).getAttachment_no();
			}
			saved.setDeleteAttachmentNos(delNoArr);
			attachmentDao.deleteAttachmentAll(saved);
			
			cnt = boardDao.deleteBoard(board.getBoard_no());
			if(cnt>0){
				deleteRealAttachment(attachList);
				result = ServiceResult.OK;
			}
		}else{
			boardDao.deleteBoard(board.getBoard_no());
			result = ServiceResult.OK;
		}
		
		
		return result;
	}

	@Transactional
	@Override
	public Ljs_BoardVo modifyBoard(Ljs_BoardVo board) {
		Ljs_BoardVo modified = null;
   		List<Ljs_BoardVo> savedList = retrieveBoard(board.getBoard_no());
		if(savedList.size()==0) throw new CommonException("해당 게시글 없음");
		int cnt = boardDao.updateBoard(board);
		if(cnt>0){
			processAttachment(board);
			for(Ljs_BoardVo a : retrieveBoard(board.getBoard_no())){
				if(a.getBoard_no().equals(board.getBoard_no())){
					modified = a;
					break;
				}
			}
		}
		return modified;
	}
	
	private void processRing(Ljs_BoardVo board) throws IOException{
		//알림 처리(DB)
		UserVo me = (UserVo) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		String message = "<"+board.getLecture_name()+"> "+me.getUser_name()+" 님이 새 글을 작성했습니다.";
		List<AttendVo> attendList = attendDao.selectAttendList(board.getLecture_code());
		int a = ringDao.insertRing(
				new RingVo(null, board.getProfessor_id(), me.getUser_id(), "강좌게시판", null
					, "/"+board.getLecture_code()+"/board/"+board.getBoard_no()
					, null, null, "N", message));
		if(a>0){
			for(AttendVo att : attendList){
				if(!att.getUser_id().equals(me.getUser_id())){
					ringDao.insertRing(
							new RingVo(null, att.getUser_id(), me.getUser_id(), "강좌게시판", null
									, "/"+board.getLecture_code()+"/board/"+board.getBoard_no()
									, null, null, "N", message));
				}
			}
		}
		//알림 처리(푸쉬 메세지)
		for(Entry<String, List<WebSocketSession>> e : socketSessionMap.entrySet()){
			for(WebSocketSession session : e.getValue()){
				if(session.isOpen()){
					UserVo user = (UserVo) ((Authentication)session.getPrincipal()).getPrincipal();
					if((!user.getUser_id().equals(me.getUser_id()) && user.getLectureList().contains(new LectureVo(board.getLecture_code())))
							|| user.getUser_id().equals(board.getProfessor_id())){
						session.sendMessage(new TextMessage(message));
					}
				}
			}
		}
	}
	
}
