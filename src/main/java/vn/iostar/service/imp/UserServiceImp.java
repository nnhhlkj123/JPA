package vn.iostar.service.imp;

import java.util.List;
import vn.iostar.dao.IUserDao;
import vn.iostar.dao.imp.UserDao;
import vn.iostar.entity.User;
import vn.iostar.service.IUserService;

public class UserServiceImp implements IUserService {

	private IUserDao userDao = new UserDao();

	@Override
	public List<User> findAll() {
		return userDao.findAll();
	}

	@Override
	public User findById(int id) {
		return userDao.findById(id);
	}

	@Override
	public List<User> searchByUserName(String userName) {
		return userDao.searchByUserName(userName);
	}

	@Override
	public void insert(User user) {
		User existingUser = this.findByEmail(user.getEmail());

		if (existingUser == null) {
			userDao.insert(user);
		}
	}

	@Override
	public void update(User user) {
		User existingUser = this.findById(user.getId());

		if (existingUser != null) {
			userDao.update(user);
		}
	}

	@Override
	public void delete(int id) {
		try {
			userDao.delete(id);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public int count() {
		return userDao.count();
	}

	@Override
	public List<User> findAll(int page, int pageSize) {
		return userDao.findAll(page, pageSize);
	}

	@Override
	public User findByEmail(String email) {
		try {
			return userDao.findByEmail(email);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}
}
