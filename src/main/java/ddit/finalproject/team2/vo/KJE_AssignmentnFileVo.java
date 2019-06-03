package ddit.finalproject.team2.vo;

import java.io.File;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.validation.constraints.NotNull;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.multipart.MultipartFile;

import ddit.finalproject.team2.util.hint.InsertHint;
import ddit.finalproject.team2.util.hint.UpdateHint;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@Data
@EqualsAndHashCode(of = "assignment_no")
@ToString
public class KJE_AssignmentnFileVo {
	private Integer startAssFileNo;

	@NotNull
	private String assignment_no;
	@NotNull(groups={InsertHint.class, UpdateHint.class})
	private String assignment_title;
	@NotNull
	private String assignment_date;
	@NotNull(groups={InsertHint.class, UpdateHint.class})
	private String submit_period1;
	@NotNull(groups={InsertHint.class, UpdateHint.class})
	private String submit_period2;
	
	private String insert_period1;
	
	private String insert_period2;
	
	@NotNull
	private String class_identifying_code;
	
	@NotNull
	private String lecture_code;

	private String assignment_content;

	MultipartFile[] ass_files;

	private List<KJE_AssFileVo> assignmentFileList;
	private List<KJE_AssFileVo> savedAssFileList;

	private String[] assDelFiles;

	public void setAss_files(MultipartFile[] ass_files) {
		if(ass_files==null)return;
		this.ass_files = ass_files;
		this.assignmentFileList = new ArrayList<KJE_AssFileVo>();
			for(MultipartFile multi: ass_files){
				if(ass_files!=null &&StringUtils.isNotBlank(multi.getOriginalFilename())){
					assignmentFileList.add(new KJE_AssFileVo(multi));
			}
		}
	}
	
}
