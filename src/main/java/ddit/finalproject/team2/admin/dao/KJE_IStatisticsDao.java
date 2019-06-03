package ddit.finalproject.team2.admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

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

@Repository
public interface KJE_IStatisticsDao {
	/**
	 * 학부 이름을가져오는 메서드
	 * @return 학부이름이 담긴 List
	 */
	public List<OrganizationVo> selectUpperOrganization();
	
	/**
	 * 학과 리스트를 가져오는 메서드
	 * @return 학과 이름이 담긴 List
	 */
	public List<OrganizationVo> selectLowerOrganization();
	
	
	/**
	 * 과목 리스트를 가져오는 메서드
	 * @return 과목이름이 담긴 List
	 */
	public List<KJE_StlectureVo> selectStLecture(String openseme_no);
	
	
	/**
	 * 학생이 수강하는 과목에 따른 강좌정보를 가져오는 메서드
	 * @param userinfo user_id 와 강좌이름
	 * @return 강좌정보
	 */
	public AttendVo selectAttend(Map<String, String> userinfo);
	
	/**
	 * 과목정보 테이블에 접속했을때 기록을 insert 하는 메서드
	 * @param LectureAccessStats 접속자 정보
	 * @return insert 성공 여부
	 */
	public int insertLectureAccessStats(LectureAccessStatsVo lectureAccessStats);
	
	/**
	 * 과목의 시간대별 통계 정보를 가져오는 메서드
	 * @param stinfo 과목이름, 날짜 정보
	 * @return 시간대별 접속 인원수
	 */
	public List<KJE_TimeStatisticsVo> selectLectureStatistics(Map<String, String> stinfo);
	
	/**
	 * 교수 이름 리스트를 가져오는 메서드
	 * @return 교수 이름이 담긴 List
	 */
	public List<KJE_ProfessorVo> selectProfessorList();
	
	/**
	 * 과목게시판에서 type 별 교수의 게시글 수를  가져오는 메서드
	 * @param stinfo 과목이름, 날짜정보(통계시작일, 종료일)
	 * @return Board type 별 게시글 수
	 */
	public List<KJE_BoardTypeCntVo>selectBoardTypeCnt(Map<String, String> stinfo);
	
	/**
	 * 과목게시판의 reply 중 교수가 쓴 댓글 수를 반환하는 메서드  
	 * @param stinfo 과목이름, 날짜정보(통계시작일, 종료일)
	 * @return교수가 작성한 답변 수
	 */
	public KJE_ReplyTypeCntVo selectReplyTypeCnt(Map<String, String> stinfo);
	
	
	/**
	 * 포털게시판의 시간대별 통계 정보를 가져오는 메서드
	 * @param stinfo 날짜정보(통계시작일, 종료일)
	 * @return 시간대별 접속 인원수
	 */
	public List<KJE_TimeStatisticsVo> selectPotalStatistics(Map<String, String> stinfo);
	
	/**
	 * 학기 리스트를 가져오는 메서드
	 * @return 학년도, 학기, 학기번호 
	 */
	public List<KJE_SemesterVo> selectSemesterList();
	
	/**
	 * 운영통계 정보를 가져오는 메서드
	 * @return 전공과목개수, 교양과목 개수, 전체과목 개수, 수강생 합계
	 */
	public List<KJE_OperationStatisticsVo> selectOperationStList(Map<String, String> stinfo);
	
	
	/** 오늘 날짜에 해당하는 학기 정보를 반환하는 메서드
	 * @param today 오늘 날짜
	 * @return 학기정보 
	 */
	public OpenSemesterVo selectThisTimeSemester(String today);
	
	
	/**
	 * 메인페이지에 접속했을때 기록을 insert 하는 메서드
	 * @param potalAccessStats 접속자 정보
	 * @return insert 성공 여부
	 */
	public int insertMainAccessStats(PortalAccessStatsVo potalAccessStats);
	
	
}
