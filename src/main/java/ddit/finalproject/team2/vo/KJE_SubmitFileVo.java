package ddit.finalproject.team2.vo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;

import javax.validation.constraints.NotNull;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@Data
@EqualsAndHashCode(of="submitfile_no")
@ToString
public class KJE_SubmitFileVo implements Serializable{
	
	public KJE_SubmitFileVo(MultipartFile fileItem){
		super();
		this.fileItem =fileItem;
		file_name = fileItem.getOriginalFilename();
		file_size = Long.toString(fileItem.getSize());
	}
	
			 private String submitfile_no;
	@NotNull private String attend_no;
	@NotNull private String file_title;
	@NotNull private String file_date;
			 private String file_markscore;
	@NotNull private String assignment_no;
	@NotNull private String file_name;
	@NotNull private String file_url;
	@NotNull private String file_size;

	private MultipartFile fileItem;
	
}
