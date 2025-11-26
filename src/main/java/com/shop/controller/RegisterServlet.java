package com.shop.controller;

import com.shop.dao.UserDAO;
import com.shop.model.User;
import com.shop.util.DBUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "RegisterServlet", value = "/register")
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String u = req.getParameter("username");
        String p = req.getParameter("password");
        String e = req.getParameter("email");

        User user = new User();
        user.setUsername(u);
        user.setPassword(p);
        user.setEmail(e);
        user.setRole("USER");

        UserDAO dao = new UserDAO(DBUtil.getConnection());

        if (dao.register(user)) {
            resp.sendRedirect("login.jsp?success=1");
        } else {
            req.setAttribute("error", "Tên đăng nhập đã tồn tại!");
            req.getRequestDispatcher("register.jsp").forward(req, resp);
        }
    }
}
