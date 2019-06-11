package ddit.finalproject.team2.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@Data
@EqualsAndHashCode(of="attend")
@ToString
public class Ljs_AttendVo {
	private AttendVo attend;
	private UserVo user;
	private StudentVo student;
	private GradeVo grade;
}
