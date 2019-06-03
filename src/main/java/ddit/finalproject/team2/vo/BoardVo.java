package ddit.finalproject.team2.vo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.validation.constraints.NotNull;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@Data
@EqualsAndHashCode(of="board_no")
@ToString(exclude="board_content")
public class BoardVo implements Serializable{
	@NotNull
	private String board_no;
	@NotNull
	private String board_type;
	@NotNull
	private String board_attachmentcount;
	@NotNull
	private String board_date;
	@NotNull
	private String board_content;
	@NotNull
	private String board_title;
	@NotNull
	private String board_hit;
	@NotNull
	private String attend_no;
	@NotNull
	private String lecture_code;
	
}
