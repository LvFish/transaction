package com.test.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.test.entity.CartEntity;

public class CartDao extends BaseDao{
	
	public List<CartEntity> queryAllCart(String uId,String orderType) throws ClassNotFoundException, SQLException{
		Connection conn = getConn();
		List<CartEntity> cartList = new ArrayList<>();
		Statement statement = conn.createStatement();
		String add = "";
		if(orderType.equals("1")){
			add = " order by publishedTime desc";
		}else if(orderType.equals("2")){	//价格升序
			add = " order by price ";
		}else{
			add = " order by price desc";	//价格降序
		}
		String sql = "select c.*,g.name,g.url,g.price,g.publishedStatus from shopping_cart c "
				+ " left join good g"
				+ " on g.id = c.goodId"
				+ " where c.customerId = "+uId; //准备sql语句
		sql = sql + add;
		System.out.println("sql: "+sql);
		ResultSet resultSet = statement.executeQuery(sql);
		while(resultSet.next()){
			CartEntity cart = new CartEntity();
			cart.setId(resultSet.getInt(1));
			cart.setGoodId(resultSet.getInt(2));
			cart.setCustomerId(resultSet.getInt(3));
			cart.setName(resultSet.getString(4));
			cart.setUrl(resultSet.getString(5));
			cart.setPrice(resultSet.getString(6));
			cart.setPublishedStatus(resultSet.getString(7));
			cartList.add(cart);
		}
			//关闭（倒关）
		resultSet.close();
		statement.close();
		conn.close();
		return cartList;
	}
	
	public void insertCart(String uId,String gId) throws ClassNotFoundException, SQLException{
		if(isInCart(uId,gId)){
			return;
		}else{
			Connection conn = getConn();
			String sql = "insert into shopping_cart (goodId,customerId) values("+gId+","+uId+")";
			PreparedStatement pstmt;
			try{
				pstmt = (PreparedStatement) conn.prepareStatement(sql);
				pstmt.executeUpdate();
				pstmt.close();
				conn.close();
			}catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public boolean isInCart(String uId,String gId) throws ClassNotFoundException, SQLException{
		boolean flag = false;
		Connection connention = getConn();
		Statement statement = connention.createStatement();
		Map<String, Object> session = ActionContext.getContext().getSession();  //记录用户登录信息 
		String sql = "SELECT * FROM shopping_cart where goodId = "+gId+" and customerId="+uId; //准备sql语句
		ResultSet resultSet = statement.executeQuery(sql);
		while(resultSet.next()){
			flag = true;
//			System.out.println(resultSet.getInt(1));
		}
			//关闭（倒关）
		resultSet.close();
		statement.close();
		connention.close();
		return flag;
	}
	
	public void deleteCart(String uId,String gId) throws ClassNotFoundException, SQLException{
		Connection conn = getConn();
		String sql;
		sql = "delete from shopping_cart where goodId = "+gId+" and customerId = "+uId;
		System.out.println(sql);
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
}
