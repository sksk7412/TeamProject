package controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Action;
import teamProject.MyLibraryDAO;
import teamProject.MyLibraryDTO;

public class LibraryAction implements Action {
@Override
public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	// TODO Auto-generated method stub
	HttpSession session = request.getSession();
	MyLibraryDTO book = null;
	MyLibraryDAO dao = MyLibraryDAO.getInstance();
	
	int log = (int) session.getAttribute("log");
	String isbn = request.getParameter("isbn");
	
	String userId = dao.getUserlog(log);
	
	book = new MyLibraryDTO(userId, isbn, 0);
	
	
	String url = "";
	if(dao.addBook(book)){
		System.out.println("읽기 성공");
		url = "dibs.jsp";
	}
	else{
		System.out.println("읽기 실패");
		url = "dibs.jsp";
	}
	request.getRequestDispatcher(url).forward(request, response);
}
}
