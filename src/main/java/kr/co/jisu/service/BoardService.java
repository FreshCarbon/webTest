package kr.co.jisu.service;

import java.util.List;
import org.springframework.stereotype.Service;
import kr.co.jisu.common.SearchCriteria;
import kr.co.jisu.domain.BoardDTO;
import kr.co.jisu.domain.ReplyDTO;

@Service
public interface BoardService {
	
	public List<BoardDTO> listSearch(SearchCriteria cri) throws Exception;
	public int countPaging (SearchCriteria cri) throws Exception;
	public BoardDTO detail(int bno);
	public int regist(BoardDTO dto);
	public int update(BoardDTO dto);
	public int delete(int bno);
	
	public List<ReplyDTO> replyList(int bno);
	public int replyRegist(ReplyDTO dto);
	public int replyUpdate(ReplyDTO dto);
	public int replyDelete(int reno);
	

}
