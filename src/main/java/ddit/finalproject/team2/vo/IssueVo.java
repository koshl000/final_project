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
@EqualsAndHashCode(of="issue_code")
@ToString
public class IssueVo implements Serializable{
	@NotNull private int issue_code;
	private String user_id;
	@NotNull private String issue_count;
	private String certificate_code;
	@NotNull private String issue_url;
	@NotNull private Date issue_date;
	@NotNull private String issue_totalprice;
}
