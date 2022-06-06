package kr.co.jisu.repository;

import java.util.Map;

import kr.co.jisu.domain.UserDTO;

public interface UserDAO {
	@SuppressWarnings("rawtypes")
	public Map login(Map<String,Object> map); //로그인
	public int join(UserDTO dto); //회원가입
	public int checkId(UserDTO dto) throws Exception ;  //가입 중복체크
}
