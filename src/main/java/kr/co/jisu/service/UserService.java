package kr.co.jisu.service;

import java.util.Map;

import kr.co.jisu.domain.UserDTO;

public interface UserService {
	@SuppressWarnings("rawtypes")
	public Map login(Map<String, Object> map);
	public int join(UserDTO dto);
	public int checkId(UserDTO dto) throws Exception;
	
}
