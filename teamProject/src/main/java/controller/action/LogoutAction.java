
package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.cj.Session;

import controller.Action;

public class LogoutAction implements Action{
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	// TODO Auto-generated method stub
		request.getSession().invalidate();
		//	request.removeAttribute("log");
		String url ="login.jsp"; 
		request.getRequestDispatcher(url).forward(request, response);
		System.out.println("로그아웃완료");
	}
}