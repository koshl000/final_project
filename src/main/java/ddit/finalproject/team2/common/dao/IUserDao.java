package ddit.finalproject.team2.common.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import ddit.finalproject.team2.vo.UserVo;

@Repository
public interface IUserDao {

	UserVo selectUser(String user_id);
	
	List<UserVo> selectUserList();

	public String findId(UserVo user);

	int confirmHp(UserVo userVo);

	int confirmPassHp(UserVo userVo);

	int changePass(UserVo userVo);

}
