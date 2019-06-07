package ddit.finalproject.team2.admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import ddit.finalproject.team2.vo.KJE_OpenSemesterVo;

@Repository
public interface KJE_IManageBasicInfoDao {

	int insertBInfo (KJE_OpenSemesterVo openSemester);
	
	List<KJE_OpenSemesterVo> serlectBInfoList();
	
	KJE_OpenSemesterVo selectBInfo(String openseme_no);
	
	KJE_OpenSemesterVo searchBInfo(Map<String, String> osmInfo);
	
	int updateBInfo(KJE_OpenSemesterVo openSemester);
	
	int deleteBInfo(String openseme_no);
	
	
}
