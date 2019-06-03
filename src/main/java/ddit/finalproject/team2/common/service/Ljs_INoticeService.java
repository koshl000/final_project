package ddit.finalproject.team2.common.service;

import java.util.List;

import ddit.finalproject.team2.vo.AttachmentVo;
import ddit.finalproject.team2.vo.Ljs_BoardVo;

public interface Ljs_INoticeService {
	List<Ljs_BoardVo> retrieveNoticeList();
	List<Ljs_BoardVo> retrieveNotice(String notice_no);
	AttachmentVo downloadAttachment(String file_no);
}
