package ddit.finalproject.team2.common.service;

import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import ddit.finalproject.team2.common.dao.IUserDao;
import ddit.finalproject.team2.util.enumpack.ServiceResult;
import ddit.finalproject.team2.vo.UserVo;

@Service
public class UserFindServiceImpl implements IUserFindService {

	@Inject
	IUserDao userDao;
	
	@Override
	public String findId(UserVo user) {
		String user_id = userDao.findId(user);
		if(StringUtils.isBlank(user_id)) {
			user_id="존재하는 회원이 없습니다.";
		} else {
			user_id="회원아이디 : " + user_id;
		}
		return user_id;
	}

	@Override
	public String findPass(UserVo user) {
		return null;
	}

	@Override
	public ServiceResult confirmHp(UserVo userVo) {
		int rowCnt = userDao.confirmHp(userVo);
		
		ServiceResult result = ServiceResult.FAILED;
		if(rowCnt > 0) {
			result = ServiceResult.OK;
		} // if(rowCnt > 0) end
		return result;
	}

	@Override
	public ServiceResult confirmPassHp(UserVo userVo) {
		int rowCnt = userDao.confirmPassHp(userVo);
		
		ServiceResult result = ServiceResult.FAILED;
		if(rowCnt > 0) {
			result = ServiceResult.OK;
		} // if(rowCnt > 0) end
		return result;
	}

	@Override
	public ServiceResult changePass(UserVo userVo) {
		int rowCnt = userDao.changePass(userVo);
		
		ServiceResult result = ServiceResult.FAILED;
		if(rowCnt > 0) {
			result = ServiceResult.OK;
		} // if(rowCnt > 0) end
		return result;
	}

}
