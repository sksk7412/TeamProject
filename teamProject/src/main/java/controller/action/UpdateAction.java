package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Action;
import teamProject.UserDAO;
import teamProject.UserDTO;

public class UpdateAction implements Action {
@Override
public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	// TODO Auto-generated method stub
	UserDTO user = null;
	UserDAO temp = UserDAO.getInstance();
	
	HttpSession session = request.getSession();
	int log = (int)session.getAttribute("log");
	String UserPw = request.getParameter("UserPw");
	String name = request.getParameter("name");
	String mobile = request.getParameter("mobile");
	
	user = new UserDTO(UserPw,name,mobile);	
	
	String url = "";
	
	System.out.println(UserPw);
		
	if(!temp.updateUser(user, log)){
		
		System.out.println("수정 실패");
		url = "userInfo.jsp";
	}
	else{
		System.out.println("회원정보 수정");
		url = "myPage.jsp";
	}
	request.getRequestDispatcher(url).forward(request, response);
}
}
