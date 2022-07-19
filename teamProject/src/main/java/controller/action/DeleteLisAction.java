package controller.action;

import java.io.IOException;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Action;
import teamProject.MyLibraryDAO;
import teamProject.MyLibraryDTO;

public class DeleteLisAction implements Action {
@Override
public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	// TODO Auto-generated method stub
	HttpSession session = request.getSession();
	MyLibraryDTO book = null;
	MyLibraryDAO dao = MyLibraryDAO.getInstance();
	
	int id = (int) session.getAttribute("log");
	String isbn = request.getParameter("isbn");
	
	Timestamp modifiedAt = new Timestamp(System.currentTimeMillis());
	
	book = new MyLibraryDTO(id, isbn, modifiedAt);
	System.out.println(id);
	System.out.println("isbn: "+isbn);
	
	String url = "";
	if(dao.deleteBook(book)) {
		System.out.println("삭제 성공");
		url = "myLibrary.jsp";
	}
	else {
		System.out.println("삭제 실패");
		url = "myLibrary.jsp";
	}
	
	request.getRequestDispatcher(url).forward(request, response);
	
}
}
