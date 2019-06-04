package ddit.finalproject.team2.common.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import ddit.finalproject.team2.vo.UserVo;

@Repository
public interface Ljs_IUserDao {
	List<UserVo> selectUserList();
}
