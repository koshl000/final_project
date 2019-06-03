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
public class KJE_CertificateVo implements Serializable{
	@NotNull 
	private String certificate_code;
	@NotNull 
	private String certificate_name;
	@NotNull 
	private String certificate_price;
	@NotNull 
	private String certificate_authority;
	
	private String inputNumber="<input type='number' min='0' value='0' class='numberinput'/>";
	private String btnApply;
	private String btnView;
	private String sum="<div class='suminput'>0</div>";
	
}
