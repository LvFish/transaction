package com.test.action;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;
import com.test.dao.CartDao;
import com.test.dao.GoodDao;
import com.test.dao.UserDao;

import net.sf.json.JSONObject;

public class IndexAction implements Action{

	private UserDao userDao;
	private GoodDao goodDao;
	private String result;
	
	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
		HttpSession session = ServletActionContext.getRequest().getSession();
		goodDao = new GoodDao();
		session.setAttribute("goodList", goodDao.queryAllGoodsPage(0, 10,"1","","1"));
		session.setAttribute("goodNumber", goodDao.queryNumberOfGood(0, 10,"1","","1"));
		session.setAttribute("nowPage", 1);
		session.setAttribute("findSelect", "1");
		session.setAttribute("findInput", "");
		session.setAttribute("orderType", "1");
		return "success";
	}
	
	public String managerIndex(){
		HttpSession session = ServletActionContext.getRequest().getSession();
		goodDao = new GoodDao();
		session.setAttribute("goodList", goodDao.queryAllGoodsPage(0, 10,"1","","1"));
		session.setAttribute("goodNumber", goodDao.queryNumberOfGood(0, 10,"1","","1"));
		session.setAttribute("nowPage", 1);
		session.setAttribute("findSelect", "1");
		session.setAttribute("findInput", "");
		session.setAttribute("orderType", "1");
		return "success";
	}
	
	public String queryByPage() throws Exception{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		int nowPage = Integer.valueOf(request.getParameter("nowPage").toString());
		String findSelect = request.getParameter("findSelect");
		String findInput = request.getParameter("findInput");
		String orderType = request.getParameter("orderType");
		if(findSelect == null){
			findSelect = session.getAttribute("findSelect").toString();
		}
		if(findInput == null){
			findInput = session.getAttribute("findInput").toString();
		}
		if(orderType == null){
			orderType = session.getAttribute("orderType").toString();
		}
		session.setAttribute("findSelect", findSelect);
		session.setAttribute("findInput", findInput);
		session.setAttribute("orderType", orderType);
		goodDao = new GoodDao();
		session.setAttribute("goodList", goodDao.queryAllGoodsPage(nowPage-1, 10,findSelect,findInput,orderType));
		session.setAttribute("goodNumber", goodDao.queryNumberOfGood(nowPage-1, 10,findSelect,findInput,orderType));
		session.setAttribute("nowPage", nowPage);
		String type = request.getParameter("type");
		if(type.equals("user")){
			return "success";
		}else{
			return "managerSuccess";
		}
	}
	
	public String login(){		//用户登陆接口
		HttpServletRequest request = ServletActionContext.getRequest();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		System.out.println(username+" "+password);
		userDao = new UserDao();
		try{
			userDao.login(username, password,2);
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
	public String managerLogin(){		//管理员登陆接口
		HttpServletRequest request = ServletActionContext.getRequest();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		Map<String,Object> map = new HashMap<String,Object>();
		System.out.println(username+" "+password);
		userDao = new UserDao();
		try{
			boolean flag=userDao.login(username, password,1);
			map.put("msg", flag);
		}catch(Exception e){
			e.printStackTrace();
			map.put("msg",false);
		}
		JSONObject json = JSONObject.fromObject(map);//将map对象转换成json类型数据
		result = json.toString();
		return SUCCESS;
	}
	
	public String exit(){
		HttpSession session = ServletActionContext.getRequest().getSession();
		session.removeAttribute("username");
		session.removeAttribute("permission");
		session.removeAttribute("uId");
		return null;
	}
	
	public String addCart() throws ClassNotFoundException, SQLException{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session = request.getSession();
		String uId = session.getAttribute("uId").toString();
		String gId = request.getParameter("goodId").toString();
		CartDao cartDao = new CartDao();
		cartDao.insertCart(uId, gId);
		return null;
	}

	public String addUser(){
		try{
			HttpServletRequest request = ServletActionContext.getRequest();
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			System.out.println(username+" "+password);
			UserDao userDao = new UserDao();
			userDao.addUser(username, password);
		}catch(Exception e){
			e.printStackTrace();
		}
		return  "success";
	}
	
	public String deleteGood(){
		HttpServletRequest request = ServletActionContext.getRequest();
		String goodId = request.getParameter("goodId");
		GoodDao goodDao = new GoodDao();
		goodDao.deleteGood(goodId);
		return null;
	}
	
}
