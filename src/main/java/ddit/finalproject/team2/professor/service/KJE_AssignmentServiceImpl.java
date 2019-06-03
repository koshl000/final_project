package ddit.finalproject.team2.professor.service;

import java.io.File;
import java.io.InputStream;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import ddit.finalproject.team2.professor.dao.KJE_IAssignmentDao;
import ddit.finalproject.team2.util.enumpack.ServiceResult;
import ddit.finalproject.team2.vo.KJE_AssFileVo;
import ddit.finalproject.team2.vo.KJE_AssignmentnFileVo;
import ddit.finalproject.team2.vo.KJE_LWeekAssignmentProVo;
import ddit.finalproject.team2.vo.KJE_SubmitAttendstuVo;
import ddit.finalproject.team2.vo.KJE_SubmitFileVo;

@Service
public class KJE_AssignmentServiceImpl implements KJE_IAssignmentService {
	
	@Inject
	KJE_IAssignmentDao assignmentDao; 
	
	@Value("#{appInfo['assignmentPath']}") // spEL사용
	String assignmentPath ;
	
	public void preProcessAssignmentFileList(KJE_AssignmentnFileVo assignmentnFileVo){
		
		List<KJE_AssFileVo> assignmentFileList = assignmentnFileVo.getAssignmentFileList();
		if(assignmentFileList==null) return;
		
		for(KJE_AssFileVo assignmentFile: assignmentFileList){
				String saveName=UUID.randomUUID().toString();
				File saveFile = new File(assignmentPath, saveName);
				assignmentFile.setFile_path(saveFile.getAbsolutePath());
		}
		
	}
	
	@Override
	public List<KJE_LWeekAssignmentProVo> retrieveLWeekAssignmentProList(String lecture_code){
		List<KJE_LWeekAssignmentProVo> lWeekAssignmentProList = assignmentDao.selectLWeekAssignmentProList(lecture_code);
		for(int i = 0 ; i<lWeekAssignmentProList.size();i++){
			
			if(StringUtils.isNotBlank(lWeekAssignmentProList.get(i).getAssignment_no())){
				
				lWeekAssignmentProList.get(i).setBtnView("<button class='btn btn-default notika-btn-default viewbtn' name='"+
						lWeekAssignmentProList.get(i).getAssignment_no()+"'>과제 보기</button>");
			}else{
				
				lWeekAssignmentProList.get(i).setBtnInsert("<button class='btn btn-default notika-btn-default insertbtn'>과제등록</button>");
			}
			
		}
		
		return  lWeekAssignmentProList;
	}

	@Override
	public KJE_AssignmentnFileVo retriveAssignment(String assignment_no) {
		KJE_AssignmentnFileVo assignmentnFile = assignmentDao.selectAssignment(assignment_no);
		return assignmentnFile;
	}

	@Override
	public ServiceResult createAssignment(KJE_AssignmentnFileVo assignmentnFileVo) {
		preProcessAssignmentFileList(assignmentnFileVo);
		
		int rowCnt = assignmentDao.insertAssignment(assignmentnFileVo);
		
		ServiceResult result = ServiceResult.FAILED;
		if(rowCnt > 0) {
			List<KJE_AssFileVo> assignmentFileList = assignmentnFileVo.getAssignmentFileList();
			if(assignmentFileList.size()!=0) {
				
				assignmentDao.insertAllAssFile(assignmentnFileVo);
				for(KJE_AssFileVo assFile : assignmentFileList) {
					String savePath = assFile.getFile_path();
					MultipartFile item = assFile.getFileItem();
					try(
							InputStream is = item.getInputStream();
							){
						FileUtils.copyInputStreamToFile(is, new File(savePath));
					}catch (Exception e) {
						throw new RuntimeException(e);
					}
				}
			}
			result = ServiceResult.OK;
		} // if(rowCnt > 0) end
		return result;
	}

	@Override
	public KJE_AssFileVo retriveAssFile(String file_no) {
		KJE_AssFileVo assfile = assignmentDao.selectAssFile(file_no);
		return assfile;
	}

	
	@Override
	public List<KJE_SubmitAttendstuVo> retriveSubmitStuList(String assignment_no) {
		 List<KJE_SubmitAttendstuVo>submitStuList= assignmentDao.selectSubmitStuList(assignment_no);
//		 for(int i=0; i<submitStuList.size();i++){
//			 if(submitStuList.get(i).getFile_markscore()=="1"){
//				 submitStuList.get(i).setPassBtn("<div class='fm-checkbox'><input type='checkbox' checked='' class='i-checks'></div>");
//			 }else{
//				 submitStuList.get(i).setPassBtn("<div class='fm-checkbox'><input type='checkbox' class='i-checks'></div>");
//				 
//			 }
//		 }
		 
		return submitStuList;
	}

	@Override
	public KJE_SubmitFileVo retriveSumitFile(String submitfile_no) {
		KJE_SubmitFileVo sumitfile = assignmentDao.seletSumitFile(submitfile_no);
		return sumitfile;
	}

	@Override
	public ServiceResult modifyFchecked(List<KJE_SubmitFileVo> pfCheckList) {
		ServiceResult result = ServiceResult.FAILED;
		
		int rowCnt = assignmentDao.updatePFchecked(pfCheckList);
		
		if(rowCnt > 0) {
			result = ServiceResult.OK;
		}
		return result;
	}

	@Override
	@Transactional
	public ServiceResult deletAssignment(String assignment_no){
		ServiceResult result = ServiceResult.FAILED;
		
		List<KJE_AssFileVo> assFileList = assignmentDao.selectAssignment(assignment_no).getAssignmentFileList();
		List<KJE_SubmitAttendstuVo> submitFileList = assignmentDao.selectSubmitStuList(assignment_no);
		
		if(assFileList.get(0).getFile_no()!=null){
			for(int i=0;i<assFileList.size();i++){
				KJE_AssFileVo assFile = assFileList.get(i);
				File srcFile = new File(assFile.getFile_path());
				 if( srcFile.exists() ){
					 srcFile.delete();
				 	}
				 assignmentDao.deleteAssignmentfile(assFile.getFile_no());
				}
			
			}
		
		
		if(submitFileList.size()>0){
			for(int i=0;i<submitFileList.size();i++){
				KJE_SubmitAttendstuVo submitFile = submitFileList.get(i);
				File srcFile = new File(submitFile.getFile_url());
				 if( srcFile.exists() ){
					 srcFile.delete();
				 	}
				 assignmentDao.deleteSubmitfile(submitFile.getSubmitfile_no());
				}
			}	
			
		 int rowCnt = assignmentDao.deleteAssignment(assignment_no);	
		 
		 if(rowCnt > 0) {
				result = ServiceResult.OK;
			}
		return result;
	}

	@Override
	@Transactional
	public ServiceResult modifyAssignment(KJE_AssignmentnFileVo assignmentnFileVo) {
		ServiceResult result = ServiceResult.FAILED;
		
		if(assignmentnFileVo.getAssDelFiles()!=null) {
			for(int i=0; i<assignmentnFileVo.getAssDelFiles().length;i++) {
				KJE_AssFileVo assFile = assignmentDao.selectAssFile(assignmentnFileVo.getAssDelFiles()[i]);
				File srcFile = new File(assFile.getFile_path());
				 if( srcFile .exists() ){
					 srcFile .delete();
				 	}
				 assignmentDao.deleteAssignmentfile(assignmentnFileVo.getAssDelFiles()[i]);
				
				}
			
			}//if
			preProcessAssignmentFileList(assignmentnFileVo);
			int rowCnt = assignmentDao.updateAssignment(assignmentnFileVo);
			if(rowCnt>0){
			List<KJE_AssFileVo> assignmentFileList = assignmentnFileVo.getAssignmentFileList();
			if(assignmentFileList.size()!=0) {
				
				assignmentDao.insertAllAssFile(assignmentnFileVo);
				for(KJE_AssFileVo assFile : assignmentFileList) {
					String savePath = assFile.getFile_path();
					MultipartFile item = assFile.getFileItem();
					try(
							InputStream is = item.getInputStream();
							){
						FileUtils.copyInputStreamToFile(is, new File(savePath));
					}catch (Exception e) {
						throw new RuntimeException(e);
					}
				}
			}
			result = ServiceResult.OK;
		} // if(rowCnt > 0) end
			
		return result;
	}

}
