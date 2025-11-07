package com.shop.controller;

import com.shop.dao.ProductDAO;
import com.shop.model.Product;
import com.shop.util.DBUtil;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;

@WebServlet(name = "ProductDetailServlet", value = "/product-detail")
public class ProductDetailServlet extends HttpServlet {
    private ProductDAO productDAO;

    @Override
    public void init() throws ServletException {
        // ✅ Kết nối CSDL một lần khi servlet khởi tạo
        Connection conn = DBUtil.getConnection();
        productDAO = new ProductDAO(conn);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String idParam = req.getParameter("id");

        if (idParam != null && !idParam.isEmpty()) {
            try {
                int id = Integer.parseInt(idParam);
                Product product = productDAO.getProductById(id);

                if (product != null) {
                    req.setAttribute("product", product);

                    RequestDispatcher dispatcher = req.getRequestDispatcher("product-detail.jsp");
                    dispatcher.forward(req, resp);
                } else {

                    resp.sendRedirect("products");
                }
            } catch (NumberFormatException e) {
                e.printStackTrace();
                resp.sendRedirect("products");
            }
        } else {
            resp.sendRedirect("products");
        }
    }
}
