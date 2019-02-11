package service;

import dao.PointDao;
import model.Point;
import org.hibernate.*;
import org.hibernate.cfg.Configuration;
import util.DBHelper;

import java.util.List;

import static util.DBHelper.createSessionFactory;

public class PointServiceImpl implements PointService {

    private Configuration configuration = DBHelper.getConfiguration();
    private SessionFactory sessionFactory = createSessionFactory(configuration);

    private PointDao pointDao = new PointDao(sessionFactory);

    public PointServiceImpl() {}

    public List<Point> getByBizType(Integer bizTypeId) {
        return pointDao.getByBizType(bizTypeId);
    }

    @Override
    public Point get(long id) throws HibernateException {
        return pointDao.get(id);
    }

    @Override
    public void save(Point t) throws HibernateException {
        pointDao.save(t);
    }

    public void saveList(List<Point> listT) throws HibernateException {  // TODO убрать запросы в цикле в AbstractDao
        pointDao.saveList(listT);
    }

    @Override
    public void remove(long id) throws HibernateException {
        pointDao.remove(id);
    }

    @Override
    public void update(long id, Point t) throws HibernateException {
        //pointDao.update(id, t);
    }

    @Override
    public List<Point> getAll() throws HibernateException {
        return pointDao.getAll();
    }

}
