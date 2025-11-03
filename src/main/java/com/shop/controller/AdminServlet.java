package com.shop.controller;

import com.shop.dao.ProductDAO;
import com.shop.model.Product;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "AdminServlet", value = "/admin")
public class AdminServlet extends HttpServlet {
    private ProductDAO dao;

    @Override
    public void init() {
        dao = new ProductDAO();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        List<Product> products = dao.getAllProducts();
        req.setAttribute("products", products);
        req.getRequestDispatcher("/admin_products.jsp").forward(req, resp);
    }
}
