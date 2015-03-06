package gis.taiwan.score;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

public class ScoreLogout extends Action  {
	
	public ActionForward execute(ActionMapping mapping, ActionForm form
	         , HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		session.removeAttribute("score_id");		
		response.sendRedirect("score/");
		
		return null;
	}
}
