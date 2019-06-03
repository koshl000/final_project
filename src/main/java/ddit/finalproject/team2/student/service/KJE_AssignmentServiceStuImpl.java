package ddit.finalproject.team2.student.service;

import java.io.File;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import ddit.finalproject.team2.professor.dao.KJE_IAssignmentDao;
import ddit.finalproject.team2.student.dao.KJE_IAssignmentsutDao;
import ddit.finalproject.team2.util.enumpack.ServiceResult;
import ddit.finalproject.team2.vo.KJE_LWeekAssignmentProVo;
import ddit.finalproject.team2.vo.KJE_SubmitAttendstuVo;
import ddit.finalproject.team2.vo.KJE_SubmitFileVo;
import ddit.finalproject.team2.vo.SubmitFileVo;

@Service
public class KJE_AssignmentServiceStuImpl implements KJE_IAssignmentServiceStu{

	@Inject
	KJE_IAssignmentDao assignmentDao; 
	
	@Inject
	KJE_IAssignmentsutDao  assignmentsutDao;  
	
	@Value("#{appInfo['submitFilePath']}") // spEL사용
	String submitFilePath ;
	
	public void preProcessSubmitFile(KJE_SubmitFileVo submitFile){
		
		if(submitFile==null) return;
		String saveName=UUID.randomUUID().toString();
		File saveFile = new File(submitFilePath, saveName);
		submitFile.setFile_url(saveFile.getAbsolutePath());
		submitFile.setFile_name(submitFile.getFileItem().getOriginalFilename());
		submitFile.setFile_size(Long.toString(submitFile.getFileItem().getSize())); 		
	}
	
	@Override
	public List<KJE_LWeekAssignmentProVo> retrieveLWeekAssignmentProList(String lecture_code) {
		Date date = new Date();
		SimpleDateFormat sdFormat = new SimpleDateFormat("yyyyMMdd");
		String todayString =sdFormat.format(date);
		
		List<KJE_LWeekAssignmentProVo> lWeekAssignmentProList = assignmentDao.selectLWeekAssignmentProList(lecture_code);
		for(int i = 0 ; i<lWeekAssignmentProList.size();i++){
			if(lWeekAssignmentProList.get(i).getSubmit_period1()!=null){
				
				String stDate = lWeekAssignmentProList.get(i).getSubmit_period1().replaceAll("/", "").trim();
				String endDate = lWeekAssignmentProList.get(i).getSubmit_period2().replaceAll("/", "").trim();
				if(StringUtils.isNotBlank(lWeekAssignmentProList.get(i).getAssignment_no())){
					
					lWeekAssignmentProList.get(i).setBtnView("<button class='btn btn-default notika-btn-default viewbtn' name='"+
					lWeekAssignmentProList.get(i).getAssignment_no()+"'>과제 보기</button>");
					lWeekAssignmentProList.get(i).setBtnInsert("<button class='btn btn-default notika-btn-default insertbtn' name='"+
					lWeekAssignmentProList.get(i).getAssignment_no()+"'>과제제출</button>");
				
					if(Integer.parseInt(todayString)<Integer.parseInt(stDate)||Integer.parseInt(todayString)>Integer.parseInt(endDate)){
						lWeekAssignmentProList.get(i).setBtnInsert("<p>제출 기간이 아닙니다.</p>");
					
					}
				}
			}
		
			
			
		}
		
		return  lWeekAssignmentProList;
	}

	@Override
	public SubmitFileVo retriveSubmitFile(Map<String, String> stuInfo) {
		SubmitFileVo submitFile = assignmentsutDao.selectSubmitFile(stuInfo);
		
		return submitFile;
	}

	@Override
	public ServiceResult recordSubmitFile(KJE_SubmitFileVo submitFile) {
		ServiceResult result = ServiceResult.FAILED;
		preProcessSubmitFile(submitFile);
		int rowCnt =assignmentsutDao.insertSubmitFile(submitFile);
		if(rowCnt>0){
			String savePath = submitFile.getFile_url();
			MultipartFile item = submitFile.getFileItem();
			try(
					InputStream is = item.getInputStream();
					){
				FileUtils.copyInputStreamToFile(is, new File(savePath));
			}catch (Exception e) {
				throw new RuntimeException(e);
			}
			result = ServiceResult.OK;
		}
		
		return result;
	}

	@Override
	public ServiceResult modifySubmitFile(KJE_SubmitFileVo submitFile) {
		ServiceResult result = ServiceResult.FAILED;
		preProcessSubmitFile(submitFile);
		int rowCnt =assignmentsutDao.updateSubmitFile(submitFile);
		if(rowCnt>0){
			String savePath = submitFile.getFile_url();
			MultipartFile item = submitFile.getFileItem();
			try(
					InputStream is = item.getInputStream();
					){
				FileUtils.copyInputStreamToFile(is, new File(savePath));
			}catch (Exception e) {
				throw new RuntimeException(e);
			}
			result = ServiceResult.OK;
		}
		
		return result;
	}

	
}
