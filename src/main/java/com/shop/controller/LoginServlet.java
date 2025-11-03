package com.shop.controller;

import com.shop.dao.UserDAO;
import com.shop.model.User;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "LoginServlet", value = "/login")
public class LoginServlet extends HttpServlet {
    private UserDAO dao;

    @Override
    public void init() {
        dao = new UserDAO();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String username = req.getParameter("username");
        String password = req.getParameter("password");
        User user = dao.login(username, password);

        if (user != null) {
            req.getSession().setAttribute("user", user);
            resp.sendRedirect("index.jsp");
        } else {
            req.setAttribute("error", "Sai tài khoản hoặc mật khẩu!");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }
    }
}
