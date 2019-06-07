package ddit.finalproject.team2.admin.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import ddit.finalproject.team2.admin.dao.KJE_IManageBasicInfoDao;
import ddit.finalproject.team2.util.enumpack.ServiceResult;
import ddit.finalproject.team2.vo.KJE_OpenSemesterVo;

@Service
public class KJE_ManageBasicInfoServiceImpl implements KJE_IManageBasicInfoService {

	@Inject
	KJE_IManageBasicInfoDao  manageBasicInfoDao; 
	
	@Override
	public ServiceResult createBInfo(KJE_OpenSemesterVo openSemester) {
		ServiceResult result = ServiceResult.FAILED;
		Map<String,String> osmInfo = new HashMap<>();
		osmInfo.put("openseme_year", openSemester.getOpenseme_year());
		osmInfo.put("openseme_semester", openSemester.getOpenseme_semester());
		KJE_OpenSemesterVo osvo =  manageBasicInfoDao.searchBInfo(osmInfo);
		if(osvo!=null){
			 result = ServiceResult.PKDUPLICATED;
		}else{
			int rowCnt= manageBasicInfoDao.insertBInfo(openSemester);
			if(rowCnt>0){
				result = ServiceResult.OK;
			}
		}
		
		return result;
	}

	@Override
	public List<KJE_OpenSemesterVo> retriveBInfoList() {
		List<KJE_OpenSemesterVo> bInfoList = manageBasicInfoDao.serlectBInfoList();
		return bInfoList;
	}

	@Override
	public KJE_OpenSemesterVo retriveBInfo(String openseme_no) {
		KJE_OpenSemesterVo bInfo = manageBasicInfoDao.selectBInfo(openseme_no);
		return bInfo;
	}

	@Override
	public ServiceResult modifyBInfo(KJE_OpenSemesterVo openSemester) {
		ServiceResult result = ServiceResult.FAILED;
		
		int rowCnt= manageBasicInfoDao.updateBInfo(openSemester);
		
		if(rowCnt>0){
			result = ServiceResult.OK;
		}
		return result;
	}

	@Override
	public ServiceResult removeBInfo(String openseme_no) {
		ServiceResult result = ServiceResult.FAILED;
		
		int rowCnt= manageBasicInfoDao.deleteBInfo(openseme_no);
		
		if(rowCnt>0){
			result = ServiceResult.OK;
		}
		
		return result;
	}


}
