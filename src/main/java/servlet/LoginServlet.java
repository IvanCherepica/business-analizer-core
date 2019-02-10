//package servlet;
//
//import model.*;
//import org.hibernate.SessionFactory;
//import service.AdminService;
//import service.AdminServiceImpl;
//import util.DBHelper;
//
//import javax.servlet.RequestDispatcher;
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//import java.io.IOException;
//import java.sql.SQLException;
//
//@WebServlet("/login")
//public class LoginServlet extends HttpServlet {
//    private SessionFactory sessionFactory = DBHelper.createSessionFactory(DBHelper.getConfiguration());
//    private AdminService service = AdminServiceImpl.getInstance(sessionFactory);
//
//    public LoginServlet() throws ClassNotFoundException, SQLException, InstantiationException, IllegalAccessException {
//    }
//
//    protected void doGet(HttpServletRequest request,
//                         HttpServletResponse response) throws ServletException, IOException {
//        response.setContentType("text/html");
//        RequestDispatcher dispatcher = request.getRequestDispatcher("/login.jsp");
//        dispatcher.forward(request, response);
//    }
//
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String login = request.getParameter("login");
//        String password = request.getParameter("password");
//
//        if (login.isEmpty() || password.isEmpty()) {
//            response.sendRedirect("login");
//            return;
//        }
//
//        Admin admin = service.getAdminByLogin(login);
//
//        if (admin == null) {
//            response.sendRedirect("/user");
//            return;
//        }
//
//        if (admin.getPassword().equals(password)) {
//            HttpSession session = request.getSession();
//            session.setAttribute("admin", admin);
//            response.setContentType("text/html");
//            response.sendRedirect("/admin");
//            return;
//        } else {
//            response.sendRedirect("/user");
//        }
//    }
//}
