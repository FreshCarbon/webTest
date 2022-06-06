package kr.co.jisu.repository;

import java.util.List;
import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import kr.co.jisu.common.SearchCriteria;
import kr.co.jisu.domain.BoardDTO;
import kr.co.jisu.domain.ReplyDTO;

@Repository
public class BoardDAOImpl implements BoardDAO{
	@Inject
	private SqlSession sqlSession;
	
	private static final String nameSpace = "kr.co.jisu.mappers.boardMapper";
	
	@Override
	public List<BoardDTO> listSearch(SearchCriteria cri) throws Exception {
		return sqlSession.selectList(nameSpace+".listSearch", cri);
	}
	@Override
	public int countPaging(SearchCriteria cri) throws Exception {
		return sqlSession.selectOne(nameSpace+".countPaging", cri);
	}
	
	@Override
	public BoardDTO detail(int bno) {
		return sqlSession.selectOne(nameSpace+".detail", bno);
	}

	@Override
	public int regist(BoardDTO dto) {
		return sqlSession.insert(nameSpace+".regist", dto);
	}

	@Override
	public int update(BoardDTO dto) {
		return sqlSession.update(nameSpace+".update", dto);
	}

	@Override
	public int delete(int bno) {
		return sqlSession.delete(nameSpace+".delete", bno);
	}

	@Override
	public int hitCnt(int bno) {
		return sqlSession.update(nameSpace+".hitCnt", bno);
	}

	@Override
	public List<ReplyDTO> replyList(int bno) {
		return sqlSession.selectList(nameSpace+".replyList", bno); //댓글조회
	}

	@Override
	public int replyRegist(ReplyDTO dto) {
		return sqlSession.insert(nameSpace+".replyRegist", dto);
	}

	@Override
	public int replyUpdate(ReplyDTO dto) {
		return sqlSession.update(nameSpace+".replyUpdate", dto);
	}

	@Override
	public int replyDelete(int reno) {
		return sqlSession.delete(nameSpace+".replyDelete", reno);
	}








	
	
	

}
