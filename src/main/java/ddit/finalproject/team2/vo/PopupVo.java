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
@EqualsAndHashCode(of="popup_code")
@ToString
public class PopupVo implements Serializable{
	@NotNull private String popup_code;
	@NotNull private String popup_width;
	@NotNull private String popup_loc_x;
	@NotNull private Date popup_start;
	@NotNull private String popup_loc_y;
	@NotNull private Date popup_end;
	@NotNull private String popup_height;
}
