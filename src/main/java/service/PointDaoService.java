package service;

import model.Point;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

public interface PointDaoService {

    List<Point> getByBizType(Integer bizTypeId);
    Point get(long id) throws HibernateException;
    void save(Point t) throws HibernateException;
    void remove(long id) throws HibernateException;
    void update(Point t) throws HibernateException;
    List<Point> getAll() throws HibernateException;

}
