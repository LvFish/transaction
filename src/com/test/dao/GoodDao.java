package com.test.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.test.entity.GoodEntity;

public class GoodDao extends BaseDao {
	public List<GoodEntity> queryAllGoodsPage(int page,int size,String select,String input,String orderType) {
		String add = "";
		if(select.equals("2")){
			add = " where u.username like '%"+input+"%'";
		}else{
			add = " where name like '%"+input+"%'";
		}
		String add2 = "";
		if(orderType.equals("1")){
			add2 = " order by publishedTime desc";
		}else if(orderType.equals("2")){	//价格升序
			add2 = " order by price ";
		}else{
			add2 = " order by price desc";	//价格降序
		}
		List<GoodEntity> goodList = new ArrayList<>();
		try {
			Connection conn = getConn();
			Statement statement = conn.createStatement();
			String sql = "select g.*,u.username from good g "
					+ "left JOIN user u on u.uid = g.publishedBy"; // 准备sql语句
			sql = sql + add+add2+" limit "+page*size+","+size;
			System.out.println(sql);
			ResultSet resultSet = statement.executeQuery(sql);
			while (resultSet.next()) {
				GoodEntity good = new GoodEntity();
				good.setId(resultSet.getInt(1));
				good.setName(resultSet.getString(2));
				good.setUrl(resultSet.getString(3));
				good.setPrice(resultSet.getString(4));
				good.setDetail(resultSet.getString(5));
				good.setPublishedTime(resultSet.getString(6));
				good.setPublishedStatus(resultSet.getString(7));
				good.setPublishedBy(resultSet.getInt(8));
				good.setPublishedByName(resultSet.getString(9));
				goodList.add(good);
			}
			// 关闭（倒关）
			resultSet.close();
			statement.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return goodList;
	}
	
	public int queryNumberOfGood(int page,int size,String select,String input,String orderType){
		int number = 0;
		String add = "";
		if(select.equals("2")){
			add = " where u.username like '%"+input+"%'";
		}else{
			add = " where name like '%"+input+"%'";
		}
		try {
			Connection conn = getConn();
			Statement statement = conn.createStatement();
			String sql = "select count(*) from good g "
					+ "left JOIN user u on u.uid = g.publishedBy"; // 准备sql语句
			sql = sql + add;
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
	
	public void updateGood(String gId) throws ClassNotFoundException{
		String sql = "update good set publishedStatus = 'end' where id = "+gId;
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
	
	public List<GoodEntity> queryGoodByPublished(String uId,String orderType){
		String add = "";
		if(orderType.equals("1")){
			add = " order by publishedTime desc";
		}else if(orderType.equals("2")){	//价格升序
			add = " order by price ";
		}else{
			add = " order by price desc";	//价格降序
		}
		List<GoodEntity> goodList = new ArrayList<>();
		try {
			Connection conn = getConn();
			Statement statement = conn.createStatement();
			String sql = "select g.*,u.username from good g "
					+ "left JOIN user u on u.uid = g.publishedBy where g.publishedBy = "+uId; // 准备sql语句
			sql = sql + add;
			System.out.println(sql);
			ResultSet resultSet = statement.executeQuery(sql);
			while (resultSet.next()) {
				GoodEntity good = new GoodEntity();
				good.setId(resultSet.getInt(1));
				good.setName(resultSet.getString(2));
				good.setUrl(resultSet.getString(3));
				good.setPrice(resultSet.getString(4));
				good.setDetail(resultSet.getString(5));
				good.setPublishedTime(resultSet.getString(6));
				good.setPublishedStatus(resultSet.getString(7));
				good.setPublishedBy(resultSet.getInt(8));
				good.setPublishedByName(resultSet.getString(9));
				goodList.add(good);
			}
			// 关闭（倒关）
			resultSet.close();
			statement.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return goodList;
	}
	
	public void deletePublished(String id){
		String sql = "delete from good where id = "+id;
		PreparedStatement pstmt;
		try{
			Connection conn = getConn();
			pstmt = (PreparedStatement) conn.prepareStatement(sql);
			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void updateGood(String id,String url){
		String sql = "update good set url = '"+url+"' where id = "+id;
		PreparedStatement pstmt;
		try{
			Connection conn = getConn();
			pstmt = (PreparedStatement) conn.prepareStatement(sql);
			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public Integer addGood(String name,String price,String uId,String detail) throws ClassNotFoundException {
        Connection conn=null;
        PreparedStatement preparedStatement=null;
        ResultSet resultSet=null;
        Integer id=null;
        String sql = "insert into good (name,price,detail,publishedStatus,publishedTime,publishedBy) "
        		+ "values ('"+name+"',"+price+",'"+detail+"','sell',now(),"+uId+");";
        try {
            conn= getConn();
            //在preparedstatement里加入statement.RETURN_GENERATED_KEYS参数，代表需要获取自增主键值
            preparedStatement=conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
            //在这里必须先提交修改，然后再获取主键，否则会报空指针异常
            preparedStatement.executeUpdate();
            resultSet=preparedStatement.getGeneratedKeys();
            if(resultSet.next()){
                id=resultSet.getInt(1);
            }
            return id;
        } catch (SQLException e) {
            e.printStackTrace();
        }
		return id;
    }
	
	public GoodEntity queryByGId(String gId){
		GoodEntity good = new GoodEntity();
		String sql = "select g.*,u.username from  good g "
				+ "left join user u "
				+ "on u.uid = g.publishedBy where g.id = "+gId;
		try {
			Connection conn = getConn();
			Statement statement = conn.createStatement();
			System.out.println(sql);
			ResultSet resultSet = statement.executeQuery(sql);
			while (resultSet.next()) {
				good.setId(resultSet.getInt(1));
				good.setName(resultSet.getString(2));
				good.setUrl(resultSet.getString(3));
				good.setPrice(resultSet.getString(4));
				good.setDetail(resultSet.getString(5));
				good.setPublishedTime(resultSet.getString(6));
				good.setPublishedStatus(resultSet.getString(7));
				good.setPublishedBy(resultSet.getInt(8));
				good.setPublishedByName(resultSet.getString(9));
			}
			// 关闭（倒关）
			resultSet.close();
			statement.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return good;
	}
	
	public void deleteGood(String gId){
		String sql = "delete good , evaluation ,shopping_cart  "
				+ "from good , evaluation , shopping_cart "
				+ "where good.id = evaluation.goodId "
				+ "and good.id = shopping_cart.goodId "
				+ "and good.id = "+gId;
		PreparedStatement pstmt;
		try{
			Connection conn = getConn();
			pstmt = (PreparedStatement) conn.prepareStatement(sql);
			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
}
