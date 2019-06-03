package ddit.finalproject.team2.vo;

import javax.validation.constraints.NotNull;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@NoArgsConstructor
@Data
@ToString
public class KJE_PolicyManagementVo {

	private String openseme_year;
    private String openseme_semester;
    @NotNull private String openseme_no;
    private String openseme_period1;
    private String openseme_period2;
    @NotNull private String evalpolicy_code;
    private String rank_a;
    private String rank_b;
    private String rank_c;
    private String rank_d;
    private String rank_f;
    
    private String yearSemestr;
    private String trem;
    
    private String btnUpdate;
    
}
