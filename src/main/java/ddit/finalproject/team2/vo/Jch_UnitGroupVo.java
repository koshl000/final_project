package ddit.finalproject.team2.vo;

import java.io.Serializable;

import javax.validation.constraints.NotNull;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@Data
@EqualsAndHashCode(of="unitgroup_no")
@ToString
public class Jch_UnitGroupVo implements Serializable{
	@NotNull private String smsgroup_no;
	@NotNull private String unitgroup_no;
	@NotNull private String user_id;
	@NotNull private String smsgroup_name;
	private String user_name;
	private String user_hp;
}
