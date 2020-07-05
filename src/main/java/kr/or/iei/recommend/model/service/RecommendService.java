package kr.or.iei.recommend.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.sun.javafx.collections.MappingChange.Map;

import kr.or.iei.common.model.vo.BoardComment;
import kr.or.iei.common.model.vo.Region;
import kr.or.iei.recommend.model.dao.RecommendDao;
import kr.or.iei.recommend.model.vo.Recommend;
import kr.or.iei.recommend.model.vo.SelectItems;
import kr.or.iei.tour.model.vo.Photo;

@Service("recommendService")
public class RecommendService {
	@Autowired
	@Qualifier("recommendDao")
	private RecommendDao dao;

	public ArrayList<Region> selectAllRegion() {
		List list = dao.selectAllRegion();
		return (ArrayList<Region>)list;
	}

	public ArrayList<Region> selectCities(String country) {
		List list = dao.selectCities(country);
		return (ArrayList<Region>)list;
		
	}
	
	public ArrayList<Recommend> selectAllRec() {
		List list = dao.selectAllRec();
		return (ArrayList<Recommend>)(list);
	}

	public ArrayList<Recommend> selectRecList(SelectItems items) {
		System.out.println(items.regionCountry + items.regionCity + items.recCategory + items.search);
		List list = dao.selectRecList(items);
		
		return (ArrayList<Recommend>)list;
	}

	public Recommend selectOneRec(int recNo) {
		// TODO Auto-generated method stub
		return dao.selectOneRec(recNo);
	}
	public ArrayList<BoardComment> selectComments(int recNo) {
		List list = dao.selectComments(recNo);
		return (ArrayList<BoardComment>)list;
	}

	public int insertComment(BoardComment comment) {
		// TODO Auto-generated method stub
//		if(comment.getRefComment() == 0) {
//			String st = String.valueOf(comment.getRefComment());
//		}
		return dao.insertComment(comment);
	}

	public int insertRec(Recommend rec, String p) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		System.out.println(rec.getRecCategory());
		System.out.println(rec.getCoords());
		System.out.println(rec.getPlace());
		map.put("recTitle", rec.getRecTitle());
		map.put("recContent", rec.getRecContent());
		map.put("recWriter", rec.getRecWriter());
		map.put("recCategory", rec.getRecCategory());
		map.put("regionNo", rec.getRegionNo());
		map.put("coords", rec.getCoords());
		map.put("place", rec.getPlace());
		map.put("p", p);
		System.out.println(map.get("coords"));
		System.out.println(map.get("place"));
		return dao.insertRec(map);
	}

	


	
}
