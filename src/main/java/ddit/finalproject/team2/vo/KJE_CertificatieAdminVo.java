package ddit.finalproject.team2.vo;

import javax.validation.constraints.NotNull;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@Data
@EqualsAndHashCode(of="issue_code")
@ToString
public class KJE_CertificatieAdminVo {
	@NotNull
	private String issue_code;
	@NotNull
	private String user_authority;
	@NotNull
	private String user_id;
	@NotNull
	private String user_name;
	@NotNull
	private String certificate_code;
	@NotNull
	private String certificate_name;
	@NotNull
	private String issue_count;
	@NotNull
	private String issue_totalprice;
	@NotNull
	private String issue_date;
}








