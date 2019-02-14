package util;

import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import static util.DBHelper.createSessionFactory;

public class SessionFactoryHolderSingleton {
    private static SessionFactory sessionFactory;
    private static volatile  SessionFactoryHolderSingleton instance;

    private SessionFactoryHolderSingleton(Configuration configuration) {
        this.sessionFactory = createSessionFactory(configuration);
    }

    public static SessionFactory getSessionInstance(Configuration configuration) {
        SessionFactoryHolderSingleton localInstance = instance;
        if (localInstance == null) {
            synchronized (SessionFactoryHolderSingleton.class) {
                localInstance = instance;
                if (localInstance == null) {
                    instance = localInstance = new SessionFactoryHolderSingleton(configuration);
                }
            }
        }
        return sessionFactory;
    }
}
