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
@EqualsAndHashCode(of="sms_no")
@ToString(exclude="sms_content")
public class SMSVo implements Serializable{
	@NotNull private String sms_no;
	@NotNull private String sms_category;
	@NotNull private String sms_title;
	@NotNull private String sms_content;
	@NotNull private String sms_target;
	@NotNull private Date sms_date;
	@NotNull private String sms_type;
}
