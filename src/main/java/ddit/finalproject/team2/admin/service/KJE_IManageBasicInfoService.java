package ddit.finalproject.team2.admin.service;

import java.util.List;
import java.util.Map;

import ddit.finalproject.team2.util.enumpack.ServiceResult;
import ddit.finalproject.team2.vo.KJE_OpenSemesterVo;

public interface KJE_IManageBasicInfoService {

	ServiceResult createBInfo (KJE_OpenSemesterVo openSemester);
	
	List<KJE_OpenSemesterVo> retriveBInfoList();
	
	KJE_OpenSemesterVo retriveBInfo(String openseme_no);
	
	ServiceResult modifyBInfo(KJE_OpenSemesterVo openSemester);
	
	ServiceResult removeBInfo(String openseme_no);
	
	
}
