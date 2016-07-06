package org.kosta.test;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.kosta.finalproject.model.dao.CommunityDAO;
import org.kosta.finalproject.model.dao.LodgeDAO;
import org.kosta.finalproject.model.service.LodgeService;
import org.kosta.finalproject.model.vo.SearchVO;
import org.kosta.finalproject.model.vo.community.CommentVO;
import org.kosta.finalproject.model.vo.lodge.LodgeVO;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

abstract class A{
	
}
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class TestJUnit {
	@Resource
	private LodgeService service;
	@Test
	public void test(){
		List<LodgeVO> list = service.searchLodgeshop(new SearchVO(3,"서"));
		for (LodgeVO lvo : list) {
			System.out.println(lvo);
		}
	}
}
