package controller.action;

import java.io.IOException;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Action;
import teamProject.DibsBookDAO;
import teamProject.DibsBookDTO;

public class DeleteDibsAction implements Action {
@Override
public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	// TODO Auto-generated method stub
	HttpSession session = request.getSession();
	DibsBookDTO user = null;
	DibsBookDAO dao = DibsBookDAO.getInstance();
	
	int id = (int) session.getAttribute("log");
	String isbn = request.getParameter("isbn");
	
	Timestamp createAt = new Timestamp(System.currentTimeMillis());
	
	user = new DibsBookDTO(id, isbn, createAt);
	System.out.println(id);
	System.out.println("isbn: "+isbn);
	
	String url = "";
	
	if(dao.deleteBook(user)) {
		System.out.println("삭제 성공");
		url = "dibs.jsp";
	}
	else {
		System.out.println("삭제 실패");
		url = "dibs.jsp";
	}
	
	request.getRequestDispatcher(url).forward(request, response);
	
}
}
