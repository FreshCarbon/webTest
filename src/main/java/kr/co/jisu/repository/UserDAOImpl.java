package kr.co.jisu.repository;

import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.jisu.domain.UserDTO;

@Repository
public class UserDAOImpl implements UserDAO{

	private static final String nameSpace = "kr.co.jisu.mappers.userMapper";
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	@SuppressWarnings("rawtypes")
	public Map login(Map<String, Object> map) {
		return sqlSession.selectOne(nameSpace+".login",map);
	}

	@Override
	public int join(UserDTO dto) {
		return sqlSession.insert(nameSpace+".join", dto);
	}

	@Override
	public int checkId(UserDTO dto) throws Exception {
		return sqlSession.selectOne(nameSpace+".checkId", dto);
	}

}
