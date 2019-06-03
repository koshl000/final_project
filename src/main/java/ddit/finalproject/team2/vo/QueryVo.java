package ddit.finalproject.team2.vo;

import java.io.Serializable;

import javax.validation.constraints.NotNull;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@Data
@EqualsAndHashCode(of="query_no")
@ToString
public class QueryVo implements Serializable{
	@NotNull private String query_no;
	@NotNull private String query_keyword;
}
