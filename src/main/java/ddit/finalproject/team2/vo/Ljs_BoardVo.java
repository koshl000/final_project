package ddit.finalproject.team2.vo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.validation.constraints.NotNull;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import ddit.finalproject.team2.util.hint.InsertHint;
import ddit.finalproject.team2.util.hint.UpdateHint;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@Data
@EqualsAndHashCode(of="board_no")
@ToString(exclude={
	"board_content", "replyList", "deleteAttachmentNos"
	, "attachmentList", "savedAttachmentList", "bo_files", "user"
})
public class Ljs_BoardVo implements Serializable{
	private String board_no;
	@NotNull(groups=InsertHint.class) private String board_type;
	private String board_attachmentcount;
	private String board_date;
	@NotNull(groups={InsertHint.class, UpdateHint.class}) private String board_title;
	@NotNull(groups=InsertHint.class) private String writer;
	@NotNull(groups={InsertHint.class, UpdateHint.class}) private String board_content;
	private String board_hit;
	@NotNull(groups=InsertHint.class) private String lecture_code;
	private String attend_no;
	
	private LectureVo lecture;
	private String lecture_name;
	private String professor_id;
	
	private List<Ljs_ReplyVo> replyList;
	private int replycount;
	private UserVo user;
	
	private Integer startAttachmentNo;
	private String[] deleteAttachmentNos;
	private List<AttachmentVo> attachmentList;
	private List<AttachmentVo> savedAttachmentList;
	private MultipartFile[] bo_files;
	
	public void setBoard_title(String board_title, String board_no){
		this.board_title = "<a href='"+board_no+"'>"+board_title+"</a>";
	}
	
	public void setBo_files(MultipartFile[] bo_files) {
		if(bo_files==null) return;
		this.bo_files = bo_files;
		this.board_attachmentcount = bo_files.length+"";
		this.attachmentList = new ArrayList<>();
		for(MultipartFile file : bo_files){
			if(StringUtils.isBlank(file.getOriginalFilename())) continue;
			attachmentList.add(new AttachmentVo(file));
		}
	}
	
	public void setUser(String user_id){
		user = new UserVo(user_id);
	}

	public Ljs_BoardVo(String user_id, String lecture_code) {
		this.user = new UserVo(user_id);
		this.lecture_code = lecture_code;
	}
	
	public void setLecture(LectureVo lecture){
		this.lecture = lecture;
		lecture_name = lecture.getLecture_name();
		professor_id = lecture.getUser_id();
	}
}
