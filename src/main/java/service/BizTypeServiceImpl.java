package service;

import dao.BizTypeDao;
import model.BizType;
import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import util.DBHelper;
import util.SessionFactoryHolderSingleton;

import java.util.List;

public class BizTypeServiceImpl implements Service<BizType> {

    private Configuration configuration = DBHelper.getConfiguration();
    private SessionFactory  sessionFactory = SessionFactoryHolderSingleton.getSessionInstance(configuration);

    private BizTypeDao bizTypeDao = new BizTypeDao(sessionFactory);

    public BizTypeServiceImpl() {}

    @Override
    public BizType get(long id) throws HibernateException {
        return bizTypeDao.get(id);
    }

    @Override
    public void save(BizType bizType) throws HibernateException {
        bizTypeDao.save(bizType);
    }

    @Override
    public void remove(long id) throws HibernateException {
        bizTypeDao.remove(id);
    }

    @Override
    public void update(long id, BizType bizType) throws HibernateException {
        bizTypeDao.update(id,bizType);
    }

    @Override
    public List<BizType> getAll() throws HibernateException {
        return bizTypeDao.getAll();
    }
}
