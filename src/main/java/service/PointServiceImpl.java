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

//    public List<Point> getByBizType(Integer bizTypeId) {
//        Session session = sessionFactory.openSession();
//        Transaction transaction = session.beginTransaction();
//
//        Query query = session.createQuery("FROM Point p WHERE p.typeId = :bizTypeId");
//        query.setParameter("bizTypeId", bizTypeId);
//
//        List<Point> result = query.list();
//
//        transaction.commit();
//        session.close();
//
//        return result;
//    }

    @Override
    public Point get(long id) throws HibernateException {
        return pointDao.get(id);
    }

    @Override
    public void save(Point t) throws HibernateException {
        pointDao.save(t);
    }

    public void saveList(List<Point> listT) throws HibernateException {  // TODO убрать запросы в цикле
        pointDao.saveList(listT);
    }

    @Override
    public void remove(long id) throws HibernateException {
        pointDao.remove(id);
    }

    @Override
    public void update(Point t) throws HibernateException {
        pointDao.update(t);
    }

    @Override
    public List<Point> getAll() throws HibernateException {
        return pointDao.getAll();
    }

}
