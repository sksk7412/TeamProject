package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Action;
import teamProject.UserDAO;
import teamProject.UserDTO;

public class JoinAction implements Action {
@Override
public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	// TODO Auto-generated method stub
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
		url = "join.jsp?check=check";
	}
	else{
		System.out.println("회원가입 성공!");
		url = "login.jsp";
	}
	request.getRequestDispatcher(url).forward(request, response);
}
}