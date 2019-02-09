package dao;


import entity.District;
import org.hibernate.SessionFactory;


public class DistrictDao extends AbstractDao<District> {


    public DistrictDao(SessionFactory session) {
        super(session);
    }


}
