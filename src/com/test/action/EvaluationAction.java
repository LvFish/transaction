package com.test.action;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;
import com.test.dao.EvaluationDao;

public class EvaluationAction implements Action {

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		try {
			HttpSession session = ServletActionContext.getRequest().getSession();
			String uId = session.getAttribute("uId").toString();
			if(uId==null){
				return "failed";
			}
			EvaluationDao evaluationDao = new EvaluationDao();
			session.setAttribute("evaluationList", evaluationDao.queryByUId(uId));
			return "success";
		} catch (Exception e) {
			return "failed";
		}
	}

	public String deleteEvaluation() throws ClassNotFoundException, SQLException {
		HttpServletRequest request = ServletActionContext.getRequest();
		String id = request.getParameter("id");
		EvaluationDao evaluationDao = new EvaluationDao();
		evaluationDao.deleteEvaluation(id);
		return null;
	}
	
	public String addEvaluation() throws ClassNotFoundException, SQLException{
		HttpServletRequest request = ServletActionContext.getRequest();
		String gId = request.getParameter("gId");
		String uId = request.getSession().getAttribute("uId").toString();
		String message = request.getParameter("message");
		EvaluationDao evaluationDao = new EvaluationDao();
		evaluationDao.insertEvaluation(uId, gId, message);
		return null;
	}

}
