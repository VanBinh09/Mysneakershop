package com.shop.dao;

import com.shop.model.User;
import com.shop.util.DBUtil;
import java.sql.*;

public class UserDAO {
    public User login(String username, String password) {
        String sql = "SELECT * FROM users WHERE username=? AND password=?";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, username);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return new User(
                        rs.getInt("id"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getString("role"),
                        rs.getString("email")
                );
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return null;
    }

    public boolean register(User user) {
        String sql = "INSERT INTO users(username, password, role, email) VALUES (?, ?, ?, ?)";
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, user.getUsername());
            stmt.setString(2, user.getPassword());
            stmt.setString(3, user.getRole());
            stmt.setString(4, user.getEmail());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) { e.printStackTrace(); }
        return false;
    }
}
