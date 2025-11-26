package com.shop.dao;

import com.shop.model.User;

import java.sql.*;

public class UserDAO {

    private final Connection conn;

    public UserDAO(Connection c) {
        this.conn = c;
    }

    public User login(String u, String p) {
        String sql = "SELECT * FROM users WHERE username=? AND password=?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, u);
            ps.setString(2, p);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    User user = new User();
                    user.setId(rs.getInt("id"));
                    user.setUsername(rs.getString("username"));
                    user.setPassword(rs.getString("password"));
                    user.setRole(rs.getString("role"));
                    user.setEmail(rs.getString("email"));

                    user.setFullName(rs.getString("full_name"));
                    user.setPhone(rs.getString("phone"));
                    user.setAddress(rs.getString("address"));
                    user.setBirthDate(rs.getDate("birth_date"));
                    user.setAvatar(rs.getString("avatar"));

                    return user;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public boolean updateProfile(User u) {
        String sql = "UPDATE users SET full_name=?, phone=?, address=?, birth_date=?, email=?, avatar=? WHERE id=?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, u.getFullName());
            ps.setString(2, u.getPhone());
            ps.setString(3, u.getAddress());
            ps.setDate(4, u.getBirthDate());
            ps.setString(5, u.getEmail());
            ps.setString(6, u.getAvatar());
            ps.setInt(7, u.getId());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean register(User u) {
        try {
            PreparedStatement ps = conn.prepareStatement(
                    "INSERT INTO users(username,password,role,email) VALUES(?,?,?,?)"
            );
            ps.setString(1, u.getUsername());
            ps.setString(2, u.getPassword());
            ps.setString(3, u.getRole());
            ps.setString(4, u.getEmail());
            return ps.executeUpdate() > 0;

        } catch (Exception ignored) {}
        return false;
    }
}
