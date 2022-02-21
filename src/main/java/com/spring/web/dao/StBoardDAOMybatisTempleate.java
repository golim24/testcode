package com.spring.web.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.web.vo.CapVO;
import com.spring.web.vo.ChartCountVO;
import com.spring.web.vo.StBoardVO;
import com.spring.web.vo.StResultVO;

@Repository
public class StBoardDAOMybatisTempleate{

	@Autowired
	private SqlSessionTemplate mybatis;

	public  List<StBoardVO> getStBoardList(StBoardVO vo) {
		System.out.println("mybatis - getStBoardList()");
		return mybatis.selectList("StBoardDAO.getStBoardList",vo);
	}
	
	public  List<StResultVO> getStResultList() {
		System.out.println("mybatis - getStResultList()");
		List<StResultVO> resultList = mybatis.selectList("StBoardDAO.getStResultList");
		return resultList;
	}
	public  List<StResultVO> getStResultDayList() {
		System.out.println("mybatis - getStResultDayList()");
		List<StResultVO> dayList = mybatis.selectList("StBoardDAO.getStResultDayList");
		return dayList;
	}
	public  List<StResultVO> getStResultDaySelectList(StResultVO vo1) {
		System.out.println("mybatis - getStResultDaySelectList()");
		List<StResultVO> resultDaySelectList = mybatis.selectList("StBoardDAO.getStResultDaySelectList",vo1);
		return resultDaySelectList;
	}
	public  ChartCountVO getStResultChartCount() {
		System.out.println("mybatis - getStResultChartCount()");
		ChartCountVO chartCount = mybatis.selectOne("StBoardDAO.getStResultChartCount");
		return chartCount;
	}

	public  List<CapVO> getMapList() {
		System.out.println("mybatis - getMapList()");
		List<CapVO> koCapList = mybatis.selectList("StBoardDAO.getMapList");
		return koCapList;
	}
	
	public  List<CapVO> getMapSnpList() {
		System.out.println("mybatis - getMapSnpList()");
		List<CapVO> snpCapList = mybatis.selectList("StBoardDAO.getMapSnpList");
		return snpCapList;
	}
	
	public  List<CapVO> getMapSecList() {
		System.out.println("mybatis - getMapList()");
		List<CapVO> koSecList = mybatis.selectList("StBoardDAO.getMapSecList");
		return koSecList;
	}
	
	public  List<CapVO> getMapSnpSecList() {
		System.out.println("mybatis - getMapList()");
		List<CapVO> snpSecList = mybatis.selectList("StBoardDAO.getMapSnpSecList");
		return snpSecList;
	}

}










