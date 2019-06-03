package ddit.finalproject.team2.common.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import ddit.finalproject.team2.common.dao.KJE_ICertificateDao;
import ddit.finalproject.team2.util.exception.CommonException;
import ddit.finalproject.team2.vo.IssueVo;
import ddit.finalproject.team2.vo.KJE_CertificateVo;
import ddit.finalproject.team2.vo.KJE_CertificatieAdminVo;
import ddit.finalproject.team2.vo.KJE_SRVo;

@Service
public class KJE_CertificateServiceImpl implements KJE_ICertificateService {
	
	@Inject
	KJE_ICertificateDao certificateDao; 
	
	@Override
	public List<KJE_CertificateVo> retriveCertificateList(String user_authority) {
		List<KJE_CertificateVo> certificateList = certificateDao.selectCertificateList(user_authority);
		if(certificateList.size()==0){
			throw new CommonException("로그인한 User가 출력할 수 있는 증명서가 없습니다.");
		}else{
			for(int i=0;i<certificateList.size();i++){
//				certificateList.get(i).setSum("0");
				certificateList.get(i).setBtnView("<button class='btn btn-default notika-btn-default viewbtn' name='"+
						certificateList.get(i).getCertificate_code()+"'>미리보기</button>");
				
				certificateList.get(i).setBtnApply("<button class='btn btn-default notika-btn-default applybtn' name='"+
						certificateList.get(i).getCertificate_code()+"ap'>신청</button>");
				
			}
			
		}
		return certificateList;
	}

	@Override
	public KJE_SRVo getSRinfo(String userId) {
		KJE_SRVo srvo = certificateDao.selectSRinfo(userId);
		if(srvo==null){
			throw new CommonException("로그인한 User 에 해당하는 정보가 없습니다.");
		}else{
			
		}
		return srvo;
	}

	@Override
	public int recordIssu(IssueVo issue) {
		int rowCnt = certificateDao.insertIssu(issue);
		return rowCnt;
	}

	@Override
	public List<KJE_CertificatieAdminVo> retriveCertificateAdminList() {
		List<KJE_CertificatieAdminVo> certificatieAdmin = certificateDao.selectCertificateAdminList();
		return certificatieAdmin;
	}

}
