package auth.command;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import auth.service.LoginFailException;
import auth.service.RemoveService;
import mvc.command.CommandHandler;

public class RemoveHandler implements CommandHandler {
	private static final String FORM_VIEW = "index";
	private RemoveService removeService = new RemoveService();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if (req.getMethod().equalsIgnoreCase("GET")) {
			return processSubmit(req, res);
		} else if (req.getMethod().equalsIgnoreCase("POST")) {
			return processForm(req, res);
		} else {
			res.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
			return null;
		}
	}
	
	public String processForm(HttpServletRequest req, HttpServletResponse res) {
		return FORM_VIEW;
	}
	
	public String processSubmit(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String id = req.getParameter("id").trim();

		Map<String, Boolean> errors = new HashMap<>();
		req.setAttribute("errors", errors);
		
		if (id == null || id.isEmpty()) {
			errors.put("id", Boolean.TRUE);
		} 
		
		if (!errors.isEmpty()) {
			return FORM_VIEW;
		}
		
		
		try {
			HttpSession session = req.getSession(false);
			
			if (session != null) {
				session.invalidate();
			}
			
			removeService.remove(id);
			res.sendRedirect(req.getContextPath() + "/login.do");
			return null;
			
		} catch (LoginFailException e) {
			errors.put("idOrPwNotMatch", Boolean.TRUE);
			return FORM_VIEW;
		}
		
	}
	
	
	
}