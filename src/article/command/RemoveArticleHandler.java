package article.command;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import article.service.ArticleData;
import article.service.ArticleNotFoundException;
import article.service.ModifyArticleService;
import article.service.ModifyRequest;
import article.service.PermissionDeniedException;
import article.service.RemoveArticleService;
import auth.service.User;
import mvc.command.CommandHandler;

public class RemoveArticleHandler implements CommandHandler {
	private static final String FORM_VIEW = "listArticle";
	private RemoveArticleService removeService = new RemoveArticleService();
	
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
		String writerId = req.getParameter("writerId");
		int no = Integer.parseInt(noVal);
		
		User authUser = (User) req.getSession().getAttribute("authUser");

		if (!authUser.getId().equals(writerId)) {
			res.sendError(HttpServletResponse.SC_FORBIDDEN);
			return null;
		}
		
		Map<String, Boolean> errors = new HashMap<>();
		req.setAttribute("errors", errors);
		
		if (noVal == null || noVal.isEmpty()) {
			errors.put("no", Boolean.TRUE);
		}
		
		if (!errors.isEmpty()) {
			return FORM_VIEW;
		}
		
		try {
			removeService.remove(no);
			res.sendRedirect("list.do");
			return null;
			
		} catch (ArticleNotFoundException e) {
			res.sendError(HttpServletResponse.SC_NOT_FOUND);
			return null;
		} catch (PermissionDeniedException e) {
			res.sendError(HttpServletResponse.SC_FORBIDDEN);
			return null;
		}
		
	}
	
	private String processSubmit(HttpServletRequest req, HttpServletResponse res) {
		// TODO Auto-generated method stub
		return null;
	}
}
