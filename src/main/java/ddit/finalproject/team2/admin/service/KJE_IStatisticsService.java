package ddit.finalproject.team2.admin.service;

import java.util.List;
import java.util.Map;

import ddit.finalproject.team2.vo.AttendVo;
import ddit.finalproject.team2.vo.KJE_BoardTypeCntVo;
import ddit.finalproject.team2.vo.KJE_OperationStatisticsVo;
import ddit.finalproject.team2.vo.KJE_ProfessorVo;
import ddit.finalproject.team2.vo.KJE_ReplyTypeCntVo;
import ddit.finalproject.team2.vo.KJE_SemesterVo;
import ddit.finalproject.team2.vo.KJE_StlectureVo;
import ddit.finalproject.team2.vo.KJE_TimeStatisticsVo;
import ddit.finalproject.team2.vo.LectureAccessStatsVo;
import ddit.finalproject.team2.vo.OpenSemesterVo;
import ddit.finalproject.team2.vo.OrganizationVo;
import ddit.finalproject.team2.vo.PortalAccessStatsVo;

public interface KJE_IStatisticsService {

	/**
	 * 학부 이름을가져오는 메서드
	 * @return 학부이름이 담긴 List
	 */
	public List<OrganizationVo> getUpperOrganization();
	
	/**
	 * 학과 리스트를 가져오는 메서드
	 * @return 학과 이름이 담긴 List
	 */
	public List<OrganizationVo> getLowerOrganization();
	
	
	/**
	 * 과목 리스트를 가져오는 메서드
	 * @return 과목이름이 담긴 List
	 */
	public List<KJE_StlectureVo> getStLecture(String openseme_no);
	
	/**
	 * 과목정보 테이블에 유저가 접속했을때 기록하는 메서드
	 * @param userinfo
	 * @return 기록성공 여부
	 */
	public int recodeLectureAccessStats(Map<String, String> userinfo);
	
	/**
	 * 과목의 시간대별 통계 정보를 가져오는 메서드
	 * @param stinfo 과목이름, 날짜 정보
	 * @return 시간대별 접속 인원수
	 */
	public List<KJE_TimeStatisticsVo> getLectureStatistics(Map<String, String> stinfo);
	
	
	/**
	 * 교수 이름 리스트를 가져오는 메서드
	 * @return 교수 이름이 담긴 List
	 */
	public List<KJE_ProfessorVo> getProfessorList();
	
	/**
	 * 교수의 과목별 활동 통계를 내기위한 메서드
	 * @param stinfo 과목이름, 날짜정보(통계시작일, 종료일)
	 * @return 통계 항목 별 count 수
	 */
	public Map<String,String> getProBehaviorStatistics(Map<String, String> stinfo);
	
	
	/**
	 * 포털의 시간대별 통계 정보를 가져오는 메서드
	 * @param stinfo 날짜 정보
	 * @return 시간대별 접속 인원수
	 */
	public List<KJE_TimeStatisticsVo> getPotalStatistics(Map<String, String> stinfo);
	
	/**
	 * 학기 리스트를 가져오는 메서드
	 * @return 학년도, 학기, 학기번호 
	 */
	public List<KJE_SemesterVo> getSemesterList();
	
	
	/**
	 * 운영통계 정보를 가져오는 메서드
	 * @return 전공과목개수, 교양과목 개수, 전체과목 개수, 수강생 합계
	 */
	public List<KJE_OperationStatisticsVo> getOperationStList(Map<String, String> stinfo);
	
	/** 오늘 날짜에 해당하는 학기 정보를 반환하는 메서드
	 * @param today 오늘 날짜
	 * @return 학기정보 
	 */
	public OpenSemesterVo getThisTimeSemester(String today);
	
	
	/**
	 * 메인페이지에 접속했을때 기록을 insert 하는 메서드
	 * @param potalAccessStats 접속자 정보
	 * @return insert 성공 여부
	 */
	public int recodeMainAccessStats(PortalAccessStatsVo potalAccessStats);
}
