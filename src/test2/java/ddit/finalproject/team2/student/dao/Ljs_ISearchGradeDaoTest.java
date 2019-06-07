package ddit.finalproject.team2.student.dao;

import static org.junit.Assert.*;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import ddit.finalproject.team2.RootWebConfiguration;
import ddit.finalproject.team2.vo.Ljs_SearchGradeVo;

@RunWith(SpringJUnit4ClassRunner.class)
@RootWebConfiguration
public class Ljs_ISearchGradeDaoTest {
	@Inject
	Ljs_ISearchGradeDao dao;

	@Test
	public void selectGradeListTest() {
		List<Ljs_SearchGradeVo> list = dao.selectAverageList("st_001");
		System.out.println((18*5/100f*Integer.parseInt("20")*100+0.5f)/100);
		assertEquals(2, list.size());
	}

}
