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
		System.out.println(Math.floor(95f*45/1000*100)/100f);
	}

}
