package ddit.finalproject.team2.vo;

import java.io.Serializable;

import javax.validation.constraints.NotNull;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@Data
@EqualsAndHashCode(of="certificate_code")
@ToString
public class CertificateVo implements Serializable{
	@NotNull 
	private String certificate_code;
	@NotNull 
	private String certificate_name;
	@NotNull 
	private String certificate_price;
	@NotNull 
	private String certificate_authority;
}
