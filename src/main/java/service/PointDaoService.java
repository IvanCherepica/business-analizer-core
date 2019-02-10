package service;

import model.Point;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

public interface PointDaoService {

    public List<Point> getByBizType(Integer bizTypeId);

}
