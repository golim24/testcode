package com.spring.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.spring.web.service.StBoardService;
import com.spring.web.vo.CapVO;
import com.spring.web.vo.ChartCountVO;
import com.spring.web.vo.StBoardVO;
import com.spring.web.vo.StResultVO;

@Controller
@SessionAttributes("StBoard")
public class StBoardController {

	@Autowired	
	private StBoardService StBoardService;

	@RequestMapping(value="/getStBoardList.do")
	
	public String getStBoardList(StBoardVO vo,StResultVO vo1, Model model){
		System.out.println("GetStBoardListController");
		System.out.println(">>>>>>>>>>>>>>>>>>"+vo1.getDate());
		List<StResultVO> resultDayList = StBoardService.getStResultDayList();
		if (vo1.getDate() != null) {
			List<StResultVO> resultDaySelectList = StBoardService.getStResultDaySelectList(vo1);
			model.addAttribute("StResultSelectDayList", resultDaySelectList);// reqeust.setAttribute()
		}else {
			List<StResultVO> resultList = StBoardService.getStResultList();
			model.addAttribute("StResultList", resultList);// reqeust.setAttribute()
		}
		List<StBoardVO> list = StBoardService.getStBoardList(vo);
		ChartCountVO chartCount = StBoardService.getStResultChartCount();

		System.out.println(chartCount);

		model.addAttribute("StBoardList", list);// reqeust.setAttribute()
		model.addAttribute("StResultDayList", resultDayList);// reqeust.setAttribute()
		model.addAttribute("chartCount", chartCount);// reqeust.setAttribute()
		
		//modelAndView.setViewName("redirect:getBoardList.jsp");
		//modelAndView.setViewName("getBoardList");// viewResolver  사용시

		return "StBoardList.jsp";

	}
	@RequestMapping(value="/getStResultListJson.do", method = RequestMethod.POST)
	@ResponseBody
	public List<StResultVO> getStResultList(Model model){
		System.out.println("GetStBoardListController");
		
		List<StResultVO> list = StBoardService.getStResultList();
		
		model.addAttribute("StBoardList", list);// reqeust.setAttribute()
		//modelAndView.setViewName("redirect:getBoardList.jsp");
		//modelAndView.setViewName("getBoardList");// viewResolver  사용시
		System.out.println(list);
		
		return list;

	}
	@RequestMapping(value="/getMapJson.do", method = RequestMethod.POST)
	@ResponseBody
	public List<CapVO> getMapList(Model model){
		System.out.println("GetStBoardListController");
		
		List<CapVO> koCapList = StBoardService.getMapList();
		
		model.addAttribute("koCapList", koCapList);// reqeust.setAttribute()
		//modelAndView.setViewName("redirect:getBoardList.jsp");
		//modelAndView.setViewName("getBoardList");// viewResolver  사용시
		
		return koCapList;
		
	}
	@RequestMapping(value="/getMapSnpJson.do", method = RequestMethod.POST)
	@ResponseBody
	public List<CapVO> getMapSnpList(Model model){
		System.out.println("GetStBoardListController");
		
		List<CapVO> snpCapList = StBoardService.getMapSnpList();
		
		model.addAttribute("snpCapList", snpCapList);// reqeust.setAttribute()
		//modelAndView.setViewName("redirect:getBoardList.jsp");
		//modelAndView.setViewName("getBoardList");// viewResolver  사용시
		
		return snpCapList;
		
	}
	
	@RequestMapping(value="/getMapSecJson.do", method = RequestMethod.POST)
	@ResponseBody
	public List<CapVO> getMapSecList(Model model){
		System.out.println("GetStBoardListController");
		
		List<CapVO> koSecList = StBoardService.getMapSecList();
		
		model.addAttribute("koSecList", koSecList);// reqeust.setAttribute()
		//modelAndView.setViewName("redirect:getBoardList.jsp");
		//modelAndView.setViewName("getBoardList");// viewResolver  사용시
		System.out.println(koSecList);
		
		return koSecList;
		
	}
	
	@RequestMapping(value="/getMapSnpSecJson.do", method = RequestMethod.POST)
	@ResponseBody
	public List<CapVO> getMapSnpSecList(Model model){
		System.out.println("GetStBoardListController");
		
		List<CapVO> snpSecList = StBoardService.getMapSnpSecList();
		
		model.addAttribute("snpSecList", snpSecList);// reqeust.setAttribute()
		//modelAndView.setViewName("redirect:getBoardList.jsp");
		//modelAndView.setViewName("getBoardList");// viewResolver  사용시
		System.out.println(snpSecList);
		
		return snpSecList;
		
	}
}
