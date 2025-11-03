package com.shop.controller;

import com.shop.dao.ProductDAO;
import com.shop.model.Product;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

@WebServlet(name = "ProductServlet", value = "/products")
public class ProductServlet extends HttpServlet {
    private ProductDAO dao;

    @Override
    public void init() { dao = new ProductDAO(); }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String action = req.getParameter("action");
        if ("delete".equals(action)) {
            int id = Integer.parseInt(req.getParameter("id"));
            dao.delete(id);
            resp.sendRedirect(req.getContextPath() + "/admin_products.jsp");
            return;
        } else if ("edit".equals(action)) {
            int id = Integer.parseInt(req.getParameter("id"));
            Product p = dao.findById(id);
            req.setAttribute("editProduct", p);
            req.getRequestDispatcher("/product_form.jsp").forward(req, resp);
            return;
        }

        List<Product> products = dao.getAllProducts();
        req.setAttribute("products", products);
        req.getRequestDispatcher("products.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");

        String idStr = req.getParameter("id");
        String name = req.getParameter("name");
        String priceStr = req.getParameter("price");
        String image = req.getParameter("image");
        String description = req.getParameter("description");

        BigDecimal price = new BigDecimal(priceStr.isEmpty() ? "0" : priceStr);

        if (idStr == null || idStr.isEmpty()) {
            dao.create(new Product(0, name, price, image, description));
        } else {
            int id = Integer.parseInt(idStr);
            Product p = dao.findById(id);
            if (p != null) {
                p.setName(name);
                p.setPrice(price);
                p.setImage(image);
                p.setDescription(description);
                dao.update(p);
            }
        }
        resp.sendRedirect(req.getContextPath() + "/admin_products.jsp");
    }
}
