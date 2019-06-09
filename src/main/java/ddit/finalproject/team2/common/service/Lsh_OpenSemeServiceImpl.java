package ddit.finalproject.team2.common.service;

import ddit.finalproject.team2.common.dao.Lsh_IOPenSemeDao;
import org.springframework.stereotype.Service;

import javax.inject.Inject;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

@Service
public class Lsh_OpenSemeServiceImpl implements Lsh_IOpenSemeService {
    @Inject
    Lsh_IOPenSemeDao dao;

    @Override
    public Map<String,String> selectOPenPeriod(String lecture_code) {
        return dao.selectOpenPeroid(lecture_code);
    }
}
