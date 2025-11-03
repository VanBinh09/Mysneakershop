package com.shop.dao;

import com.shop.model.Product;
import com.shop.util.DBUtil;
import java.sql.*;
import java.util.*;
import java.math.BigDecimal;

public class ProductDAO {
    public List<Product> getAllProducts() {
        List<Product> list = new ArrayList<>();
        String sql = "SELECT * FROM products";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("tensp"));
                p.setDescription(rs.getString("mota"));
                p.setPrice(rs.getBigDecimal("dongia"));
                p.setImage(rs.getString("anhsp"));
                list.add(p);
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return list;
    }

    public Product findById(int id) {
        String sql = "SELECT * FROM products WHERE id=?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return new Product(
                        rs.getInt("id"),
                        rs.getString("tensp"),
                        rs.getBigDecimal("dongia"),
                        rs.getString("anhsp"),
                        rs.getString("mota")
                );
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return null;
    }

    public boolean create(Product p) {
        String sql = "INSERT INTO products(tensp, dongia, anhsp, mota) VALUES (?, ?, ?, ?)";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, p.getName());
            stmt.setBigDecimal(2, p.getPrice());
            stmt.setString(3, p.getImage());
            stmt.setString(4, p.getDescription());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) { e.printStackTrace(); }
        return false;
    }

    public boolean update(Product p) {
        String sql = "UPDATE products SET tensp=?, dongia=?, anhsp=?, mota=? WHERE id=?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, p.getName());
            stmt.setBigDecimal(2, p.getPrice());
            stmt.setString(3, p.getImage());
            stmt.setString(4, p.getDescription());
            stmt.setInt(5, p.getId());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) { e.printStackTrace(); }
        return false;
    }

    public boolean delete(int id) {
        String sql = "DELETE FROM products WHERE id=?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) { e.printStackTrace(); }
        return false;
    }
}
