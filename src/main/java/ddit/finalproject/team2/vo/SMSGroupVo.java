package ddit.finalproject.team2.vo;

import java.io.Serializable;

import javax.validation.constraints.NotNull;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@Data
@EqualsAndHashCode
@ToString
public class SMSGroupVo implements Serializable{
	@NotNull private String smsgroup_no;
	@NotNull private String smsgroup_name;
}
