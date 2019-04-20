package com.test.action;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;
import com.test.dao.CartDao;
import com.test.dao.GoodDao;
import com.test.dao.SellDao;
import com.test.entity.CartEntity;

public class CartAction implements Action {

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		try {
			HttpSession session = ServletActionContext.getRequest().getSession();
			String uId = session.getAttribute("uId").toString();
			if(uId==null){
				return "failed";
			}
			CartDao cartDao = new CartDao();
			List<CartEntity> list = cartDao.queryAllCart(uId, "1");
			session.setAttribute("cartList", list);
			return "success";
		} catch (Exception e) {
			return "failed";
		}
	}

	public String cartOrder() throws ClassNotFoundException, SQLException {
		try {
			HttpSession session = ServletActionContext.getRequest().getSession();
			String uId = session.getAttribute("uId").toString();
			String orderType = ServletActionContext.getRequest().getParameter("orderType").toString();
			CartDao cartDao = new CartDao();
			List<CartEntity> list = cartDao.queryAllCart(uId, orderType);
			session.setAttribute("cartList", list);
			return "success";
		} catch (Exception e) {
			return "failed";
		}
	}
	
	public String buyGood() throws ClassNotFoundException, SQLException{
		HttpSession session = ServletActionContext.getRequest().getSession();
		String uId = session.getAttribute("uId").toString();
		String gId = ServletActionContext.getRequest().getParameter("goodId").toString();
		CartDao cartDao = new CartDao();
		cartDao.deleteCart(uId, gId);
		SellDao sellDao = new SellDao();
		sellDao.insertSell(gId, uId);
		GoodDao goodDao = new GoodDao();
		goodDao.updateGood(gId);
		List<CartEntity> list = cartDao.queryAllCart(uId, "1");
		session.setAttribute("cartList", list);
		return "success";
	}
	
	public String deleteCart() throws ClassNotFoundException, SQLException{
		HttpSession session = ServletActionContext.getRequest().getSession();
		String uId = session.getAttribute("uId").toString();
		String gId = ServletActionContext.getRequest().getParameter("goodId").toString();
		CartDao cartDao = new CartDao();
		cartDao.deleteCart(uId, gId);
//		List<CartEntity> list = cartDao.queryAllCart(uId, "1");
//		session.setAttribute("cartList", list);
		return "cart";
	}
}
