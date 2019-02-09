package dao;

import model.BizType;
import org.hibernate.SessionFactory;

public class BizTypeDao extends AbstractDao<BizType> {

    public BizTypeDao(SessionFactory sessionFactory) {
        super(sessionFactory);
    }
}
