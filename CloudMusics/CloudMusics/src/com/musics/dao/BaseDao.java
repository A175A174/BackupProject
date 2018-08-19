package com.musics.dao;

import java.sql.SQLException;
import java.util.List;

public interface BaseDao<T> {
	T select(T t) throws SQLException;
	List<T> selects(T t) throws SQLException;
	boolean update(T t) throws SQLException;
}
