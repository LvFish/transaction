package com.test.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.test.entity.RecordEntity;

public class RecordDao extends BaseDao{
	public List<RecordEntity> queryAllRecord(String id){
		List<RecordEntity> recordEntities = new ArrayList<>();
		String sql1 = "select s.goodId,s.customerId,g.name,g.price,g.url from  sell_detail s "
				+ "left join good g "
				+ "on s.goodId = g.id "
				+ "where s.customerId = "+id;
		String sql2 = "select s.goodId,g.publishedBy,g.name,g.price,g.url from  sell_detail s "
				+ "left join good g "
				+ "on s.goodId = g.id "
				+ "where g.publishedBy = "+id;
		try {
			Connection conn = getConn();
			Statement statement = conn.createStatement();
			ResultSet resultSet = statement.executeQuery(sql1);
			while (resultSet.next()) {
				RecordEntity record = new RecordEntity();
				record.setgId(resultSet.getInt(1));
				record.setcId(resultSet.getInt(2));
				record.setName(resultSet.getString(3));
				record.setPrice(resultSet.getString(4));
				record.setUrl(resultSet.getString(5));
				record.setRecordStatus("买入");
				recordEntities.add(record);
			}
			resultSet = statement.executeQuery(sql2);
			while (resultSet.next()) {
				RecordEntity record = new RecordEntity();
				record.setgId(resultSet.getInt(1));
				record.setcId(resultSet.getInt(2));
				record.setName(resultSet.getString(3));
				record.setPrice(resultSet.getString(4));
				record.setUrl(resultSet.getString(5));
				record.setRecordStatus("卖出");
				recordEntities.add(record);
			}
			// 关闭（倒关）
			resultSet.close();
			statement.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return recordEntities;
	}
}
