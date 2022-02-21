package com.spring.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.web.dao.DisBoardDAOMybatisTempleate;
import com.spring.web.vo.CommentVO;
import com.spring.web.vo.DisBoardVO;

@Service("DisBoardService")
public class DisBoardServiceImpl implements DisBoardService{
	
	@Autowired
	private DisBoardDAOMybatisTempleate DisBoardDAO;
	
	public DisBoardServiceImpl() {
		System.out.println("DisBoardServiceImpl 생성");
	}

	@Override
	public List<DisBoardVO> getDisBoardList(DisBoardVO vo) {
		List<DisBoardVO> boardList = DisBoardDAO.getDisBoardList(vo);
		return boardList;
	}
	
	@Override
	public List<CommentVO> getCommentList(DisBoardVO vo) {
		List<CommentVO> commentList = DisBoardDAO.getCommentList(vo);
		return commentList;
	}
	@Override
	public DisBoardVO getDisBoard(DisBoardVO vo) {
		DisBoardVO disBoard = DisBoardDAO.getDisBoard(vo);
		return disBoard;
	}

	@Override
	public int insertDisBoard(DisBoardVO vo) {
		return DisBoardDAO.insertDisBoard(vo);
	}

	@Override
	public int insertCommnet(CommentVO vo) {
		return DisBoardDAO.insertComment(vo);
	}

	@Override
	public int updateCnt(DisBoardVO vo) {
		// TODO Auto-generated method stub
		return DisBoardDAO.updateCnt(vo);
	}

	@Override
	public int updateReplyCnt(CommentVO vo) {
		// TODO Auto-generated method stub
		return DisBoardDAO.updateReplyCnt(vo);
	}

	@Override
	public int gteDistBoardListCnt() {
		int listCnt = DisBoardDAO.getDisBoardListCnt();
		return listCnt;
	}




}
