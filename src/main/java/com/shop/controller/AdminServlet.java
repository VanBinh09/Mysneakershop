package com.shop.controller;

import com.shop.dao.ProductDAO;
import com.shop.model.Product;
import com.shop.model.User;
import com.shop.util.DBUtil;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminServlet", value = "/admin")
public class AdminServlet extends HttpServlet {
    private ProductDAO dao;

    @Override
    public void init() throws ServletException {
        try {
            dao = new ProductDAO(DBUtil.getConnection());
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("user");


        if (user == null || !"admin".equalsIgnoreCase(user.getRole())) {
            resp.sendRedirect("login.jsp");
            return;
        }


        List<Product> products = dao.getAllProducts();
        req.setAttribute("products", products);


        req.getRequestDispatcher("/admin_products.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        doGet(req, resp);
    }
}
