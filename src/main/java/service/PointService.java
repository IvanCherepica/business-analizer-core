package service;

import model.Point;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import java.util.List;

public interface PointService {

    List<Point> getByBizType(Long bizTypeId);
    Point get(long id) throws HibernateException;
    void save(Point t) throws HibernateException;
    void saveList(List<Point> listT) throws HibernateException;
    void remove(long id) throws HibernateException;
    void update(long id, Point t) throws HibernateException;
    List<Point> getAll() throws HibernateException;

}
