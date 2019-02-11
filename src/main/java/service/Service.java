package service;

import org.hibernate.HibernateException;

import java.util.List;

public interface Service<T> {
    T get(long id) throws HibernateException;
    void save(T t) throws HibernateException;
    void remove(long id) throws HibernateException;
    void update(long id, T t) throws HibernateException;
    List<T> getAll() throws HibernateException;
}