package reply.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import article.service.ArticleContentNotFoundException;
import article.service.ArticleData;
import article.service.ArticleNotFoundException;
import auth.service.User;
import mvc.command.CommandHandler;
import reply.model.Reply;
import reply.service.ReplyModifyService;

public class ReplyModifyHandler implements CommandHandler {
	private ReplyModifyService modifyService = new ReplyModifyService();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if (req.getMethod().equalsIgnoreCase("GET")) {
			return processForm(req, res);
		} else if (req.getMethod().equalsIgnoreCase("POST")) {
			return processSubmit(req, res);
		} else {
			res.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
			return null;
		}
	}

	private String processForm(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String noVal = req.getParameter("no");
		int articleNo = Integer.parseInt(req.getParameter("articleNo"));
		String pageNo = req.getParameter("pageNo");
		int no = Integer.parseInt(noVal);
		
		try {
			Reply modReply = modifyService.selectById(no);
			System.out.println(modReply.getId());
			System.out.println(modReply.getBody());
			
			HttpSession session = req.getSession();
			session.setAttribute("modReplys", modReply);
			
			req.setAttribute("modReplys", modReply);
			res.sendRedirect(req.getContextPath()+"/article/read.do?no="+articleNo+"&pageNo="+pageNo);
//			return "readArticle";
			return null;
		} catch (ArticleNotFoundException | ArticleContentNotFoundException e) {
			req.getServletContext().log("no article", e);
			res.sendError(HttpServletResponse.SC_NOT_FOUND);
			return null;
		}
		
	}

	private String processSubmit(HttpServletRequest req, HttpServletResponse res) {
		// TODO Auto-generated method stub
		return null;
	}

}
