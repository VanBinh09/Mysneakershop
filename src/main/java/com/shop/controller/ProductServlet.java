package com.shop.controller;

import com.shop.dao.ProductDAO;
import com.shop.model.Product;
import com.shop.model.User;
import com.shop.util.DBUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.List;

@WebServlet(name = "ProductServlet", value = "/products")
public class ProductServlet extends HttpServlet {

    private boolean isAdmin(HttpServletRequest req) {
        HttpSession s = req.getSession(false);
        return s != null && s.getAttribute("user") instanceof User
                && "ADMIN".equalsIgnoreCase(((User) s.getAttribute("user")).getRole());
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        ProductDAO dao = new ProductDAO(DBUtil.getConnection());

        // --- ADMIN ---
        if ("edit".equals(req.getParameter("action"))) {
            if (!isAdmin(req)) { resp.sendRedirect("login.jsp"); return; }
            int id = Integer.parseInt(req.getParameter("id"));
            req.setAttribute("product", dao.getProductById(id));
            req.getRequestDispatcher("product_form.jsp").forward(req, resp);
            return;
        }

        if ("delete".equals(req.getParameter("action"))) {
            if (!isAdmin(req)) { resp.sendRedirect("login.jsp"); return; }
            dao.deleteProduct(Integer.parseInt(req.getParameter("id")));
            resp.sendRedirect("products?action=admin");
            return;
        }

        if ("admin".equals(req.getParameter("action"))) {
            if (!isAdmin(req)) { resp.sendRedirect("login.jsp"); return; }
            req.setAttribute("products", dao.getAllProducts());
            req.getRequestDispatcher("admin_products.jsp").forward(req, resp);
            return;
        }

        // --- LIST + PAGINATION + SORT + SEARCH ---
        String q = req.getParameter("q");
        String sort = req.getParameter("sort");
        String order = req.getParameter("order");

        int page = 1;
        int size = 9;

        try {
            page = Integer.parseInt(req.getParameter("page"));
        } catch (Exception ignored) {}

        int total = dao.countProducts(q);
        int totalPages = (int) Math.ceil(total / (double) size);
        if (totalPages < 1) totalPages = 1;

        if (page < 1) page = 1;
        if (page > totalPages) page = totalPages;

        int offset = (page - 1) * size;

        List<Product> list = dao.getProductsPaged(offset, size, sort, order, q);

        req.setAttribute("products", list);
        req.setAttribute("page", page);
        req.setAttribute("size", size);
        req.setAttribute("total", total);
        req.setAttribute("totalPages", totalPages);
        req.setAttribute("sort", sort == null ? "id" : sort);
        req.setAttribute("order", order == null ? "desc" : order);
        req.setAttribute("q", q);

        req.getRequestDispatcher("products.jsp").forward(req, resp);
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        if (!isAdmin(req)) {
            resp.sendRedirect("login.jsp");
            return;
        }

        ProductDAO dao = new ProductDAO(DBUtil.getConnection());

        String id = req.getParameter("id");
        String name = req.getParameter("name");
        BigDecimal price = new BigDecimal(req.getParameter("price"));
        String img = req.getParameter("image");
        String desc = req.getParameter("description");

        Product p = new Product();
        p.setName(name);
        p.setPrice(price);
        p.setImage(img);
        p.setDescription(desc);

        if (id == null || id.isEmpty()) {
            dao.insertProduct(p);
        } else {
            p.setId(Integer.parseInt(id));
            dao.updateProduct(p);
        }

        resp.sendRedirect("products?action=admin");
    }
}
