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
@EqualsAndHashCode(of="notice_no")
@ToString(exclude="notice_content")
public class NoticeVo implements Serializable{
	@NotNull private String notice_no;
	@NotNull private String notice_title;
	@NotNull private String notice_content;
	@NotNull private Date notice_date;
	@NotNull private String notice_hit;
	@NotNull private String notice_writer = "관리자";
}
