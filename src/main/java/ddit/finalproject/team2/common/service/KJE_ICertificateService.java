package ddit.finalproject.team2.common.service;

import java.util.List;

import ddit.finalproject.team2.vo.IssueVo;
import ddit.finalproject.team2.vo.KJE_CertificateVo;
import ddit.finalproject.team2.vo.KJE_CertificatieAdminVo;
import ddit.finalproject.team2.vo.KJE_SRVo;

/**
 * @author KJE
 * @since 2019. 5. 16.
 * @version 1.0
 * @see 
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일                          수정자               수정내용
 * --------     --------    ----------------------
 * 2019. 5. 16.      작성자명       최초작성
 * Copyright (c) 2019 by DDIT All right reserved
 * </pre>
 */
public interface KJE_ICertificateService {

	/**
	 * 증명서 종류를 가져오는 메서드
	 * @param user_authority: User 권한
	 * @return 	List<KJE_CertificateVo> : User 권한에 따른 증명서 리스트
	 */
	List<KJE_CertificateVo> retriveCertificateList(String user_authority);
	
	/**
	 * 학적부에 들어갈 정보를 가져오는 메서드
	 * @param userId 
	 * @return
	 */
	KJE_SRVo getSRinfo(String userId);
	
	/**
	 * 증명서 발급 내역을 저장하는 메서드
	 * @param issu 증명서 정보
	 * @return 저장 성공 여부
	 */
	int recordIssu(IssueVo issue);
	
	/**
	 * 증명서 발급 리스트를 조회하는 메서드
	 * @return 증명서 발급 리스트
	 */
	List<KJE_CertificatieAdminVo>retriveCertificateAdminList();
}
