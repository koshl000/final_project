package ddit.finalproject.team2.professor.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.Map;

@Controller
public class Lsh_LectureFileController {
    @GetMapping("/professor/video/{class_identifying_code}/{lecture_class}/{lecture_code}")
    ModelAndView uploadVideoView(@PathVariable String class_identifying_code,@PathVariable String lecture_class,@PathVariable String lecture_code){
        Map<String,String> map=new HashMap<>();
        map.put("class_identifying_code",class_identifying_code);
        map.put("lecture_code",lecture_code);
        map.putAll(map);
        ModelAndView mv=new ModelAndView();
        mv.setViewName("new/regVideo");
        return mv;
    }
    @PostMapping("/professor/regVideo")
    public void uploadVideoService(@RequestParam Map<String,String> map){
        Map<String,String> map1=map;
        String file=map.get("file");
        System.out.println(map1.get("file"));
    }
}
