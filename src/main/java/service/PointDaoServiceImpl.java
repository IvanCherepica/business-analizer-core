package service;

import dao.AbstractDao;
import dao.PointDao;
import model.Point;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import util.DBHelper;

import java.util.List;

import static util.DBHelper.createSessionFactory;

public class PointDaoServiceImpl extends AbstractDao<Point> implements PointDaoService {

    private Configuration configuration = DBHelper.getConfiguration();
    private SessionFactory sessionFactory = createSessionFactory(configuration);

    private PointDao pointDao = new PointDao(sessionFactory);

    public PointDaoServiceImpl(SessionFactory sessionFactory) {
        super(sessionFactory);
    }

    public List<Point> getByBizType(Integer bizTypeId) {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();

        Query query = session.createQuery("FROM Point p WHERE p.typeId = :bizTypeId");
        query.setParameter("bizTypeId", bizTypeId);

        List<Point> result = query.list();

        transaction.commit();
        session.close();

        return result;
    }

}
