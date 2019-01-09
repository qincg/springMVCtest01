package qcg.dao;

import java.util.List;

public interface BaseDao<T> {
	boolean create(T t);
	boolean delete(String id);
	boolean modify(T t);
	List<T> list(int page, int limit);
	int size();
}
