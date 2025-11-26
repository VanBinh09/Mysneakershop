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
    private ProductDAO dao;

    @Override
    public void init() throws ServletException {
        dao = new ProductDAO(DBUtil.getConnection());
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String Param = req.getParameter("id");

        if (Param != null && !Param.isEmpty()) {
            try {
                int id = Integer.parseInt(Param);
                Product p = dao.getProductById(id);

//                if (product != null) {
//                    req.setAttribute("product", product);
//
//                    RequestDispatcher dispatcher = req.getRequestDispatcher("product-detail.jsp");
//                    dispatcher.forward(req, resp);
//                } else {
//
//                    resp.sendRedirect("products");
//                }
//            } catch (NumberFormatException e) {
//                e.printStackTrace();
//                resp.sendRedirect("products");
//            }
//        } else {
//            resp.sendRedirect("products");
//        }
//    }
                if (p == null) {
                    resp.sendRedirect("products");
                    return;
                }

                req.setAttribute("product", p);
                req.getRequestDispatcher("product-detail.jsp").forward(req, resp);

            } catch (Exception e) {
                resp.sendRedirect("products");
            }
        }
    }
}
