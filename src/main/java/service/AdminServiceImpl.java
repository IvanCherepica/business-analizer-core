package service;

import dao.AdminDao;
import model.Admin;
import org.hibernate.SessionFactory;

import java.sql.SQLException;
import java.util.List;

public class AdminServiceImpl implements AdminService {
    private final AdminDao adminDao;
    private SessionFactory sessionFactory; //TODO добавила, так как в конструкторе AdminDao есть sessionFactory

    private static volatile AdminServiceImpl instance;


    private AdminServiceImpl(SessionFactory sessionFactory) throws ClassNotFoundException, SQLException, InstantiationException, IllegalAccessException {
        this.adminDao = new AdminDao(sessionFactory);
    }

    public static AdminServiceImpl getInstance(SessionFactory sessionFactory) throws ClassNotFoundException, SQLException, InstantiationException, IllegalAccessException {
        if (instance == null) {
            synchronized (AdminServiceImpl.class) {
                if (instance == null) {
                    instance = new AdminServiceImpl(sessionFactory);
                }
            }
        }
        return instance;
    }

    @Override
    public Admin getAdminByLogin(String login) {
        return adminDao.getByLogin(login);
    }

    @Override
    public void addAdmin(Admin admin) {
        adminDao.update(admin);
    }

    @Override
    public void editAdmin(Admin admin) {
        Admin existAdmin = adminDao.getByLogin(admin.getLogin());
        if (existAdmin != null) {
            adminDao.update(admin);
        }
    }

    @Override
    public void remove(long id) {
        adminDao.remove(id);
    }

    @Override
    public List<Admin> getAllAdmins() {
        return adminDao.getAll();
    }

}
