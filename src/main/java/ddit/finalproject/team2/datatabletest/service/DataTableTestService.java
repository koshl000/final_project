package ddit.finalproject.team2.datatabletest.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import ddit.finalproject.team2.common.dao.IUserDao;
import ddit.finalproject.team2.vo.UserVo;

@Service
public class DataTableTestService {
	
	@Inject
	IUserDao userDao;
	
	public List<UserVo> retrieveUserList(){
		return userDao.selectUserList();
	}
}
