package ddit.finalproject.team2.student.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import ddit.finalproject.team2.student.dao.Ljs_ISearchGradeDao;
import ddit.finalproject.team2.vo.Ljs_SearchGradeVo;

@Service
public class Ljs_SearchGradeServiceImpl implements Ljs_ISearchGradeService{
	@Inject
	Ljs_ISearchGradeDao dao;

	@Override
	public List<Ljs_SearchGradeVo> retrieveGradeList(String user_id) {
		List<Ljs_SearchGradeVo> averageList = dao.selectAverageList(user_id);
		return averageList;
	}
}
