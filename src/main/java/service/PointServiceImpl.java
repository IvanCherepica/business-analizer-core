package service;

import dao.PointDao;
import model.Point;
import org.hibernate.*;
import org.hibernate.cfg.Configuration;
import util.DBHelper;
import util.SessionFactoryHolderSingleton;

import java.util.List;

public class PointServiceImpl implements PointService {

    private Configuration configuration = DBHelper.getConfiguration();
    private SessionFactory  sessionFactory = SessionFactoryHolderSingleton.getSessionInstance(configuration);

    private PointDao pointDao = new PointDao(sessionFactory);

    public PointServiceImpl() {}

    public List<Point> getByBizType(Long bizTypeId) {
        //return null;
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
        pointDao.update(id, t);
    }

    @Override
    public List<Point> getAll() throws HibernateException {
        return pointDao.getAll();
    }

    public void removeList(List<Point> pointList) throws HibernateException{
        for(Point point:pointList){
            pointDao.remove(point.getId());
        }
    }


}
