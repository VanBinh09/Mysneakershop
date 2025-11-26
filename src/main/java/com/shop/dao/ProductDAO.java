package com.shop.dao;

import com.shop.model.Product;

import java.math.BigDecimal;
import java.sql.*;
import java.util.*;

public class ProductDAO {

    private final Connection conn;

    public ProductDAO(Connection conn) {
        this.conn = conn;
    }

    private String safeSort(String s) {
        if (s == null) return "id";
        if (s.equals("price")) return "price";
        if (s.equals("name")) return "name";
        return "id";
    }

    private String safeOrder(String o) {
        return "asc".equalsIgnoreCase(o) ? "ASC" : "DESC";
    }

    public int countProducts(String q) {
        try {
            String sql = "SELECT COUNT(*) FROM products";
            boolean hasQ = q != null && !q.isBlank();

            if (hasQ) sql += " WHERE name LIKE ? OR description LIKE ?";

            PreparedStatement ps = conn.prepareStatement(sql);

            if (hasQ) {
                String like = "%" + q.trim() + "%";
                ps.setString(1, like);
                ps.setString(2, like);
            }

            ResultSet rs = ps.executeQuery();
            return rs.next() ? rs.getInt(1) : 0;

        } catch (Exception e) {
            return 0;
        }
    }

    public List<Product> getProductsPaged(int offset, int limit,
                                          String sort, String order, String q) {

        List<Product> list = new ArrayList<>();

        StringBuilder sb = new StringBuilder("SELECT * FROM products");

        boolean hasQ = q != null && !q.isBlank();
        if (hasQ) sb.append(" WHERE name LIKE ? OR description LIKE ?");

        sb.append(" ORDER BY ").append(safeSort(sort)).append(" ").append(safeOrder(order));
        sb.append(" LIMIT ? OFFSET ?");

        try {
            PreparedStatement ps = conn.prepareStatement(sb.toString());
            int i = 1;
            if (hasQ) {
                String like = "%" + q.trim() + "%";
                ps.setString(i++, like);
                ps.setString(i++, like);
            }
            ps.setInt(i++, limit);
            ps.setInt(i, offset);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setPrice(rs.getBigDecimal("price"));
                p.setImage(rs.getString("image"));
                p.setDescription(rs.getString("description"));
                list.add(p);
            }

        } catch (Exception ignored) {}

        return list;
    }

    public List<Product> getAllProducts() {
        List<Product> list = new ArrayList<>();
        try {
            ResultSet rs = conn.prepareStatement("SELECT * FROM products").executeQuery();
            while (rs.next()) {
                Product p = new Product(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getBigDecimal("price"),
                        rs.getString("image"),
                        rs.getString("description")
                );
                list.add(p);
            }
        } catch (Exception ignored) {}
        return list;
    }

    public Product getProductById(int id) {
        try {
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM products WHERE id=?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new Product(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getBigDecimal("price"),
                        rs.getString("image"),
                        rs.getString("description")
                );
            }
        } catch (Exception ignored) {}
        return null;
    }

    public boolean insertProduct(Product p) {
        try {
            PreparedStatement ps = conn.prepareStatement(
                    "INSERT INTO products(name, price, image, description) VALUES(?,?,?,?)"
            );
            ps.setString(1, p.getName());
            ps.setBigDecimal(2, p.getPrice());
            ps.setString(3, p.getImage());
            ps.setString(4, p.getDescription());
            return ps.executeUpdate() > 0;
        } catch (Exception ignored) {}
        return false;
    }

    public boolean updateProduct(Product p) {
        try {
            PreparedStatement ps = conn.prepareStatement(
                    "UPDATE products SET name=?, price=?, image=?, description=? WHERE id=?"
            );
            ps.setString(1, p.getName());
            ps.setBigDecimal(2, p.getPrice());
            ps.setString(3, p.getImage());
            ps.setString(4, p.getDescription());
            ps.setInt(5, p.getId());
            return ps.executeUpdate() > 0;
        } catch (Exception ignored) {}
        return false;
    }

    public boolean deleteProduct(int id) {
        try {
            PreparedStatement ps = conn.prepareStatement("DELETE FROM products WHERE id=?");
            ps.setInt(1, id);
            return ps.executeUpdate() > 0;
        } catch (Exception ignored) {}
        return false;
    }
}
