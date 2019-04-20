package com.test.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.test.entity.EvaluationEntity;

public class EvaluationDao extends BaseDao{
	public List<EvaluationEntity> queryByUId(String uId) throws ClassNotFoundException, SQLException{
		Connection conn = getConn();
		List<EvaluationEntity> evaluationList = new ArrayList<>();
		Statement statement = conn.createStatement();
		String sql = "select e.*,g.name,u.username,g.url from evaluation e"
				+ " left join good g "
				+ " on e.goodId = g.id "
				+ " left join user u"
				+ " on u.uid = e.userId "
				+ "where g.publishedBy = "+uId+" order by evaluateTime desc"; //准备sql语句
		System.out.println("sql: "+sql);
		ResultSet resultSet = statement.executeQuery(sql);
		while(resultSet.next()){
			EvaluationEntity evaluation = new EvaluationEntity();
			evaluation.setId(resultSet.getInt(1));
			evaluation.setuId(resultSet.getInt(2));
			evaluation.setgId(resultSet.getInt(3));
			evaluation.setDetail(resultSet.getString(4));
			evaluation.setEvaluateTime(resultSet.getString(5));
			evaluation.setName(resultSet.getString(6));
			evaluation.setUsername(resultSet.getString(7));
			evaluation.setgUrl(resultSet.getString(8));
			evaluationList.add(evaluation);
		}
			//关闭（倒关）
		resultSet.close();
		statement.close();
		conn.close();
		return evaluationList;
	}
	
	public List<EvaluationEntity> queryByGId(String gId) throws ClassNotFoundException, SQLException{
		Connection conn = getConn();
		List<EvaluationEntity> evaluationList = new ArrayList<>();
		Statement statement = conn.createStatement();
		String sql = "select e.*,g.name,u.username,g.url from evaluation e"
				+ " left join good g "
				+ " on e.goodId = g.id "
				+ " left join user u"
				+ " on u.uid = e.userId "
				+ "where g.id = "+gId+" order by evaluateTime desc"; //准备sql语句
		System.out.println("sql: "+sql);
		ResultSet resultSet = statement.executeQuery(sql);
		while(resultSet.next()){
			EvaluationEntity evaluation = new EvaluationEntity();
			evaluation.setId(resultSet.getInt(1));
			evaluation.setuId(resultSet.getInt(2));
			evaluation.setgId(resultSet.getInt(3));
			evaluation.setDetail(resultSet.getString(4));
			evaluation.setEvaluateTime(resultSet.getString(5));
			evaluation.setName(resultSet.getString(6));
			evaluation.setUsername(resultSet.getString(7));
			evaluation.setgUrl(resultSet.getString(8));
			evaluationList.add(evaluation);
		}
			//关闭（倒关）
		resultSet.close();
		statement.close();
		conn.close();
		return evaluationList;
	}
	
	public void deleteEvaluation(String id) throws ClassNotFoundException, SQLException{
		Connection conn = getConn();
		String sql;
		sql = "delete from evaluation where id = "+id;
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
	
	public void insertEvaluation(String uId,String gId,String message) throws ClassNotFoundException, SQLException{
		Connection conn = getConn();
		String sql;
		sql = "insert into evaluation(userId,goodId,detail,evaluateTime) values ("+uId+","+gId+",'"+message+"',now())";
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
