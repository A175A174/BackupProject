package com.musics.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbcp2.BasicDataSource;

/**
 * 数据库工具
 */
public class DBUtil {
	private static String driver;//驱动
	private static String url;//连接字符串
	private static String user;//数据库用户名
	private static String password;//数据库密码
	
	private static BasicDataSource bds;

	static {
		init();
	}
	
	private static void init() {
		driver = "com.mysql.jdbc.Driver";
		url = "jdbc:mysql://127.0.0.1:3306/cloudmusics";
		user = "root";
		password = "root";
		bds = new BasicDataSource();
		bds.setDriverClassName(driver);//设置驱动
		bds.setUrl(url);
		bds.setUsername(user);
		bds.setPassword(password);
		bds.setInitialSize(10);//初始连接数
		bds.setMaxTotal(100);//最大连接数
		bds.setMaxIdle(80);//最大闲置连接数
		bds.setMinIdle(10);//最小闲置数
		bds.setMaxWaitMillis(10000);//获取连接的最大等待时间（ms）
	}
	
	public static Connection getConnection() throws SQLException {
		if (bds == null || bds.isClosed()) init();
		return bds.getConnection();
	}
	
	public interface CallBack<T>{
		T getData(ResultSet res) throws SQLException;
		List<T> getDatas(ResultSet res) throws SQLException;
	}
	
	public static <T> T select(String sql,CallBack<T> call,Object... objs) throws SQLException {
		Connection conn = getConnection();
		PreparedStatement ps = conn.prepareStatement(sql);
		for (int i = 0; i < objs.length; i++) ps.setObject(i+1, objs[i]);
		ResultSet res = ps.executeQuery();
		T t = call.getData(res);
		res.close();
		ps.close();
		conn.close();
		return t;
	}
	
	public static <T> List<T> selects(String sql,CallBack<T> call,Object... objs) throws SQLException {
		Connection conn = getConnection();
		PreparedStatement ps = conn.prepareStatement(sql);
		for (int i = 0; i < objs.length; i++) ps.setObject(i+1, objs[i]);
		ResultSet res = ps.executeQuery();
		List<T> ls = call.getDatas(res);
		res.close();
		ps.close();
		conn.close();
		return ls;
	}
	
	public static boolean update(Connection conn,String sql,Object... objs) throws SQLException {
		PreparedStatement ps = conn.prepareStatement(sql);
		for (int i = 0; i < objs.length; i++) ps.setObject(i+1, objs[i]);
		boolean bl = ps.executeUpdate()>=1?true:false;
		ps.close();
		return bl;
	}
}
