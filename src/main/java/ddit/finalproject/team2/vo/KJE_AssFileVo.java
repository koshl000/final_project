package ddit.finalproject.team2.vo;

import java.io.Serializable;

import javax.validation.constraints.NotNull;

import org.apache.commons.io.FileUtils;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

//test
@NoArgsConstructor
@Data
@EqualsAndHashCode(of="file_no")
@ToString
public class KJE_AssFileVo implements Serializable{
	
	public KJE_AssFileVo(MultipartFile fileItem){
		super();
		this.fileItem= fileItem;
		file_name=fileItem.getOriginalFilename();
		file_size=Long.toString(fileItem.getSize());
	}
	
	@NotNull
	private String file_no;
	@NotNull
	private String file_path;
	@NotNull
	private String file_size;
	@NotNull
	private String file_name;
	@NotNull
	private String assignment_no;
	
	private MultipartFile fileItem;
	
}
