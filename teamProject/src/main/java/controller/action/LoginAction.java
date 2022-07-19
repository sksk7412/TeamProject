package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Action;
import teamProject.UserDAO;
import teamProject.UserDTO;

public class LoginAction implements Action {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		UserDAO dao = UserDAO.getInstance(); //
	
		String UserId = request.getParameter("UserId");
		String UserPw = request.getParameter("UserPw");
		
		UserDTO user = new UserDTO (UserId, UserPw);
	
		// id, password 입력된 부분에 대해서 검증 
	
		String url = "";
		if (!dao.loginCheck(user)) {
			url = "index.jsp";
			
	//		dao.getId(UserId);
			
			session.setAttribute("log", dao.getId(UserId));
			
			System.out.println(dao.getId(UserId));
			System.out.println("성공");
		} else {
			url = "login.jsp";
			System.out.println("실패");
		}
		request.getRequestDispatcher(url).forward(request, response);
	}
}