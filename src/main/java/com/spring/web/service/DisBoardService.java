package com.spring.web.service;

import java.util.List;

import com.spring.web.vo.CommentVO;
import com.spring.web.vo.DisBoardVO;

public interface DisBoardService {
	
	// BoardList
	List<DisBoardVO> getDisBoardList(DisBoardVO vo);
	List<CommentVO> getCommentList(DisBoardVO vo);
	DisBoardVO getDisBoard(DisBoardVO vo);
	int insertDisBoard(DisBoardVO vo);
	int insertCommnet(CommentVO vo);
	int updateCnt(DisBoardVO vo);
	int updateReplyCnt(CommentVO vo);
	int gteDistBoardListCnt();
	


}
