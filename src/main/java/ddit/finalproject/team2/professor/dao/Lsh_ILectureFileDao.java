package ddit.finalproject.team2.professor.dao;

import ddit.finalproject.team2.vo.VideoFileVo;
import org.springframework.stereotype.Repository;

@Repository
public interface Lsh_ILectureFileDao {
    void insertVideoFile(VideoFileVo v);
}
