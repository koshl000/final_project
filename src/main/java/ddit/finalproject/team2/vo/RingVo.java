package ddit.finalproject.team2.vo;

import java.io.Serializable;
import java.util.Date;

import javax.validation.constraints.NotNull;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@Data
@EqualsAndHashCode(of="ring_code")
@ToString
public class RingVo implements Serializable{
	@NotNull private String ring_code;
	@NotNull private String ring_response_id;
	@NotNull private String ring_request_id;
	@NotNull private String ring_type;
	@NotNull private String ring_no;
	@NotNull private String ring_move_address;
	@NotNull private Date ring_occur_date;
	@NotNull private Date ring_confirm_date;
	@NotNull private String ring_confirm_yn;
	@NotNull private String ring_title;
	
	public RingVo(String ring_code, String ring_response_id, String ring_request_id, String ring_type, String ring_no,
			String ring_move_address, Date ring_occur_date, Date ring_confirm_date, String ring_confirm_yn,
			String ring_title) {
		this.ring_code = ring_code;
		this.ring_response_id = ring_response_id;
		this.ring_request_id = ring_request_id;
		this.ring_type = ring_type;
		this.ring_no = ring_no;
		this.ring_move_address = ring_move_address;
		this.ring_occur_date = ring_occur_date;
		this.ring_confirm_date = ring_confirm_date;
		this.ring_confirm_yn = ring_confirm_yn;
		this.ring_title = ring_title;
	}

	private String request_name;
}
