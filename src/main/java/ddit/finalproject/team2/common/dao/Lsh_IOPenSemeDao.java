package ddit.finalproject.team2.common.dao;

import org.springframework.stereotype.Repository;

import java.util.Map;

@Repository
public interface Lsh_IOPenSemeDao {
    Map<String,String> selectOpenPeroid(String lecture_code);
}
