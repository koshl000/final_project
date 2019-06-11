package ddit.finalproject.team2.professor.service;

import ddit.finalproject.team2.professor.dao.Lsh_ILectureFileDao;
import ddit.finalproject.team2.vo.VideoFileVo;
import org.springframework.stereotype.Service;

import javax.inject.Inject;

@Service
public class Lsh_ILectureFileServiceImpl implements Lsh_ILectureFileService {
    @Inject
    Lsh_ILectureFileDao filedao;

    @Override
    public void insertVideoFile(VideoFileVo v) {
        filedao.insertVideoFile(v);
    }
}
