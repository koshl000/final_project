package ddit.finalproject.team2.admin.dao;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import ddit.finalproject.team2.vo.Jch_SMSGroupVo;
import ddit.finalproject.team2.vo.Jch_SMSVo;
import ddit.finalproject.team2.vo.Jch_UnitGroupVo;
import ddit.finalproject.team2.vo.Jch_UserVo;
import ddit.finalproject.team2.vo.SMSGroupVo;
import ddit.finalproject.team2.vo.UnitGroupVo;

@Repository
@Transactional
public interface Jch_SmsDao {

	public List<Jch_UserVo> selectUserList();

	public int smsGroupAdd(SMSGroupVo sgVo);
	
	public int smsGroupDetailAdd(Jch_SMSGroupVo jsgVO);

	public List<Jch_SMSGroupVo> getSmsGroupList();

	public List<UnitGroupVo> getUnitGroupList(String smsgroup_no);

	public List<Jch_UnitGroupVo> getUsersHp(String no);

	public int getGroupDelete(String no);

	public int getUnitGroupDelete(String smsgroup_no);

	public int groupNameUpdate(Jch_SMSGroupVo updateVo);

	public int insertSms(Jch_SMSVo smsVo);

	public List<Jch_SMSVo> getSmsSendList();

}
