package ddit.finalproject.team2.student.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import ddit.finalproject.team2.vo.AttendVo;
import ddit.finalproject.team2.vo.Ljs_BoardVo;

@Repository
public interface Ljs_IAttendDao {
	String selectAttendNo(Ljs_BoardVo board);
	List<AttendVo> selectAttendList(String lecture_code);
	AttendVo selectAttend(String attend_no);
}
