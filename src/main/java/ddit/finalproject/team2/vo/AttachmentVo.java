package ddit.finalproject.team2.vo;

import java.io.Serializable;

import javax.validation.constraints.NotNull;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@Data
@EqualsAndHashCode(of="attachment_no")
@ToString(exclude="fileItem")
public class AttachmentVo implements Serializable{
	@NotNull
	private String attachment_no;
	@NotNull
	private String file_name;
	@NotNull
	private String file_type;
	@NotNull
	private String file_size;
	@NotNull
	private String file_path;
	@NotNull
	private String file_order;
	@NotNull
	private String board_no;
	@NotNull
	private String lecture_code;
	
	private MultipartFile fileItem;
	
	public AttachmentVo(MultipartFile fileItem){
		super();
		this.fileItem = fileItem;
		file_name = fileItem.getOriginalFilename();
		file_size = fileItem.getSize()+"";
		file_type = fileItem.getContentType();
	}
}
