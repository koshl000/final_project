package ddit.finalproject.team2.admin.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import ddit.finalproject.team2.vo.Jch_UserVo;

@Repository
public interface Jch_SmsDao {

	public List<Jch_UserVo> selectUserList();

}
