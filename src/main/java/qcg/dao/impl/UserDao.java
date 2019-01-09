package qcg.dao.impl;

import org.apache.ibatis.annotations.Param;
import qcg.bean.User;
import qcg.dao.BaseDao;

import java.util.List;

public interface UserDao extends BaseDao<User> {
	@Override
	boolean create(User user);

	@Override
	boolean delete(String id);

	@Override
	boolean modify(User user);

	@Override
	List<User> list(@Param("start") int start, @Param("limit") int limit);

	@Override
	int size();
}
