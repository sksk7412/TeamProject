package controller.action;

import java.io.IOException;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Action;
import teamProject.BoardDAO;
import teamProject.BoardDTO;

public class WriteReviewAction implements Action{
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			BoardDAO dao = BoardDAO.getInstance();
			
			HttpSession session = request.getSession();
			int log = (int)session.getAttribute("log");
			int isbn=0;
			String contents = request.getParameter("contents");
			Long date = System.currentTimeMillis();
			
			Timestamp createdAt=new Timestamp(date);
			
			BoardDTO board = new BoardDTO(log, isbn, contents, createdAt);
			String url="";
			
			if(dao.addReview(board)) {
				url="review.jsp";
				System.out.println(contents);
				System.out.println("글쓰기 완료");
			}else {
				url ="index.jsp";
				System.out.println("실패");
			}
			response.sendRedirect(url);
	}
}