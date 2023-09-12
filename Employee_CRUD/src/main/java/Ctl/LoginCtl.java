package Ctl;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entity.Employee;
import service.employeeService;

/**
 * Servlet implementation class LoginCtl
 */
@WebServlet("/LoginCtl")
public class LoginCtl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	
	employeeService es=new employeeService();
	RequestDispatcher rd;
	
    public LoginCtl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String operation = request.getParameter("operation");
		
		String UserName = request.getParameter("username");
		String Password = request.getParameter("password");
		
		if(operation.equals("login")) {
			
			Employee emp = es.login(UserName, Password);
			
			if(emp!=null) {
				HttpSession session = request.getSession();
				session.setAttribute("emp", emp);
				rd = request.getRequestDispatcher("home.jsp");
				rd.include(request, response);
			}
			else
			{
				request.setAttribute("msg", "Invalid Credentials");
				rd=request.getRequestDispatcher("login.jsp");
				rd.include(request, response);
			}
		}
		
	}

}
