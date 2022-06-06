package kr.co.jisu.service;

import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.jisu.domain.UserDTO;
import kr.co.jisu.repository.UserDAO;

@Service
public class UserServiceImpl implements UserService{

	@Inject
	private UserDAO userDAO;
	
	@SuppressWarnings("rawtypes")
	@Override
	public Map login(Map<String, Object> map) {
		return userDAO.login(map);
	}

	@Override
	public int join(UserDTO dto) {
		return userDAO.join(dto);
	}

	@Override
	public int checkId(UserDTO dto) throws Exception {
		return userDAO.checkId(dto);
	}

}
