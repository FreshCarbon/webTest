package kr.co.jisu.repository;

import java.util.List;
import org.springframework.stereotype.Repository;
import kr.co.jisu.common.SearchCriteria;
import kr.co.jisu.domain.BoardDTO;
import kr.co.jisu.domain.ReplyDTO;

@Repository
public interface BoardDAO {

	//검색 페이징처리
	public List<BoardDTO> listSearch(SearchCriteria cri) throws Exception;
	public int countPaging (SearchCriteria cri) throws Exception;
	
	public BoardDTO detail(int bno);
	public int regist(BoardDTO dto);
	public int update(BoardDTO dto);
	public int delete(int bno);
	public int hitCnt(int bno);
	
	public List<ReplyDTO> replyList(int bno);
	public int replyRegist(ReplyDTO dto);
	public int replyUpdate(ReplyDTO dto);
	public int replyDelete(int reno);
	
}
