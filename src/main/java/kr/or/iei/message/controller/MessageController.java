package kr.or.iei.message.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.iei.common.alarmHandler;
import kr.or.iei.member.model.vo.Member;
import kr.or.iei.message.model.service.MessageService;
import kr.or.iei.message.model.vo.Message;
import kr.or.iei.message.model.vo.MessageViewData;
import kr.or.iei.notification.controller.NotificationController;
import kr.or.iei.message.model.vo.InboxPageData;

@Controller
@RequestMapping("/message")
public class MessageController {
	
	@Autowired
	NotificationController notificationController;

	@Autowired
	@Qualifier("messageService")
	private MessageService service;
	
	@Autowired
	@Qualifier("alarmHandler")
	alarmHandler handler;

	
	// 수정
	@ResponseBody
	@RequestMapping(value = "/acceptInvite.do", produces = "text/html;charset=utf-8")
	public String acceptInvite(HttpSession session, int tripNo) {
		
		Member member = (Member) session.getAttribute("member");
		
		int result = service.acceptInvite(member, tripNo);
		
		return String.valueOf(result);
	}
	
	
	// 수정
	@ResponseBody
	@RequestMapping(value = "/rejectInvite.do", produces = "text/html;charset=utf-8")
	public String rejectInvite(HttpSession session, String receiverId, int tripNo) {
		
		Member member = (Member) session.getAttribute("member");
		
		int result = service.rejectInvite(member, receiverId, tripNo);
		
		return String.valueOf(result);
	}
	
	
	// 수정
	@ResponseBody
	@RequestMapping(value = "/invite.do", produces = "text/html;charset=utf-8")
	public String inviteMember(HttpSession session, String receiver, int tripNo) {
		
		Member member = (Member) session.getAttribute("member");				
		
		int result = service.inviteTripMember(member, receiver, tripNo);
		
		return String.valueOf(result);
	}
	
	@RequestMapping("/testView.do")
	public String test() {
		return "message/inviteView";
	}
	
	@RequestMapping("/view.do")
	public String messageView(HttpSession session, String messageNo, Model model) {

		Member member = (Member) session.getAttribute("member");
				
		MessageViewData mvd = service.selectOneMessage(member, Integer.parseInt(messageNo));
		model.addAttribute("message", mvd.getMessage());
		model.addAttribute("unchkCount", mvd.getUnchkCount());
		model.addAttribute("msgTotalCount", mvd.getMsgTotalCount());
		
		return "message/messageView";
	}

	@RequestMapping("/viewSendMessage.do")
	public String viewSendMessage(HttpSession session, String messageNo, Model model) {
		Member member = (Member) session.getAttribute("member");

		MessageViewData mvd = service.selectSendMessage(member, Integer.parseInt(messageNo));
		model.addAttribute("message", mvd.getMessage());
		model.addAttribute("sendCount", mvd.getSendCount());

		return "message/messageView";
	}

	@RequestMapping("/viewUnreadMessage.do")
	public String viewUnreadMessage(HttpSession session, Model model) {

		Member member = (Member) session.getAttribute("member");

		InboxPageData pd = service.selectUnreadMessage(member);

		model.addAttribute("unchkCount", pd.getUnchkCount());
		model.addAttribute("msgTotalCount", pd.getMsgTotalCount());
		model.addAttribute("list", pd.getList());

		return "message/inbox";
	}

	@RequestMapping("/delete.do")
	public String deleteMessage(HttpSession session, String messageNo, Model model) {

		Member member = (Member) session.getAttribute("member");

		int result = service.deleteMessage(member, Integer.parseInt(messageNo));

		if (result > 0) {
			model.addAttribute("msg", "쪽지가 삭제되었습니다.");
			model.addAttribute("loc", "/message/inbox.do");
		} else {
			model.addAttribute("msg", "쪽지 삭제에 실패하였습니다.");
			model.addAttribute("loc", "/message/view.do?messageNo=" + messageNo);
		}

		return "common/msg";
	}

	@RequestMapping("/write.do")
	public String messageWriteByNickName(String receiver, Model model) {
		if (receiver != null) {
			String memberId = service.selectMemberId(receiver);
			if(memberId != null) {
				model.addAttribute("receiverNick", receiver);	
				model.addAttribute("receiver",memberId);
			} else {
				model.addAttribute("msg","상대방을 조회할 수 없습니다.");
				model.addAttribute("loc","/message/inbox.do");
				return "common/msg";
			}
		}
		return "message/write";
	}
	
	@RequestMapping("/writeById.do")
	public String messageWriteById(String memberId, Model model) {
		if (memberId != null) {
			String receiverNick = service.selectMemberNick(memberId);
			if(receiverNick != null) {
				model.addAttribute("receiverNick", receiverNick);
				model.addAttribute("receiver",memberId);
			} else {
				model.addAttribute("msg","상대방을 조회할 수 없습니다.");
				model.addAttribute("loc","/message/inbox.do");
				return "common/msg";
			}
		}
		return "message/write";
	}
	
	@RequestMapping("/outbox.do")
	public String selectOutboxMessage(HttpSession session, Model m) {
		Member member = (Member) session.getAttribute("member");

		InboxPageData pd = service.selectSendMessageList(member);

		m.addAttribute("msgTotalCount", pd.getMsgTotalCount());
		m.addAttribute("list", pd.getList());

		return "message/outbox";
	}

	@RequestMapping("/inbox.do")
	public String selectMemberMessage(HttpSession session, Model m) {

		Member member = (Member) session.getAttribute("member");

		InboxPageData pd = service.selectReceiveMessageList(member);

		m.addAttribute("unchkCount", pd.getUnchkCount());
		m.addAttribute("msgTotalCount", pd.getMsgTotalCount());
		m.addAttribute("list", pd.getList());

		return "message/inbox";
	}

	@RequestMapping("/send.do")
	public String messageSend(Message m, Model model) {
		
		int result = service.insertMessage(m);
		if (result > 0) {
			model.addAttribute("msg", "메세지를 전송하였습니다.");
			notificationController.sendMessge(m.getMessageSender(), m.getMessageReceiver());
		} else {
			model.addAttribute("msg", "메세지를 전송에 실패하였습니다.");
		}		

		model.addAttribute("loc", "/message/inbox.do");
		return "common/msg";
	}

	@ResponseBody
	@RequestMapping(value = "/asyncDelete.do", produces = "text/html;charset=utf-8")
	public String deleteMessage(HttpSession session, String messageNo) {
		Member member = (Member) session.getAttribute("member");

		int result = 0;
		if (member != null) {
			result = service.deleteMessage(member, Integer.parseInt(messageNo));
		}

		return String.valueOf(result);
	}

	@ResponseBody
	@RequestMapping(value = "/checkId.do", produces = "text/html;charset=utf-8")
	public String checkId(String receiver) {
		String result = service.checkMemberId(receiver);
		return result;
	}

	@RequestMapping("/deleteAllReadMessage.do")
	public String deleteAllReadMessage(HttpSession session, Model model) {

		Member member = (Member) session.getAttribute("member");

		int result = service.deleteAllReadMessage(member);
		if (result < 0) {
			model.addAttribute("msg", "삭제할 쪽지가 없습니다.");
		} else if (result > 0) {
			model.addAttribute("msg", "쪽지가 삭제되었습니다.");
		} else {
			model.addAttribute("msg", "쪽지 삭제에 실패하였습니다.");
		}
		model.addAttribute("loc", "/message/inbox.do");

		return "common/msg";
	}

	@RequestMapping("/deleteAllReceivedMessage.do")
	public String deleteAllReceivedMessage(HttpSession session, Model model) {
		Member member = (Member) session.getAttribute("member");

		int result = service.deleteAllReceivedMessage(member);
		if (result < 0) {
			model.addAttribute("msg", "삭제할 쪽지가 없습니다.");
		} else if (result > 0) {
			model.addAttribute("msg", "쪽지가 삭제되었습니다.");
		} else {
			model.addAttribute("msg", "쪽지 삭제에 실패하였습니다.");
		}

		model.addAttribute("loc", "/message/inbox.do");

		return "common/msg";
	}

	@RequestMapping("/deleteAllSendMessage.do")
	public String deleteAllSendMessage(HttpSession session, Model model) {
		Member member = (Member) session.getAttribute("member");

		int result = service.deleteAllSendMessage(member);
		if (result < 0) {
			model.addAttribute("msg", "삭제할 쪽지가 없습니다.");
		} else if (result > 0) {
			model.addAttribute("msg", "쪽지가 삭제되었습니다.");
		} else {
			model.addAttribute("msg", "쪽지 삭제에 실패하였습니다.");
		}
		model.addAttribute("loc", "/message/inbox.do");

		return "common/msg";
	}
	
	@RequestMapping("/deleteAllSendRead.do")
	public String deleteAllSendRead(HttpSession session, Model model) {
		Member member = (Member) session.getAttribute("member");
		
		
		int result = service.deleteAllSendRead(member);
		if (result < 0) {
			model.addAttribute("msg", "삭제할 쪽지가 없습니다.");
		} else if (result > 0) {
			model.addAttribute("msg", "쪽지가 삭제되었습니다.");
		} else {
			model.addAttribute("msg", "쪽지 삭제에 실패하였습니다.");
		}
		model.addAttribute("loc", "/message/inbox.do");

		return "common/msg";
	}
	
	@RequestMapping("/deleteCheckMessage.do")
	public String deleteCheckMessage(HttpSession session, Model model, int[] messageNo) {
		
		Member member = (Member)session.getAttribute("member");
		
		int result = service.deleteCheckMessage(member, messageNo);
		
		if(result > 0) {
			model.addAttribute("msg","쪽지가 삭제되었습니다.");
			model.addAttribute("loc","/message/inbox.do");
		} else if(result < 0) {
			model.addAttribute("msg","쪽지가 삭제되었습니다.");
			model.addAttribute("loc","/message/outbox.do");
		} else {
			model.addAttribute("msg","쪽지 삭제를 실패하였습니다.");
			model.addAttribute("loc","/message/inbox.do");
		}
		
		return "common/msg";			
	}

}
