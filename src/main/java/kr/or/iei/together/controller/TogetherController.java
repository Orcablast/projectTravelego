package kr.or.iei.together.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import com.google.gson.Gson;

import kr.or.iei.common.TogetherWSHandler;
import kr.or.iei.common.model.vo.Region;
import kr.or.iei.member.model.service.MemberService;
import kr.or.iei.member.model.vo.Member;
import kr.or.iei.together.model.service.TogetherService;
import kr.or.iei.together.model.vo.MainPageDTO;
import kr.or.iei.together.model.vo.TogetherBoardVO;
import kr.or.iei.together.model.vo.TogetherCommentListVO;
import kr.or.iei.together.model.vo.TogetherCommentVO;

@Controller
@RequestMapping("/together")
public class TogetherController {
	
	@Autowired
	TogetherService service;
	
	@Autowired
	@Qualifier("togetherWSHandler")
	TogetherWSHandler wsHandler;
	
	
	@RequestMapping(value = "/singleView.do")
	public String singleView(int boardNo, Model model) {
		
		TogetherBoardVO vo = service.selectOneBoard(boardNo);
		
		model.addAttribute("board",vo);
		return "together/view";
	}
	
	@ResponseBody
	@RequestMapping(value = "/modComment.do", produces = "text/html;charset=utf-8")
	public String asyncModifyComment(TogetherCommentVO comment) {
		int result = service.updateComment(comment);
		
		return String.valueOf(result);
	}
	
	@ResponseBody
	@RequestMapping(value = "/asyncLoadByKeyword.do", produces = "application/json;charset=utf-8")
	public String asyncLoadByKeyword(int lastNum, String keyword) {
		ArrayList<TogetherBoardVO> list = service.selectBoardListByKeyword(lastNum,keyword);
		return new Gson().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping(value = "/asyncBoardByKeyword.do", produces = "application/json;charset=utf-8")
	public String selectBoardByKeyword(String searchKeyword) {
		ArrayList<TogetherBoardVO> list = service.selectBoardListByKeyword(searchKeyword);		
		return new Gson().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping(value = "/asyncLoadByRegion.do",produces = "application/json;charset=utf-8")
	public String asyncLoadByRegion(int regionNo, int lastNum) {
		ArrayList<TogetherBoardVO> list = service.selectBoardListByRegion(regionNo, lastNum);
		return new Gson().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping(value = "/asyncBoardByRegion.do", produces = "application/json;charset=utf-8")
	public String selectBoardByRegion(int regionNo) {
		ArrayList<TogetherBoardVO> list = service.selectBoardListByRegion(regionNo);
		return new Gson().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping(value = "/delete.do", produces = "text/html;charset=utf-8")
	public String deleteBoard(int boardNo) {
		int result = service.deleteBoard(boardNo);
		return String.valueOf(result);
	}
	
	@ResponseBody
	@RequestMapping(value = "/modify.do", produces = "text/html;charset=utf-8")
	public String modifyBoard(TogetherBoardVO vo) {
		int result = service.modifyBoard(vo);
		return String.valueOf(result);
	}
	
	@ResponseBody
	@RequestMapping(value = "/modifyFrm.do", produces = "application/json;charset=utf-8")
	public String modifyFrm(int boardNo) {
		TogetherBoardVO vo = service.selectOneBoard(boardNo);
		vo.setTogetherContent(vo.getTogetherContent().replaceAll("<br/>","\r\n"));
		return new Gson().toJson(vo);
	}
	
	@ResponseBody
	@RequestMapping(value = "/asyncCommentLoad.do", produces = "application/json;charset=utf-8")
	public String asyncCommentLoad(int boardNo) {
		TogetherCommentListVO listVo = service.selectCommentList(boardNo);
		return new Gson().toJson(listVo);
	}
	
	@ResponseBody
	@RequestMapping(value = "/writeComment.do", produces = "text/html;charset=utf-8")
	public String writeComment(TogetherCommentVO comment) {
		int result = service.insertComment(comment);
		return String.valueOf(result);
	}
	
	@ResponseBody
	@RequestMapping(value = "/asyncLoad.do", produces = "application/json;charset=utf-8")
	public String asyncLoad(int lastNum) {
		ArrayList<TogetherBoardVO> list = service.selectBoardList(lastNum);
		return new Gson().toJson(list);
	}
	
	@ResponseBody
	@RequestMapping(value = "/view.do", produces = "application/json;charset=utf-8")
	public String asyncView(int togetherNo) {
		TogetherBoardVO vo = service.selectOneBoard(togetherNo);
		return new Gson().toJson(vo);
	}
		
	@RequestMapping("/main.do")
	public String main(Model model) {
		
		MainPageDTO mpd = service.selectBoardList();
		model.addAttribute("list",mpd.getBoardList());
		model.addAttribute("regionList",mpd.getRegionList());
		return "together/main";
	}
	
	@ResponseBody
	@RequestMapping(value = "/write.do", produces = "text/html;charset=utf-8")
	public String boardWrite(TogetherBoardVO board) {
		int result = service.insertBoard(board);
		wsHandler.sendInsertAlarm(board.getTogetherNo());
		return String.valueOf(result);
	}
	
	@ResponseBody
	@RequestMapping(value = "/searchRegion.do", produces = "application/json;charset=utf-8")
	public String searchRegion(String keyword) {
		ArrayList<Region> list = service.selectRegionByKeyword(keyword);
				
		return new Gson().toJson(list);
	}
	
}
