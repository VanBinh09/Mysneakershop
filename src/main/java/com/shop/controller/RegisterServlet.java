package com.shop.controller;

import com.shop.dao.UserDAO;
import com.shop.model.User;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "RegisterServlet", value = "/register")
public class RegisterServlet extends HttpServlet {
    private UserDAO dao;

    @Override
    public void init() {
        dao = new UserDAO();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        String username = req.getParameter("username");
        String password = req.getParameter("password");
        String email = req.getParameter("email");

        User user = new User(0, username, password, "user", email);

        if (dao.register(user)) {
            resp.sendRedirect("login.jsp");
        } else {
            req.setAttribute("error", "Đăng ký thất bại! Vui lòng thử lại.");
            req.getRequestDispatcher("register.jsp").forward(req, resp);
        }
    }
}
