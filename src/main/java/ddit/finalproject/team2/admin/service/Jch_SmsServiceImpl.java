package ddit.finalproject.team2.admin.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import ddit.finalproject.team2.admin.dao.Jch_SmsDao;
import ddit.finalproject.team2.util.enumpack.ServiceResult;
import ddit.finalproject.team2.vo.Jch_SMSGroupVo;
import ddit.finalproject.team2.vo.Jch_SMSVo;
import ddit.finalproject.team2.vo.Jch_UnitGroupVo;
import ddit.finalproject.team2.vo.Jch_UserVo;
import ddit.finalproject.team2.vo.SMSGroupVo;
import ddit.finalproject.team2.vo.UnitGroupVo;

@Service
public class Jch_SmsServiceImpl implements Jch_SmsService {

	@Inject
	Jch_SmsDao smsDao;

	@Override
	public List<Jch_UserVo> selectUserList() {
		return smsDao.selectUserList();
	}

	@Override
	public ServiceResult smsGroupAdd(SMSGroupVo sgVo) {
		int rowCnt = smsDao.smsGroupAdd(sgVo);
		
		ServiceResult result = ServiceResult.FAILED;
		if (rowCnt > 0) {
			result = ServiceResult.OK;
		}
		return result;
	}

	@Override
	public ServiceResult smsGroupDetailAdd(Jch_SMSGroupVo jsgVO) {
		int rowCnt = smsDao.smsGroupDetailAdd(jsgVO);
		
		ServiceResult result = ServiceResult.FAILED;
		if (rowCnt > 0) {
			result = ServiceResult.OK;
		}
		return result;
	}

	@Override
	public List<Jch_SMSGroupVo> getSmsGroupList() {
		return smsDao.getSmsGroupList();
	}

	@Override
	public List<UnitGroupVo> getUnitGroupList(String smsgroup_no) {
		return smsDao.getUnitGroupList(smsgroup_no);
	}

	@Override
	public List<Jch_UnitGroupVo> getUsersHp(String no) {
		return smsDao.getUsersHp(no);
	}

	@Override
	public ServiceResult getGroupDelete(String no) {
		int rowCnt = smsDao.getGroupDelete(no);
		
		ServiceResult result = ServiceResult.FAILED;
		if (rowCnt > 0) {
			result = ServiceResult.OK;
		}
		return result;
	}

	@Override
	public ServiceResult getUnitGroupDelete(String smsgroup_no) {
		int rowCnt = smsDao.getUnitGroupDelete(smsgroup_no);
		
		ServiceResult result = ServiceResult.FAILED;
		if (rowCnt > 0) {
			result = ServiceResult.OK;
		}
		return result;
	}

	@Override
	public ServiceResult groupNameUpdate(Jch_SMSGroupVo updateVo) {
		int rowCnt = smsDao.groupNameUpdate(updateVo);
		
		ServiceResult result = ServiceResult.FAILED;
		if (rowCnt > 0) {
			result = ServiceResult.OK;
		}
		return result;
	}

	@Override
	public ServiceResult insertSms(Jch_SMSVo smsVo) {
		int rowCnt = smsDao.insertSms(smsVo);
		
		ServiceResult result = ServiceResult.FAILED;
		if (rowCnt > 0) {
			result = ServiceResult.OK;
		}
		return result;
	}

	@Override
	public List<Jch_SMSVo> getSmsSendList() {
		
		List<Jch_SMSVo> smsList = smsDao.getSmsSendList();
		
		for(Jch_SMSVo smsVo : smsList) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			
			Date sms_dt=null;
			try {
				sms_dt = sdf.parse(smsVo.getSms_date());
			} catch (ParseException e) {
				e.printStackTrace();
			}
			
			if(sms_dt.after(new Date()))
				smsVo.setReservCancelBtn("<button type='button' class='reservCancel'>예약취소</button>");
		}
		
		return smsList;
	}

}
