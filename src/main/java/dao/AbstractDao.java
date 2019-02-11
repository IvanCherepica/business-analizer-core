package dao;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import java.lang.reflect.ParameterizedType;
import java.util.List;

public abstract class AbstractDao<T> {

    protected final SessionFactory sessionFactory;
    private final Class<T> persistentClass;
    private final String getAllQuery;

    public AbstractDao(SessionFactory sessionFactory) {
        this.persistentClass = (Class<T>) ((ParameterizedType) this.getClass().getGenericSuperclass()).getActualTypeArguments()[0];
        this.sessionFactory = sessionFactory;

        String genericClassName = persistentClass.toGenericString();
        String className = genericClassName.substring(genericClassName.lastIndexOf('.') + 1);
        this.getAllQuery = "FROM " + className;
    }

    @SuppressWarnings("unchecked")
    public T get(long id) throws HibernateException {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();

        T result = (T) session.get(persistentClass, id);

        transaction.commit();
        session.close();
        return result;
    }

    public void save(T t) throws HibernateException {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();

        session.persist(t);

        transaction.commit();
        session.close();
    }

    public void saveList(List<T> listT) throws HibernateException {  // TODO убрать запросы в цикле
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();

        for (T obj : listT) {
            session.persist(obj);
        }

        transaction.commit();
        session.close();

    }

    @SuppressWarnings("unchecked")
    public void remove(long id) throws HibernateException {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();

        T entity = (T) session.get(persistentClass, id);
        session.delete(entity);

        transaction.commit();
        session.close();
    }

    public void update(long id, T t) throws HibernateException { //TODO native query
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();

        T entity = (T) session.get(persistentClass, id);
        session.delete(entity);

        session.persist(t);

        transaction.commit();
        session.close();

    }

    public List<T> getAll() throws HibernateException {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();

        List<T> result = session.createQuery(getAllQuery).list();

        transaction.commit();
        session.close();

        return result;
    }
}
