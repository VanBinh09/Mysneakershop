package com.shop.controller;

import com.shop.dao.ProductDAO;
import com.shop.model.Product;
import com.shop.model.User;
import com.shop.util.DBUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Connection;
import java.util.List;

@WebServlet(name ="ProductServlet" ,value = "/products")
public class ProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Connection conn = DBUtil.getConnection();
        ProductDAO dao = new ProductDAO(conn);

        String action = req.getParameter("action");
        if (action == null) action = "list";

        switch (action) {
            case "edit":
                int idEdit = Integer.parseInt(req.getParameter("id"));
                req.setAttribute("product", dao.getProductById(idEdit));
                req.getRequestDispatcher("product_form.jsp").forward(req, resp);
                break;

            case "delete":
                int idDel = Integer.parseInt(req.getParameter("id"));
                dao.deleteProduct(idDel);
                resp.sendRedirect("products?action=admin");
                break;

            case "admin":
                List<Product> listAdmin = dao.getAllProducts();
                req.setAttribute("products", listAdmin);
                req.getRequestDispatcher("admin_products.jsp").forward(req, resp);
                break;

            default:
                List<Product> list = dao.getAllProducts();
                req.setAttribute("products", list);
                req.getRequestDispatcher("products.jsp").forward(req, resp);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Connection conn = DBUtil.getConnection();
        ProductDAO dao = new ProductDAO(conn);

        String id = req.getParameter("id");
        String name = req.getParameter("name");
        double price = Double.parseDouble(req.getParameter("price"));
        String image = req.getParameter("image");
        String description = req.getParameter("description");

        Product p = new Product();
        p.setName(name);
        p.setPrice(BigDecimal.valueOf(price));
        p.setImage(image);
        p.setDescription(description);

        if (id == null || id.isEmpty()) {
            dao.insertProduct(p);
        } else {
            p.setId(Integer.parseInt(id));
            dao.updateProduct(p);
        }

        resp.sendRedirect("products?action=admin");
    }
}
