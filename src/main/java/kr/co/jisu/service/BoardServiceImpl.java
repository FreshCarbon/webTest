package kr.co.jisu.service;

import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;
import kr.co.jisu.common.SearchCriteria;
import kr.co.jisu.domain.BoardDTO;
import kr.co.jisu.repository.BoardDAO;
import kr.co.jisu.domain.ReplyDTO;

@Service
public class BoardServiceImpl implements BoardService{
	@Inject
	private BoardDAO boardDAO;
	
	@Override
	public List<BoardDTO> listSearch(SearchCriteria cri) throws Exception {
		return boardDAO.listSearch(cri);
	}
	
	@Override
	public int countPaging(SearchCriteria cri) throws Exception {
		return boardDAO.countPaging(cri);
	}
	
	@Override
	public BoardDTO detail(int bno) {
		boardDAO.hitCnt(bno);
		return boardDAO.detail(bno);
	}

	@Override
	public int regist(BoardDTO dto) {
		return boardDAO.regist(dto);
	}

	@Override
	public int update(BoardDTO dto) {
		return boardDAO.update(dto);
	}

	@Override
	public int delete(int bno) {
		return boardDAO.delete(bno);
	}

	@Override
	public List<ReplyDTO> replyList(int bno) {
		return boardDAO.replyList(bno);
	}

	@Override
	public int replyRegist(ReplyDTO dto) {
		return boardDAO.replyRegist(dto);
	}

	@Override
	public int replyUpdate(ReplyDTO dto) {
		return boardDAO.replyUpdate(dto);
	}

	@Override
	public int replyDelete(int reno) {
		return boardDAO.replyDelete(reno);
	}


	

	
	



	
}
