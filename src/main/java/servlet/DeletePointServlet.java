package servlet;

import service.BizTypeServiceImpl;
import service.PointServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/admin/cafe/delete")
public class DeletePointServlet extends HttpServlet {

	private PointServiceImpl pointService = new PointServiceImpl();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		long id = Long.parseLong(request.getParameter("id"));


		int typeId = Integer.parseInt(request.getParameter("typeId"));

		pointService.remove(id);

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
