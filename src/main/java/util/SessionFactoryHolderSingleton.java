package util;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import static util.DBHelper.createSessionFactory;

public class SessionFactoryHolderSingleton {
    private static SessionFactory sessionFactory;
    private static SessionFactoryHolderSingleton instance;

    private SessionFactoryHolderSingleton(Configuration configuration) {
        this.sessionFactory = createSessionFactory(configuration);
    }

    public static SessionFactory getSessionInstance(Configuration configuration) {
        if (instance == null) {
            instance = new SessionFactoryHolderSingleton(configuration);
        }
        return sessionFactory;
    }
}
