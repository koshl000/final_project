package ddit.finalproject.team2.vo;

import lombok.EqualsAndHashCode;

import java.io.Serializable;
import java.util.Date;

import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;

import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@Data
@EqualsAndHashCode(of="schedule_no")
@ToString(exclude="schedule_content")
public class KJE_ScheduleVo implements Serializable{
	
	@JsonProperty("id")
	@NotNull private String schedule_no;
	
	@NotNull private String schedule_type;
	
	@JsonProperty("title")
	@NotNull private String schedule_title;
	@NotNull private String schedule_content;
	
	@JsonProperty("start")
	@NotNull private String schedule_start;
	
	@JsonProperty("end")
	@NotNull private String schedule_end;
	
	@NotNull private String schedule_add;
	@NotNull private String lecture_name;
	private String lecture_code;
	
	@JsonProperty("backgroundColor")
	private String schedule_color;
	
	@JsonProperty("borderColor")
	private String border_color;
	
	private String stTime;
	private String edTime;
}
