package kr.co.jisu;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.jisu.common.Criteria;
import kr.co.jisu.domain.BoardDTO;
import kr.co.jisu.repository.BoardDAO;

@RunWith(SpringJUnit4ClassRunner.class)
//속성 경로에 xml파일을 이용해 스프링이 로딩 된다.
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/**/root-context.xml" })
public class BoardTest {
	@Inject
	private BoardDAO boardDAO;
    static final Logger LOGGER = LoggerFactory.getLogger(BoardTest .class);

	
	@Test
	public void testListCriteria() throws Exception{
		
		Criteria cri = new Criteria();
		cri.setPage(2);
		cri.setPerPageNum(20);
		
		List<BoardDTO> list = boardDAO.listCriteria(cri);
		
		for(BoardDTO boardDTO : list) {
			LOGGER.info(boardDTO.getBno()+ ":" + boardDTO.getTitle());
		}
	}
}
