package vn.iostar.service;

import java.util.List;
import vn.iostar.entity.User;

public interface IUserService {
	void insert(User user);

	int count();

	List<User> findAll(int page, int pageSize);

	List<User> searchByUserName(String userName);

	List<User> findAll();

	User findById(int id);

	void delete(int id) throws Exception;

	void update(User user);

	User findByEmail(String email);
}
