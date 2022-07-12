package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import teamProject.UserDAO;
import teamProject.UserDTO;


/**
 * Servlet implementation class JoinAction
 */
//@WebServlet("/JoinAction")
public class JoinAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JoinAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		UserDTO user = null;
		UserDAO temp = UserDAO.getInstance();
	
		String UserId = request.getParameter("UserId");
		String UserPw = request.getParameter("UserPw");
		String name = request.getParameter("name");
		String mobile = request.getParameter("mobile");
		
		user = new UserDTO(UserId,UserPw,name,mobile);	
		
		String url = "";
 		
 		
		if(!temp.addUser(user)){
			
			System.out.println("회원가입 실패!");
			url = "join.jsp";
		}
		else{
			System.out.println("회원가입 성공!");
			url = "login.jsp";
		}
		request.getRequestDispatcher(url).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

}
