package examples;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ToDoDao;
import dto.ToDoDto;

/**
 * Servlet implementation class AddTodoServlet
 */
@WebServlet("/AddTodo")
public class AddTodoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddTodoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userName = request.getParameter("name");
		String title = request.getParameter("title");
		int sequence = Integer.parseInt(request.getParameter("sequence"));
		
		ToDoDao dao = new ToDoDao();
		ToDoDto dto = new ToDoDto(userName, sequence, title);
		
		int result = dao.addTodo(dto);
		System.out.println("성공여부: " + result);
		
		response.sendRedirect("/CloneMomentom/main");
	}

}
