package com.shop.controller;

import com.shop.dao.UserDAO;
import com.shop.model.User;
import com.shop.util.DBUtil;
import com.shop.util.DBUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;

@WebServlet(name = "RegisterServlet",value = "/register")
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String email = req.getParameter("email");

        Connection conn = DBUtil.getConnection();
        UserDAO dao = new UserDAO(conn);

        User u = new User();
        u.setUsername(username);
        u.setPassword(password);
        u.setEmail(email);

        if (dao.register(u)) {
            resp.sendRedirect("login.jsp?success=1");
        } else {
            req.setAttribute("error", "Tên đăng nhập đã tồn tại hoặc có lỗi!");
            req.getRequestDispatcher("register.jsp").forward(req, resp);
        }
    }
}
