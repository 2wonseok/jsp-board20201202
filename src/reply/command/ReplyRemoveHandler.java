package reply.command;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import article.service.ArticleNotFoundException;
import article.service.PermissionDeniedException;
import article.service.ReadArticleService;
import auth.service.User;
import mvc.command.CommandHandler;
import reply.service.ReplyRemoveService;
import reply.service.ReplyService;

public class ReplyRemoveHandler implements CommandHandler {
	private static final String FORM_VIEW = null;
	private ReplyRemoveService replyRemoveService = new ReplyRemoveService();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String writerId = req.getParameter("writerId");
		String noVal = req.getParameter("no");
		int articleNo = Integer.parseInt(req.getParameter("articleNo"));
		String pageNo = req.getParameter("pageNo");
		int no = Integer.parseInt(noVal);
		User authUser = (User) req.getSession().getAttribute("authUser");

		if (!authUser.getId().equals(writerId)) {
			res.sendError(HttpServletResponse.SC_FORBIDDEN);
			return null;
		}
		
		try {
			replyRemoveService.remove(no);
			res.sendRedirect(req.getContextPath()+"/article/read.do?no="+articleNo+"&pageNo="+pageNo);
			return null;
			
		} catch (ArticleNotFoundException e) {
			res.sendError(HttpServletResponse.SC_NOT_FOUND);
			return null;
		} catch (PermissionDeniedException e) {
			res.sendError(HttpServletResponse.SC_FORBIDDEN);
			return null;
		}


	}
}
