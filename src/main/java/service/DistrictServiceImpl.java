package service;

import dao.DistrictDao;
import model.District;
import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import util.DBHelper;

import java.util.List;

import static util.DBHelper.createSessionFactory;

public class DistrictServiceImpl implements Service<District> {
    private Configuration configuration = DBHelper.getConfiguration();
    private SessionFactory sessionFactory = createSessionFactory(configuration);

    private DistrictDao districtDao = new DistrictDao(sessionFactory);

    @Override
    public District get(long id) throws HibernateException {
        return districtDao.get(id);
    }

    @Override
    public void save(District district) throws HibernateException {
        districtDao.save(district);
    }

    @Override
    public void remove(long id) throws HibernateException {
        districtDao.remove(id);
    }

    @Override
    public void update(long id, District district) throws HibernateException {
        districtDao.update(id,district);
    }

    @Override
    public List<District> getAll() throws HibernateException {
        return districtDao.getAll();
    }
}
