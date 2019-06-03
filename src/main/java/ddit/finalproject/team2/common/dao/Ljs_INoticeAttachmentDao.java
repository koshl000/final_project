package ddit.finalproject.team2.common.dao;

import org.springframework.stereotype.Repository;

import ddit.finalproject.team2.vo.AttachmentVo;

@Repository
public interface Ljs_INoticeAttachmentDao {
	AttachmentVo selectAttachment(String file_no);
}
