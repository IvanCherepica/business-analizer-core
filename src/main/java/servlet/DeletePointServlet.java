package servlet;

import service.PointServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/admin/points/delete")
public class DeletePointServlet extends HttpServlet {

	private PointServiceImpl pointService = new PointServiceImpl();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		long id = Long.parseLong(request.getParameter("id"));
		pointService.remove(id);

		response.sendRedirect("/admin/points");
	}
}
