package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import domain.User;
import service.MatchService;

/**
 * Servlet implementation class MailBoxController
 */
@WebServlet("/mailbox.do")
public class MailBoxController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MatchService matchService = new MatchService();
		List<String> messageList = new ArrayList<String>();
		List<Date> messageDateList = new ArrayList<Date>();
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("user");
		int uid = user.getUserId();
		messageList = matchService.findMailById(uid);
		messageDateList = matchService.findMailDateById(uid);
		request.setAttribute("messageList", messageList);
		request.setAttribute("messageDateList", messageDateList);
		request.getRequestDispatcher("/mailbox.jsp").forward(request, response);
		//System.out.println(messageList);
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
