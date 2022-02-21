package com.spring.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.spring.web.service.DisBoardService;
import com.spring.web.vo.CommentVO;
import com.spring.web.vo.DisBoardVO;
import com.spring.web.vo.PagingVO;

@Controller
@SessionAttributes("DisBoard")
public class DisBoardController {

	@Autowired	
	private DisBoardService DisBoardService;

	@RequestMapping(value="/getDisBoardList.do")
	
	public String getDisBoardList(
			@RequestParam(required = false, defaultValue = "1") int curPage,
			@RequestParam(required = false, defaultValue = "1") int range,
			DisBoardVO vo, Model model){
		System.out.println("GetDisBoardListController");
		
		if(vo.getSearchType() == null) vo.setSearchType("");
		if(vo.getSearchKeyword() == null) vo.setSearchKeyword("");
		
		System.out.println(vo.getSearchType());
		System.out.println(vo.getSearchKeyword());
		
		
		int listCnt = DisBoardService.gteDistBoardListCnt();
		PagingVO pagingvo = new PagingVO();
		pagingvo.pageInfo(curPage, range, listCnt);
		model.addAttribute("pagingVo", pagingvo);
		
		
		vo.setStartList(pagingvo.getStartList());
		vo.setListSize(pagingvo.getListSize());
		
		List<DisBoardVO> list = DisBoardService.getDisBoardList(vo);
		model.addAttribute("DisBoardList", list);// reqeust.setAttribute()
		
		return "DisBoardList.jsp";
		
	}
	@RequestMapping(value="/getDisBoard.do")
	
	public String getDisBoard(DisBoardVO vo, Model model){
		System.out.println("GetDisBoardController");
		
		int rs = DisBoardService.updateCnt(vo);
		
		DisBoardVO disBoard = DisBoardService.getDisBoard(vo);
		List<CommentVO> commentList = DisBoardService.getCommentList(vo);
		System.out.println(disBoard.getCnt());
		model.addAttribute("DisBoard", disBoard);// reqeust.setAttribute()
		model.addAttribute("commentList", commentList);// reqeust.setAttribute()
		
		return "getDisBoard.jsp";
		
	}
	
	@RequestMapping("/insertDisBoard.do")
	public String insertDisBoard(DisBoardVO vo) {
		System.out.println("InsertDisBoardController");


		int rs = DisBoardService.insertDisBoard(vo);

		return "redirect:getDisBoardList.do";
	}
	
	@RequestMapping("/insertComment.do")
	public String insertComment(CommentVO vo) {
		System.out.println("InsertCommentController");
		
		
		int rs = DisBoardService.insertCommnet(vo);
		int rs1 = DisBoardService.updateReplyCnt(vo);
		
		return "redirect:getDisBoardList.do";
	}


}
