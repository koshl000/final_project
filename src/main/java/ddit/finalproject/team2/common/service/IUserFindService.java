package ddit.finalproject.team2.common.service;

import ddit.finalproject.team2.util.enumpack.ServiceResult;
import ddit.finalproject.team2.vo.UserVo;

public interface IUserFindService {
	
	public String findId(UserVo user);
	public String findPass(UserVo user);
	public ServiceResult confirmHp(UserVo userVo);
	public ServiceResult confirmPassHp(UserVo userVo);
	public ServiceResult changePass(UserVo userVo);
}
