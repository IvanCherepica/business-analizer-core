package servlet;

import com.squareup.okhttp.OkHttpClient;
import com.squareup.okhttp.Request;
import com.squareup.okhttp.Response;
import dto.MapPointDTO;
import model.BizType;
import model.Point;
import org.json.JSONArray;
import org.json.JSONObject;
import service.BizTypeServiceImpl;
import service.PointServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/admin/business/edit")
public class EditBizTypeSevlet extends HttpServlet {
    private BizTypeServiceImpl bizTypeService = new BizTypeServiceImpl();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        long id = Long.parseLong(request.getParameter("id"));
        BizType bizType = bizTypeService.get(id);

        request.setAttribute("bizType", bizType);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/admin_biztype_edit.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        request.setCharacterEncoding("utf-8");

        long id = Long.parseLong(request.getParameter("id"));
        String name = request.getParameter("name");
        String tags = request.getParameter("searchTags");

        bizTypeService.update(id, new BizType(name));

        response.sendRedirect("/admin/business");
    }
}