package com.shop.controller;

import com.shop.dao.UserDAO;
import com.shop.model.User;
import com.shop.util.DBUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;

@WebServlet(name = "ProfileServlet", value = "/profile")
public class ProfileServlet extends HttpServlet {

    private UserDAO userDAO;

    @Override
    public void init() throws ServletException {
        Connection conn = DBUtil.getConnection();
        userDAO = new UserDAO(conn);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;

        if (user == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        req.setAttribute("user", user);
        req.getRequestDispatcher("profile.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        HttpSession session = req.getSession(false);
        User user = (session != null) ? (User) session.getAttribute("user") : null;
        if (user == null) {
            resp.sendRedirect("login.jsp");
            return;
        }

        String fullName = req.getParameter("fullName");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String address = req.getParameter("address");
        String birth = req.getParameter("birthDate"); // yyyy-MM-dd
        String avatar = req.getParameter("avatar");

        user.setFullName(fullName);
        user.setEmail(email);
        user.setPhone(phone);
        user.setAddress(address);
        user.setAvatar(avatar);

        if (birth != null && !birth.isEmpty()) {
            user.setBirthDate(Date.valueOf(birth));
        } else {
            user.setBirthDate(null);
        }
        if (avatar != null && !avatar.trim().isEmpty()) {
            user.setAvatar(avatar.trim());
        } else {
            user.setAvatar(null);
        }

        System.out.println("UPDATE PROFILE userId=" + user.getId() +
                ", avatar=" + user.getAvatar());

        if (userDAO.updateProfile(user)) {
            // cập nhật lại user trong session
            session.setAttribute("user", user);
            req.setAttribute("success", "Cập nhật thành công!");
        } else {
            req.setAttribute("error", "Có lỗi xảy ra khi cập nhật!");
        }

        req.setAttribute("user", user);
        req.getRequestDispatcher("profile.jsp").forward(req, resp);
    }
}
