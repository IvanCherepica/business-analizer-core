package service;

import model.Admin;
import java.util.List;

public interface AdminService {
    Admin getAdminByLogin(String login);
    void addAdmin(Admin admin);
    void editAdmin(Admin admin);
    void remove(long id);
    List<Admin> getAllAdmins();
}
