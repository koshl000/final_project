package ddit.finalproject.team2.vo;

import java.io.Serializable;

import javax.validation.constraints.NotNull;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@Data
@EqualsAndHashCode(of="bot_no")
@ToString
public class ChatbotVo implements Serializable{
	@NotNull
	private String query_no;
	@NotNull
	private String resp_no;
	@NotNull
	private String bot_no;
}
