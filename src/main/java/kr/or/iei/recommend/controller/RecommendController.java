package kr.or.iei.recommend.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.iei.common.model.vo.Region;
import kr.or.iei.recommend.model.service.RecommendService;


@Controller
public class RecommendController {

	@Autowired
	@Qualifier("recommendService")
	private RecommendService service;
	
	@RequestMapping(value="/recommendList.do")
	public String recommendList(Model model) {
		ArrayList<Region> region = service.selectAllRegion();
		model.addAttribute("region",region);
		return "recommend/recList";
	}
}
