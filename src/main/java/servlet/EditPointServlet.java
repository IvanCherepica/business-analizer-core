package servlet;

import model.Point;
import service.PointServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/admin/edit")
public class EditPointServlet extends HttpServlet {

	private PointServiceImpl pointService = new PointServiceImpl();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		RequestDispatcher dispatcher = request.getRequestDispatcher("/edit.jsp");
		dispatcher.forward(request, response);

		long id = Long.parseLong(request.getParameter("id"));

		String name = request.getParameter("name");
		String address = request.getParameter("address");

		double longitude = Double.parseDouble(request.getParameter("longitude"));
		double latitude = Double.parseDouble(request.getParameter("latitude"));

		int typeId = Integer.parseInt(request.getParameter("typeId"));

		pointService.update(id, new Point(name, address, longitude, latitude, typeId));

		response.sendRedirect("/admin");
	}
}
