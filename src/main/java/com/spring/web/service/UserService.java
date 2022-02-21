package com.spring.web.service;

import java.util.List;

import com.spring.web.vo.UserVO;

public interface UserService {
	
	// getUserList
	List<UserVO> getUserList();
	
	UserVO getUser(UserVO vo);
	
	int joinUser(UserVO vo);
	
	int idCheck(String id);
	
	int deleteUserCherk(UserVO vo);
	
	int deleteUser(UserVO vo);
}
