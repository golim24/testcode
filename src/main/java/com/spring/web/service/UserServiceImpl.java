package com.spring.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.web.dao.UserDAOMybatisTempleate;
import com.spring.web.vo.UserVO;

@Service("userService")
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserDAOMybatisTempleate userDAO;
	
	public UserServiceImpl() {
		System.out.println("userServiceImpl 생성");
	}

	@Override
	public UserVO getUser(UserVO vo) {
		
		return userDAO.getUser(vo);
	}

	@Override
	public List<UserVO> getUserList() {
		List<UserVO> userList = userDAO.getUserList(null);
		return userList;
	}



	@Override
	public int joinUser(UserVO vo) {
		int rs = userDAO.joinUser(vo);
		
		return rs;
	}

	@Override
	public int idCheck(String id) {
		
		int result = userDAO.idCheck(id);
		return result;
	}

	@Override
	public int deleteUserCherk(UserVO vo) {
		int result = userDAO.deleteUserCherk(vo);
		return result;
	}

	@Override
	public int deleteUser(UserVO vo) {
		int result = userDAO.deleteUser(vo);
		return result;
	}

}
