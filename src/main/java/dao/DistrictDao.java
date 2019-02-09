package dao;

import model.District;
import org.hibernate.SessionFactory;

public class DistrictDao extends AbstractDao<District> {

    public DistrictDao(SessionFactory session) {
        super(session);
    }
}
