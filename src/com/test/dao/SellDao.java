package com.test.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;

public class SellDao extends BaseDao{
	public void insertSell(String gId,String uId) throws ClassNotFoundException{
		SimpleDateFormat fmt=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String time = fmt.format(new Date());
		String sql = "insert into sell_detail (goodId,customerId,sellTime) values("+gId+","+uId+",'"+time+"')";
		PreparedStatement pstmt;
		try{
			Connection conn = getConn();
			pstmt = (PreparedStatement) conn.prepareStatement(sql);
			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
		}catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public int querySellNumberByUId(String uId){
		int number = 0;
		try {
			Connection conn = getConn();
			Statement statement = conn.createStatement();
			String sql = "select count(*) from sell_detail s "
					+ "left join good g "
					+ "on g.id = s.goodId "
					+ "left join user u "
					+ "on u.uid = g.publishedBy "
					+ "where u.uid = "+uId; // 准备sql语句
			ResultSet resultSet = statement.executeQuery(sql);
			while (resultSet.next()) {
				number = resultSet.getInt(1);
			}
			// 关闭（倒关）
			resultSet.close();
			statement.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return number;
	}
	
	public int queryBuyNumberByUId(String uId){
		int number = 0;
		try {
			Connection conn = getConn();
			Statement statement = conn.createStatement();
			String sql = "select count(*) from sell_detail where customerId = "+uId; // 准备sql语句
			ResultSet resultSet = statement.executeQuery(sql);
			while (resultSet.next()) {
				number = resultSet.getInt(1);
			}
			// 关闭（倒关）
			resultSet.close();
			statement.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return number;
	}
}
