package dao;

import model.Point;
import org.hibernate.*;

import java.util.List;

public class PointDao extends AbstractDao<Point> {

    public PointDao(SessionFactory sessionFactory) {

        super(sessionFactory);
    }

    public List<Point> getByBizType(Long bizTypeId) {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();

        Query query = session.createQuery("FROM Point p WHERE p.bizType.id = :bizTypeId");
        query.setParameter("bizTypeId", bizTypeId);

        List<Point> result = query.list();

        transaction.commit();
        session.close();

        return result;
    }
}
