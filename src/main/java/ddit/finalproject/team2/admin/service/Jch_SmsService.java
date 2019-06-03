package ddit.finalproject.team2.admin.service;

import java.util.List;

import ddit.finalproject.team2.util.enumpack.ServiceResult;
import ddit.finalproject.team2.vo.Jch_SMSGroupVo;
import ddit.finalproject.team2.vo.Jch_SMSVo;
import ddit.finalproject.team2.vo.Jch_UnitGroupVo;
import ddit.finalproject.team2.vo.Jch_UserVo;
import ddit.finalproject.team2.vo.SMSGroupVo;
import ddit.finalproject.team2.vo.UnitGroupVo;

public interface Jch_SmsService {

	public List<Jch_UserVo> selectUserList();
	
	public ServiceResult smsGroupAdd(SMSGroupVo sgVo);

	public ServiceResult smsGroupDetailAdd(Jch_SMSGroupVo jsgVO);

	public List<Jch_SMSGroupVo> getSmsGroupList();

	public List<UnitGroupVo> getUnitGroupList(String smsgroup_no);

	public List<Jch_UnitGroupVo> getUsersHp(String no);

	public ServiceResult getGroupDelete(String no);

	public ServiceResult getUnitGroupDelete(String smsgroup_no);

	public ServiceResult groupNameUpdate(Jch_SMSGroupVo updateVo);

	public ServiceResult insertSms(Jch_SMSVo smsVo);

	public List<Jch_SMSVo> getSmsSendList();

}
