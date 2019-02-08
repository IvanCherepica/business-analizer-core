package service;


import dao.UserDao;
import dao.UserDaoHibernateImpl;
import model.User;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;
import util.DBHelper;

import java.sql.SQLException;
import java.util.List;

public class UserServiceImpl implements UserService {
	private final UserDao userDao;

	private static volatile UserServiceImpl instance;

	private UserServiceImpl() throws ClassNotFoundException, SQLException, InstantiationException, IllegalAccessException {
		this.userDao = new UserDaoHibernateImpl(createSessionFactory(DBHelper.getConfiguration()));
	}

	public static UserServiceImpl getInstance() throws ClassNotFoundException, SQLException, InstantiationException, IllegalAccessException {
		if (instance == null) {
			synchronized (UserServiceImpl.class) {
				if (instance == null) {
					instance = new UserServiceImpl();
				}
			}
		}
		return instance;
	}

	@Override
	public User getUserById(long id) {
		return userDao.getUserById(id);
	}

	@Override
	public User getUserByName(String name) {
		return userDao.getUserByName(name);
	}

	@Override
	public void addUser(User user) {
		userDao.addUser(user);
	}

	@Override
	public void editUser(User user) {
		User existUser = userDao.getUserById(user.getId());
		if (existUser != null) {
			userDao.editUser(user);
		}
	}

	@Override
	public void remove(long id) {
		userDao.remove(id);
	}

	@Override
	public List<User> getAllUsers() {
		return userDao.getAllUsers();
	}

	private static SessionFactory createSessionFactory(Configuration configuration) {
		StandardServiceRegistryBuilder builder = new StandardServiceRegistryBuilder();
		builder.applySettings(configuration.getProperties());
		ServiceRegistry serviceRegistry = builder.build();
		return configuration.buildSessionFactory(serviceRegistry);
	}

}
