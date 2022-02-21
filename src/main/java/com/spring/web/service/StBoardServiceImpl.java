package com.spring.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.web.dao.StBoardDAOMybatisTempleate;
import com.spring.web.vo.CapVO;
import com.spring.web.vo.ChartCountVO;
import com.spring.web.vo.StBoardVO;
import com.spring.web.vo.StResultVO;

@Service("StBoardService")
public class StBoardServiceImpl implements StBoardService{
	
	@Autowired
	private StBoardDAOMybatisTempleate StBoardDAO;
	
	public StBoardServiceImpl() {
		System.out.println("BoardServiceImpl 생성");
	}

	@Override
	public List<StBoardVO> getStBoardList(StBoardVO vo) {
		List<StBoardVO> boardList = StBoardDAO.getStBoardList(vo);
		return boardList;
	}

	@Override
	public List<StResultVO> getStResultList() {
		List<StResultVO> resultList = StBoardDAO.getStResultList();
		return resultList;
	}

	@Override
	public List<StResultVO> getStResultDayList() {
		List<StResultVO> dayList = StBoardDAO.getStResultDayList();
		return dayList;
	}

	@Override
	public List<StResultVO> getStResultDaySelectList(StResultVO vo1) {
		List<StResultVO> selectDayList = StBoardDAO.getStResultDaySelectList(vo1);
		return selectDayList;
	}

	@Override
	public ChartCountVO getStResultChartCount() {
		ChartCountVO chartCount = StBoardDAO.getStResultChartCount();
		return chartCount;
	}

	@Override
	public List<CapVO> getMapList() {
		List<CapVO> koCapList = StBoardDAO.getMapList();
		return koCapList;
	}

	@Override
	public List<CapVO> getMapSnpList() {
		List<CapVO> snpCapList = StBoardDAO.getMapSnpList();
		return snpCapList;
	}
	
	@Override
	public List<CapVO> getMapSecList() {
		List<CapVO> koSecList = StBoardDAO.getMapSecList();
		return koSecList;
	}
	
	@Override
	public List<CapVO> getMapSnpSecList() {
		List<CapVO> snpSecList = StBoardDAO.getMapSnpSecList();
		return snpSecList;
	}

}
