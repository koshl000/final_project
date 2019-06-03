package ddit.finalproject.team2.vo;

import java.io.Serializable;

import javax.validation.constraints.NotNull;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@Data
@EqualsAndHashCode(of="evalpolicy_code")
@ToString
public class EvaluationPolicyVo implements Serializable{
	@NotNull
	private String evalpolicy_code;
	private String openseme_no;
}
