package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import domain.User;
import service.UserService;
import util.DateUtil;

@WebServlet("/register.do")
public class RegisterController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		UserService userService = new UserService();
		String user_name = request.getParameter("userName");
		String user_password = request.getParameter("userPassword");
		String user_phone = request.getParameter("userPhone");
		String user_email = request.getParameter("userEmail");
		String user_identity = request.getParameter("userIdentity");
		String msg = "";
		User user;
		try {
			user = userService.isExistsUser(user_name);

			if (user_name != "" && user_password != "" && user_phone != "" && user_identity != "" && user_email != ""
					&& user == null) {
				// 信息不为空
				try {
					userService.register(user_name, user_password, user_phone, user_identity, user_email);
					System.out.println("成功注册");
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					response.sendRedirect(request.getContextPath() + "/login.jsp");
				}
			} else {
				// 信息有空缺
				System.out.println("注册不规范");
				msg="注册不规范，请重新注册！";
				request.setAttribute("msg", msg);
				// 重定向
				request.getRequestDispatcher("/register.jsp").forward(request, response);
				// response.sendRedirect(request.getContextPath()+"/register.do");
			}

		} catch (SQLException e1) {
			e1.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
