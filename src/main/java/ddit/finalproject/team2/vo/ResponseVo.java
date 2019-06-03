package ddit.finalproject.team2.vo;

import java.io.Serializable;

import javax.validation.constraints.NotNull;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@Data
@EqualsAndHashCode(of="resp_no")
@ToString
public class ResponseVo implements Serializable{
	@NotNull private String resp_no;
	@NotNull private String resp_keyword;
}
