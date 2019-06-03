package ddit.finalproject.team2.vo;

import java.io.Serializable;
import java.util.Date;

import javax.swing.plaf.multi.MultiFileChooserUI;
import javax.validation.constraints.NotNull;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@Data
@EqualsAndHashCode(of="submitfile_no")
@ToString
public class SubmitFileVo implements Serializable{
	
	@NotNull private String submitfile_no;
	@NotNull private String attend_no;
	@NotNull private String file_title;
	@NotNull private String file_date;
	@NotNull private String file_markscore;
	@NotNull private String assignment_no;
	@NotNull private String file_name;
	@NotNull private String file_url;
	@NotNull private String file_size;
	
	
}
