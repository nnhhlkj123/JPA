package vn.iostar.dao.imp;

import java.util.List;
import jakarta.persistence.*;
import vn.iostar.configs.JPAConfig;
import vn.iostar.dao.IUserDao;
import vn.iostar.entity.User;

public class UserDao implements IUserDao {

	@Override
	public void insert(User user) {
		EntityManager enma = JPAConfig.getEntityManager();
		EntityTransaction trans = enma.getTransaction();

		try {
			trans.begin();
			enma.persist(user); // Insert into the table
			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();
			trans.rollback();
			throw e;
		} finally {
			enma.close();
		}
	}

	@Override
	public void update(User user) {
		EntityManager enma = JPAConfig.getEntityManager();
		EntityTransaction trans = enma.getTransaction();

		try {
			trans.begin();
			enma.merge(user); // Update the table
			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();
			trans.rollback();
			throw e;
		} finally {
			enma.close();
		}
	}

	@Override
	public void delete(int id) throws Exception {
		EntityManager enma = JPAConfig.getEntityManager();
		EntityTransaction trans = enma.getTransaction();

		try {
			trans.begin();
			User user = enma.find(User.class, id);

			if (user != null) {
				enma.remove(user);
			} else {
				throw new Exception("User not found");
			}

			trans.commit();
		} catch (Exception e) {
			e.printStackTrace();
			trans.rollback();
			throw e;
		} finally {
			enma.close();
		}
	}

	@Override
	public User findById(int id) {
		EntityManager enma = JPAConfig.getEntityManager();
		User user = enma.find(User.class, id);
		return user;
	}

	@Override
	public User findByEmail(String email) throws Exception {
		EntityManager enma = JPAConfig.getEntityManager();
		String jpql = "SELECT u FROM User u WHERE u.email = :email";

		try {
			TypedQuery<User> query = enma.createQuery(jpql, User.class);
			query.setParameter("email", email);
			User user = query.getSingleResult();

			if (user == null) {
				throw new Exception("User with the given email does not exist");
			}

			return user;
		} finally {
			enma.close();
		}
	}

	@Override
	public List<User> findAll() {
		EntityManager enma = JPAConfig.getEntityManager();
		TypedQuery<User> query = enma.createNamedQuery("User.findAll", User.class);
		return query.getResultList();
	}

	@Override
	public List<User> searchByUserName(String userName) {
		EntityManager enma = JPAConfig.getEntityManager();
		String jpql = "SELECT u FROM User u WHERE u.userName LIKE :userName";

		TypedQuery<User> query = enma.createQuery(jpql, User.class);
		query.setParameter("userName", "%" + userName + "%");
		return query.getResultList();
	}

	@Override
	public List<User> findAll(int page, int pageSize) {
		EntityManager enma = JPAConfig.getEntityManager();
		TypedQuery<User> query = enma.createNamedQuery("User.findAll", User.class);
		query.setFirstResult(page * pageSize);
		query.setMaxResults(pageSize);
		return query.getResultList();
	}

	@Override
	public int count() {
		EntityManager enma = JPAConfig.getEntityManager();
		String jpql = "SELECT count(u) FROM User u";
		Query query = enma.createQuery(jpql);
		return ((Long) query.getSingleResult()).intValue();
	}
}
