package ddit.finalproject.team2.student.service;

import ddit.finalproject.team2.student.dao.Lsh_ILectureDao;
import ddit.finalproject.team2.vo.LectureVo;
import ddit.finalproject.team2.vo.StudyStateVo;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.util.List;
import java.util.Map;

@Service
public class Lsh_ILectureServiceImpl implements Lsh_ILectureService {
    @Inject
    Lsh_ILectureDao dao;

    @Override
    public List<LectureVo> selectLectureListbyOpenseme(Map<String, String> map) {
        return dao.selectLectureListbyOpenseme(map);
    }

    @Override
    public List<Map<String, String>> selectVideoListbyLecture(Map<String, String> map) {
        return dao.selectVideoListbyLecture(map);
    }

    @Override
    public List<String> selectAbsenceYN(Map<String, String> map) {
        return dao.selectAbsenceYN(map);
    }

    @Override
    public String getAttend(Map<String, String> map) {
        return dao.getAttend(map);
    }

    @Override
    public Map<String, String> selectContinuePlay(Map<String, String> map) {
        return dao.selectContinuePlay(map);
    }

    @Override
    public int updateContinuePlay(Map<String, String> map) {
        return dao.updateContinuePlay(map);
    }

    @Override
    public int updateIdentifyCode(Map<String, String> map) {
        return dao.updateIdentifyCode(map);
    }

    @Override
    public Map<String, String> selectPlay(Map<String, String> map) {
        return dao.selectPlay(map);
    }
}
