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

public class DibsAction implements Action {
@Override
public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	// TODO Auto-generated method stub
	HttpSession session = request.getSession();
	DibsBookDTO user = null;
	DibsBookDAO temp = DibsBookDAO.getInstance();
	
	String isbn = request.getParameter("isbn");
	int id = (int) session.getAttribute("log");
	
	System.out.println("isbn: " + isbn);
	System.out.println("id:" + id);
	Timestamp createAt = new Timestamp(System.currentTimeMillis());
	
	// id isbn 날짜
	user = new DibsBookDTO(id,isbn,createAt);	
	
	String url = "";
		
	if(temp.addWrite(user)){
		
		System.out.println("찜 성공!!");
		url = "";
	}
	else{
		System.out.println("찜 실패!!");
		url = "index.jsp";
	}
	request.getRequestDispatcher(url).forward(request, response);
}
}