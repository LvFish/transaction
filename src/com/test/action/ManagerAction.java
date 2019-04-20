package com.test.action;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;
import com.test.dao.UserDao;
import com.test.entity.UserEntity;

public class ManagerAction implements Action {

	@Override
	public String execute() {
		// TODO Auto-generated method stub
		try {
			HttpSession session = ServletActionContext.getRequest().getSession();
			String uId = session.getAttribute("uId").toString();
			if (uId == null) {
				return "failed";
			}
			UserDao userDao = new UserDao();
			List<UserEntity> userList = userDao.getAllUser();
			session.setAttribute("userList", userList);
			return "success";
		} catch (Exception e) {
			return "failed";
		}
	}

	public String editUser() throws ClassNotFoundException, SQLException {
		UserDao userDao = new UserDao();
		HttpServletRequest request = ServletActionContext.getRequest();
		String uId = request.getParameter("uId");
		String password = request.getParameter("password");
		userDao.editUserPassword(uId, password);
		return null;
	}
}
