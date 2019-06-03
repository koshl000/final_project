package ddit.finalproject.team2.vo;

import java.io.Serializable;
import java.util.Date;

import javax.validation.constraints.NotNull;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@Data
@EqualsAndHashCode(of="reply_no")
@ToString(exclude="reply_content")
public class ReplyVo implements Serializable{
	@NotNull private String board_no;
	@NotNull private String lecture_code;
	@NotNull private String reply_no;
	@NotNull private String attend_no;
	@NotNull private String reply_content;
	@NotNull private Date reply_reg;
}
