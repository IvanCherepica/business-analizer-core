package dao;

import entity.Point;
import org.hibernate.SessionFactory;

import java.util.List;

public class PointDao extends AbstractDao<Point> {

    public PointDao(SessionFactory sessionFactory) {
        super(sessionFactory);
    }

//    public List<Point> getByBizType(long bizTypeId) {
//
//    }

    //List<Point> getByBizType(long bizTypeId);
}
