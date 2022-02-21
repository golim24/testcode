package com.spring.web.service;

import java.util.List;

import com.spring.web.vo.CapVO;
import com.spring.web.vo.ChartCountVO;
import com.spring.web.vo.StBoardVO;
import com.spring.web.vo.StResultVO;

public interface StBoardService {
	
	// BoardList
	List<StBoardVO> getStBoardList(StBoardVO vo);
	List<StResultVO> getStResultList();
	List<StResultVO> getStResultDayList();
	List<StResultVO> getStResultDaySelectList(StResultVO vo1);
	ChartCountVO getStResultChartCount();
	List<CapVO> getMapList();
	List<CapVO> getMapSnpList();
	List<CapVO> getMapSecList();
	List<CapVO> getMapSnpSecList();

}
