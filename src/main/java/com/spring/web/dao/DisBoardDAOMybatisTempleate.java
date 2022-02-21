package com.spring.web.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.web.vo.CommentVO;
import com.spring.web.vo.DisBoardVO;
import com.spring.web.vo.PagingVO;

@Repository
public class DisBoardDAOMybatisTempleate{

	@Autowired
	private SqlSessionTemplate mybatis;

	public  List<DisBoardVO> getDisBoardList(DisBoardVO vo) {
		System.out.println("mybatis - getDisBoardList()");
		return mybatis.selectList("DisBoardDAO.getDisBoardList",vo);
	}
	public  List<CommentVO> getCommentList(DisBoardVO vo) {
		System.out.println("mybatis - getCommentList()");
		return mybatis.selectList("DisBoardDAO.getCommentList",vo);
	}
	public  DisBoardVO getDisBoard(DisBoardVO vo) {
		System.out.println("mybatis - getDisBoard()");
		return mybatis.selectOne("DisBoardDAO.getDisBoard",vo);
	}

	public int insertDisBoard(DisBoardVO vo) {
		System.out.println("mybatis - insertDisBoard()");
		return mybatis.insert("DisBoardDAO.insertDisBoard", vo);
	}
	public int updateCnt(DisBoardVO vo) {
		System.out.println("mybatis - insertComment()");
		return mybatis.update("DisBoardDAO.updateCnt", vo);
	}
	
	public int insertComment(CommentVO vo) {
		System.out.println("mybatis - insertComment()");
		return mybatis.insert("DisBoardDAO.insertComment", vo);
	}

	public int updateReplyCnt(CommentVO vo) {
		System.out.println("mybatis - updateReplyCnt()");
		return mybatis.update("DisBoardDAO.updateReplyCnt", vo);
	}
	public int getDisBoardListCnt() {
		System.out.println("mybatis - getDisBoardListCnt()");
		PagingVO listCnt = mybatis.selectOne("DisBoardDAO.getDisBoardListCnt");
		return listCnt.getListCnt();
	}

}










