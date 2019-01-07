package qcg.dao.impl;

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
	List<User> list();
}
