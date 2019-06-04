package ddit.finalproject.team2.vo;

import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
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
public class Jch_SMSVo implements Serializable{
	
	public Jch_SMSVo(String sms_category, String sms_title, String sms_content, String sms_target, String sms_type, String sms_date, String sms_groupid) {
		super();
		this.sms_category = sms_category;
		this.sms_title = sms_title;
		this.sms_content = sms_content;
		this.sms_target = sms_target;
		this.sms_type = sms_type;
		this.sms_date = sms_date;
		this.sms_groupid = sms_groupid;
	}
	
	@NotNull private String sms_no;
	@NotNull private String sms_category; //발송결과 , 오류표시
	@NotNull private String sms_title; //그룹명
	@NotNull private String sms_content; //내용
	@NotNull private String sms_target; //그룹아이디
	@NotNull private String sms_date; 
	@NotNull private String sms_type; //발송타입(바로, 예약)
	@NotNull private String sms_groupid; //발송타입(바로, 예약)
	private String reservCancelBtn = ""; // "<button type='button' class='reservCancel'>예약취소</button>";
	
//	public String getReservCancelBtn() {
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mi:ss");
//			
//		Date sms_dt=null;
//		try {
//			sms_dt = sdf.parse(sms_date);
//		} catch (ParseException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
//		if(sms_dt.after(new Date()))
//			return "<button type='button' class='reservCancel'>예약취소</button>";
//		else
//			return "";
//			
//		//return (sms_date.compareTo(nowDt) ? "<button type='button' class='reservCancel'>예약취소</button>" : "";
//		//return "";
//	}
	
}
