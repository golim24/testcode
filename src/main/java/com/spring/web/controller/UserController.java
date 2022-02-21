package com.spring.web.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.web.service.UserService;
import com.spring.web.vo.UserVO;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;

	@RequestMapping(value="/login.do", method=RequestMethod.POST)
	public String login(UserVO vo, HttpSession session) {
		
		System.out.println("login()");
		
		if(vo.getId() == null || vo.getId().equals("")) {
			throw new IllegalArgumentException("login() - id not found");
		}
		
		String path = "";
		UserVO user = userService.getUser(vo);
		if(user != null) {
			session.setAttribute("userName", user.getName());
			session.setAttribute("userFavo", user.getFavoChar());
			session.setAttribute("userId", user.getId());
			path = "redirect:main.jsp";
		}else {
			path = "login.jsp";
		}
		
		return path;
	}
	
	
	@RequestMapping(value="/getUser.do")
	@ResponseBody
	public UserVO getUser(UserVO vo) {	
		System.out.println("getUser");	
		if(vo.getId() == null || vo.getId().equals("")) {
			throw new IllegalArgumentException("login() - id not found");
		}
		UserVO user = userService.getUser(vo);	
		return user;
	}
	
	@RequestMapping(value="/login.do", method=RequestMethod.GET)
	public String loginView(UserVO vo) {
		
		System.out.println("loginView()");
		
		String path = "login.jsp";
				
		return path;
	}	
	
	@RequestMapping(value="/logout.do")
	public String logout(HttpSession session){
		System.out.println("LogoutController");

		session.invalidate();
		
		return "redirect:index.jsp";	
	}
	
	@RequestMapping(value="/join.do")
	public String joinUser(UserVO vo, HttpSession session) {
		
		System.out.println(vo.getFavoChar());
		int rs = userService.joinUser(vo);
		UserVO user = userService.getUser(vo);
		session.setAttribute("userName", user.getName());
		session.setAttribute("userFavo", user.getFavoChar());
		return "main.jsp";
		
	}
	
	@RequestMapping(value="/idCheck.do", method = RequestMethod.POST)
	@ResponseBody
	public int idCheck(String id) {
		if(id==null || id.equals("")) {
			throw new IllegalArgumentException("login() - id not found");
		}			
		int result = userService.idCheck(id);

		return result;
	}
	@RequestMapping(value="/deleteUserCherk.do")
	@ResponseBody
	public int deleteUserCherk(UserVO vo) {
		System.out.println(vo);
		int result = userService.deleteUserCherk(vo);
		System.out.println(result);
		return result;
	}
	
	@RequestMapping("/deleteUser.do")
	public String deleteUser(UserVO vo) {
		System.out.println("DeleteUserController");
		int rs = userService.deleteUser(vo);
		return "index.jsp";
	}
}
