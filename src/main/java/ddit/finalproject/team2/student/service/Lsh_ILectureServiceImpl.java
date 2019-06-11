package ddit.finalproject.team2.student.service;

import java.util.Calendar;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import ddit.finalproject.team2.student.dao.Lsh_ILectureDao;
import ddit.finalproject.team2.vo.LectureVo;

@Service
public class Lsh_ILectureServiceImpl implements Lsh_ILectureService {
    @Inject
    Lsh_ILectureDao dao;

    @Override
    public List<LectureVo> selectLectureListbyOpenseme(Map<String, String> map) {
    	int year = Calendar.getInstance().get(1);
    	int month = Calendar.getInstance().get(2);
    	String semester = "1";
    	if(month>6){
    		semester = "2";
    	}
    	
    	map.put("openseme_year",year+"");
		map.put("openseme_semester",semester);
        List<LectureVo> list = dao.selectLectureListbyOpenseme(map);
        for(LectureVo lec : list){
        	lec.setLecture_nameForMyLecture(lec.getLecture_name(), lec.getLecture_code());
        }
		return list;
    }

    @Override
    public List<Map<String, String>> selectVideoListbyLecture(Map<String, String> map) {
        return dao.selectVideoListbyLecture(map);
    }

    @Override
    public List<String> selectAbsenceListYN(Map<String, String> map) {
        return dao.selectAbsenceYN(map);
    }

    @Override
    public String getAttend(Map<String, String> map) {
        return dao.getAttend(map);
    }

    @Override
    public List<String> selectAttendUserID(String lec_code) {
        return dao.selectAttendUserID(lec_code);
    }

    @Override
    public String selectLecProID(String lec_code) {
        return dao.selectLecProID(lec_code);
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

    @Override
    public String selectOneAbsenceYN(Map<String, String> map) {
        return dao.selectOneAbsenceYN(map);
    }
}
