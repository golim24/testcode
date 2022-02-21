package com.spring.web.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.web.vo.UserVO;

@Repository
public class UserDAOMybatisTempleate{

	@Autowired
	private SqlSessionTemplate mybatis;
	
		
	public UserVO getUser(UserVO vo) {
		System.out.println("mybatis - getUser()");
		return mybatis.selectOne("userDAO.getUser", vo);
	}
	
	public List<UserVO> getUserList(UserVO vo) {
		System.out.println("mybatis - getuser()");
		return mybatis.selectList("userDAO.getUserList", vo);
	}
	public int joinUser(UserVO vo) {
		System.out.println("mybatis - joinuser()");
		System.out.println(vo.getFavoChar());
		return mybatis.insert("userDAO.joinUser", vo);
	}
	
	public int idCheck(String id) {
		System.out.println("mybatis - idCheck()");
		System.out.println(id);
		return mybatis.selectOne("userDAO.idCheck", id);		
	}
	public int deleteUserCherk(UserVO vo) {
		System.out.println("mybatis - deleteUserCherk()");
		System.out.println(vo);
		return mybatis.selectOne("userDAO.deleteUserCherk", vo);		
	}
	public int deleteUser(UserVO vo) {
		System.out.println("mybatis - deleteUser()");
		System.out.println(vo);
		return mybatis.delete("userDAO.deleteUser", vo);		
	}

}










