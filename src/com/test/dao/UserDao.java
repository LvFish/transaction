package com.test.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.test.dao.BaseDao;
import com.test.entity.UserEntity;
import com.opensymphony.xwork2.ActionContext;

public class UserDao extends BaseDao {
	public boolean login(String username, String password,int type) throws ClassNotFoundException, SQLException {
		boolean flag = false;
		Connection connention = getConn();
		Statement statement = connention.createStatement();
		Map<String, Object> session = ActionContext.getContext().getSession(); // 记录用户登录信息
		String sql = "SELECT * FROM user where username = '" + username + "' and password='" + password + "'"; // 准备sql语句
		ResultSet resultSet = statement.executeQuery(sql);
		while (resultSet.next()) {
			flag = true;
			int permission = resultSet.getInt(4);
			if (permission == type) {			//通过type区分用户和管理员
				session.put("username", username);
				session.put("uId", resultSet.getInt(1));
				session.put("permission", permission);
			}
			// System.out.println(resultSet.getInt(1));
		}
		// 关闭（倒关）
		resultSet.close();
		statement.close();
		connention.close();
		return flag;
	}

	public List<UserEntity> queryAll() throws ClassNotFoundException, SQLException {
		Connection conn = getConn();
		List<UserEntity> userList = new ArrayList<>();
		Statement statement = conn.createStatement();
		String sql = "SELECT * FROM user "; // 准备sql语句
		ResultSet resultSet = statement.executeQuery(sql);
		while (resultSet.next()) {
			UserEntity user = new UserEntity();
			user.setuId(resultSet.getInt(1));
			user.setUsername(resultSet.getString(2));
			// user.setPassword(resultSet.getString(3));
			user.setPermission(resultSet.getInt(4));
			userList.add(user);
		}
		// 关闭（倒关）
		resultSet.close();
		statement.close();
		conn.close();
		return userList;
	}

	public List<UserEntity> queryByPId(String pid) throws ClassNotFoundException, SQLException {
		Connection conn = getConn();
		List<UserEntity> userList = new ArrayList<>();
		Statement statement = conn.createStatement();
		String sql = "SELECT*FROM USER WHERE uid IN (SELECT uid FROM personnel WHERE pid=" + pid + ")"; // 准备sql语句
		ResultSet resultSet = statement.executeQuery(sql);
		while (resultSet.next()) {
			UserEntity user = new UserEntity();
			user.setuId(resultSet.getInt(1));
			user.setUsername(resultSet.getString(2));
			user.setPassword(resultSet.getString(3));
			user.setPermission(resultSet.getInt(4));
			userList.add(user);
		}
		// 关闭（倒关）
		resultSet.close();
		statement.close();
		conn.close();
		return userList;
	}

	public List<UserEntity> queryByUName(String username) throws ClassNotFoundException, SQLException {
		Connection conn = getConn();
		List<UserEntity> userList = new ArrayList<>();
		Statement statement = conn.createStatement();
		String sql = "SELECT*FROM USER WHERE username like '%" + username + "%';"; // 准备sql语句
		ResultSet resultSet = statement.executeQuery(sql);
		while (resultSet.next()) {
			UserEntity user = new UserEntity();
			user.setuId(resultSet.getInt(1));
			user.setUsername(resultSet.getString(2));
			// user.setPassword(resultSet.getString(3));
			user.setPermission(resultSet.getInt(4));
			userList.add(user);
		}
		// 关闭（倒关）
		resultSet.close();
		statement.close();
		conn.close();
		return userList;
	}

	public void addUser(String username, String password) throws ClassNotFoundException, SQLException {
		Connection conn = getConn();
		String sql = "insert into user (username,password,permission) values('" + username + "','" + password + "',2)";
		PreparedStatement pstmt;
		try {
			pstmt = (PreparedStatement) conn.prepareStatement(sql);
			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void editUserPassword(String uid, String password) throws ClassNotFoundException, SQLException {
		Connection conn = getConn();
		String sql;
		sql = "update user set  password = '" + password + "' where uid = " + uid;
		PreparedStatement pstmt;
		try {
			pstmt = (PreparedStatement) conn.prepareStatement(sql);
			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public List<UserEntity> getAllUser() throws ClassNotFoundException, SQLException{
		Connection conn = getConn();
		List<UserEntity> userList = new ArrayList<>();
		Statement statement = conn.createStatement();
		String sql = "SELECT*FROM USER WHERE permission = 2"; // 准备sql语句
		ResultSet resultSet = statement.executeQuery(sql);
		while (resultSet.next()) {
			UserEntity user = new UserEntity();
			user.setuId(resultSet.getInt(1));
			user.setUsername(resultSet.getString(2));
			// user.setPassword(resultSet.getString(3));
			user.setPermission(resultSet.getInt(4));
			userList.add(user);
		}
		// 关闭（倒关）
		resultSet.close();
		statement.close();
		conn.close();
		return userList;
	}
}