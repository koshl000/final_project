package ddit.finalproject.team2.vo;

import java.io.Serializable;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@Data
@EqualsAndHashCode
@ToString
public class Ljs_InvitationVo implements Serializable{
	private String targetId;
	private String roomId;
	private String lecture_code;
}
