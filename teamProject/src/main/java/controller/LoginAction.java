package controller;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import teamProject.UserDAO;
import teamProject.UserDTO;

/**
 * Servlet implementation class LoginAction
 */
//@WebServlet("/LoginAction")
public class LoginAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		HttpSession session = request.getSession();
		UserDAO dao = UserDAO.getInstance(); //

		String UserId = request.getParameter("UserId");
		String UserPw = request.getParameter("UserPw");
		
		UserDTO user = new UserDTO (UserId, UserPw);
		// id, password 입력된 부분에 대해서 검증 

		String url = "";
		if (!dao.loginCheck(user)) {
			url = "index.jsp";
			
//			dao.getId(UserId);
			
			session.setAttribute("log", dao.getId(UserId));
			
			System.out.println(dao.getId(UserId));
			System.out.println("성공");
		} else {
			url = "login.jsp";
			System.out.println("실패");
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

}
