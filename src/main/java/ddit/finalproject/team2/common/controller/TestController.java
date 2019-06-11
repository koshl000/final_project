package ddit.finalproject.team2.common.controller;

import ddit.finalproject.team2.vo.UserVo;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/subjectPage/{lecture_code}")
public class TestController {
    @GetMapping("mantoman1")
    public ModelAndView goMantoMan(@RequestParam(required = false) String roomId, ModelAndView mv, Authentication au, @PathVariable String lecture_code) {
        mv.setViewName("test/test_mantoman");
        List<String> al = new ArrayList<>();
        UserVo uv=(UserVo) au.getPrincipal();
        mv.getModel().put("id", au.getName());
        mv.getModel().put("user", uv);
        if(roomId!=null&&(!roomId.isEmpty())){
            mv.getModel().put("roomId",roomId);
        }else{
            mv.getModel().put("roomId",uv.getUser_id());
        }
        return mv;
    }
}
