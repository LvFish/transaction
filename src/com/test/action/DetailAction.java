package com.test.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;
import com.test.dao.EvaluationDao;
import com.test.dao.GoodDao;
import com.test.dao.SellDao;
import com.test.entity.GoodEntity;

public class DetailAction implements Action{

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		HttpServletRequest request = ServletActionContext.getRequest();
		String gId = request.getParameter("gId");
		GoodEntity good = new GoodEntity();
		GoodDao goodDao  = new GoodDao();
		SellDao sellDao  = new SellDao();
		EvaluationDao evaluationDao = new EvaluationDao();
		good = goodDao.queryByGId(gId);
		int uId = good.getPublishedBy();
		int sellNumber = sellDao.querySellNumberByUId(String.valueOf(uId));
		int buyNumber = sellDao.queryBuyNumberByUId(String.valueOf(uId));
		HttpSession session = request.getSession();
		session.setAttribute("good", good);
		session.setAttribute("sellNumber",sellNumber);
		session.setAttribute("buyNumber", buyNumber);
		session.setAttribute("evaluationList", evaluationDao.queryByGId(gId));
		return "success";
	}

}
