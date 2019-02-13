package servlet;

import model.BizType;
import model.Point;
import service.BizTypeServiceImpl;
import service.PointServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/admin/cafe/edit")
public class EditPointServlet extends HttpServlet {
	private PointServiceImpl pointService = new PointServiceImpl();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		long id = Long.parseLong(request.getParameter("id"));
		Point point = pointService.get(id);

		request.setAttribute("point", point);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/admin_points_edit.jsp");
		dispatcher.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		long id = Long.parseLong(request.getParameter("id"));
		String name = request.getParameter("name");
		String address = request.getParameter("addres");
		double longitude = Double.parseDouble(request.getParameter("longitude"));
		double latitude = Double.parseDouble(request.getParameter("latitude"));
		int typeId = Integer.parseInt(request.getParameter("typeId"));
		BizTypeServiceImpl btService = new BizTypeServiceImpl();
		BizType bizType = btService.get(typeId);
		Point point = new Point(name, address, longitude, latitude, bizType);
		point.setId(id);

		pointService.update(id, point);

		switch (typeId) {
			case 1:
				response.sendRedirect("/admin/cafe");
				break;
			case 2:
				response.sendRedirect("/admin/pharmacy");
				break;
			case 3:
				response.sendRedirect("/admin/beauty");
				break;
			case 4:
				response.sendRedirect("/admin/food");
				break;
			case 5:
				response.sendRedirect("/admin/clothes");
				break;
		}
	}
}
