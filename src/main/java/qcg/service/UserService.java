package qcg.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import qcg.bean.User;
import qcg.dao.impl.UserDao;
import qcg.util.StringUtil;

import java.util.List;

/**
 * @Author: qcg
 * @Description:
 * @Date: 2019/1/9 15:58
 */
@Service
public class UserService {
	@Autowired
	private UserDao userDao;

	public List<User> list(int page, int limit) {
		return userDao.list((page - 1) * limit, limit);
	}

	public boolean add(User user) {
		user.setId(StringUtil.getUUID());
		return userDao.create(user);
	}

	public int size() {
		return userDao.size();
	}
}
