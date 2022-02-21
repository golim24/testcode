package com.spring.web.common;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

//@ControllerAdvice("com.spring.web.controller")
public class CommonExceptionHandler {

	@ExceptionHandler(ArithmeticException.class)
	public ModelAndView handlerArithmeticException(Exception e) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("exception",e);
		modelAndView.setViewName("/error/error.jsp");
		return modelAndView;
	}
	
	@ExceptionHandler(NullPointerException.class)
	public ModelAndView handlerNullPointerException(Exception e) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("exception",e);
		modelAndView.setViewName("/error/error.jsp");
		return modelAndView;
	}
	
	@ExceptionHandler(Exception.class)
	public ModelAndView handlerException(Exception e) {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("exception",e);
		modelAndView.setViewName("/error/error.jsp");
		return modelAndView;
	}
	
}
