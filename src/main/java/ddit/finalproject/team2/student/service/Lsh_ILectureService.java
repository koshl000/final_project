package ddit.finalproject.team2.student.service;

import ddit.finalproject.team2.vo.LectureVo;
import ddit.finalproject.team2.vo.StudyStateVo;

import java.util.List;
import java.util.Map;

public interface Lsh_ILectureService {
    public List<LectureVo> selectLectureListbyOpenseme(Map<String,String> map);
    public List<Map<String,String>>  selectVideoListbyLecture(Map<String,String> map);
    public List<String> selectAbsenceYN(Map<String,String> map);
    public Map<String,String> selectContinuePlay(Map<String,String> map);
    public String getAttend(Map<String, String> map);
    public int updateContinuePlay(Map<String, String> map);

    public int updateIdentifyCode(Map<String, String> map);

    public Map<String,String> selectPlay(Map<String, String> map);
}