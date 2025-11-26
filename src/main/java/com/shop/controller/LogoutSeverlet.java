package com.shop.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "LogoutSeverlet",value = "/logout")
public class LogoutSeverlet extends HttpServlet{

        @Override
        protected void doGet(HttpServletRequest req, HttpServletResponse resp)
                throws ServletException, IOException {
            HttpSession session = req.getSession(false);
            if (session != null) {
                session.invalidate(); // ✅ xóa toàn bộ session
            }
            resp.sendRedirect(req.getContextPath() + "/products");
        }
}
