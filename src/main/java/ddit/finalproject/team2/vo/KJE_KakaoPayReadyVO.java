package ddit.finalproject.team2.vo;
import java.util.Date;

import lombok.Data;
 
@Data
public class KJE_KakaoPayReadyVO {
    
    //response
    private String tid, next_redirect_pc_url;
    private Date created_at;
    
}