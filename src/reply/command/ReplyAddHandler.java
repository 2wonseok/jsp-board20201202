package reply.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import auth.service.User;
import mvc.command.CommandHandler;
import reply.service.ReplyAddService;

public class ReplyAddHandler implements CommandHandler {
	private ReplyAddService addService = new ReplyAddService();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("authUser");
		
		String modReply = req.getParameter("modReply");
		String replyId = req.getParameter("replyId");
		
		int articleNo = Integer.parseInt(req.getParameter("no"));
		String userId = user.getId();
		String body = req.getParameter("body");
		String pageNo = req.getParameter("pageNo");
		
//		if (modReply != null && replyId != null) {
//			addService.modify(replyId, articleNo, body);
//		} 
		
		addService.add(userId, articleNo, body);

		res.sendRedirect(req.getContextPath()+"/article/read.do?no="+articleNo+"&pageNo="+pageNo);
		
		return null;
		
	}

}
