package ddit.finalproject.team2.admin.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import ddit.finalproject.team2.admin.dao.Jch_SmsDao;
import ddit.finalproject.team2.vo.Jch_UserVo;

@Service
public class Jch_SmsServiceImpl implements Jch_SmsService {

	@Inject
	Jch_SmsDao smsDao;

	@Override
	public List<Jch_UserVo> selectUserList() {
		return smsDao.selectUserList();
	}
	
}
