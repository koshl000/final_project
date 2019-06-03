package ddit.finalproject.team2.common.service;

import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import ddit.finalproject.team2.common.dao.KJE_IStudentDao;
import ddit.finalproject.team2.vo.StudentVo;

@Service
public class KJE_FaceIdServiceImpl implements KJE_IFaceIdService {
	
	@Inject
	KJE_IStudentDao studentDao;
	
	@Override
	public int modifyFaceId(StudentVo student) {
		int result = studentDao.updateFaceId(student);
		return result;
	}

	@Override
	public boolean getFaceId(String userId) {
		String faceId =null;
		boolean existFaceid=false;
		faceId= studentDao.selectFaceId(userId);
		if(StringUtils.isNotEmpty(faceId)){
			existFaceid = true;
		}
		return existFaceid;
	}

	
}
