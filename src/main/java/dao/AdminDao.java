package dao;

import model.Admin;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

public class AdminDao extends AbstractDao<Admin> {
    public AdminDao(SessionFactory session) {
        super(session);
    }

    public Admin getByLogin(String login) {
        Session session = sessionFactory.openSession();
        Transaction transaction = session.beginTransaction();

        Query query = session.createQuery("FROM Admin a WHERE a.login = :login");
        query.setParameter("login",login);

        Admin result = (Admin) query.uniqueResult();

        transaction.commit();
        session.close();

        return result;
    }
}
