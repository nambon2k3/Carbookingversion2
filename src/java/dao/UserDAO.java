/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dal.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import model.User;

/**
 *
 * @author Admin
 */
public class UserDAO extends DBContext {

    public User getUserByUsername(String username) {
        String sql = "SELECT * FROM USERS WHERE username = ? or email = ?";
        User user = new User();
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, username);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                user.setUsername(rs.getString("username"));
                user.setPassword(rs.getString("password"));
                user.setFullName(rs.getString("full_name"));
                user.setGender(rs.getInt("gender"));
                user.setDob(rs.getString("dob"));
                user.setImg(rs.getString("img"));
                user.setEmail(rs.getString("email"));
                user.setRole(rs.getInt("role"));
                user.setStatus(rs.getInt("status"));
            }
        } catch (Exception e) {
            System.out.println("getUserByUsername: " + e.getMessage());
        }
        return user;
    }

    public boolean checkExistedUserWithUsernameAndPassword(String username, String password) {
        String sql = "SELECT * FROM USERS WHERE (username = ? or email = ?) AND password = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, username);
            ps.setString(3, password);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (Exception e) {
            System.out.println("checkExistedUserWithUsernameAndPassword: " + e.getMessage());
        }
        return false;
    }

    public boolean checkExistedUserWithUsername(String username) {
        String sql = "SELECT * FROM USERS WHERE username = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (Exception e) {
            System.out.println("checkExistedUserWithUsername: " + e.getMessage());
        }
        return false;
    }

    public boolean checkExistedEmail(String email) {
        String sql = "select email from Users where email = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        } catch (Exception e) {
            System.out.println("checkExistedEmail: " + e.getMessage());
        }
        return false;
    }

    public void signUp(String fullName, String gender, String username, String password, String email, String dob) {
        try {
            String sql = "INSERT INTO USERS (username, dob, email,full_name,gender,password,role)"
                    + "VALUES (?, ?, ?, ?, ?, ?,?);";
            PreparedStatement pstm = connection.prepareStatement(sql);
            pstm.setString(1, username);
            pstm.setString(2, dob);
            pstm.setString(3, email);
            pstm.setString(4, fullName);
            String genderINT = "";
            if (gender.equals("Male")) {
                genderINT = 1 + "";
            } else {
                genderINT = 0 + "";
            }
            pstm.setString(5, genderINT);
            pstm.setString(6, password);
            pstm.setString(7, "1");
            pstm.executeUpdate();
            //Close pstm
            pstm.close();
        } catch (SQLException e) {
            System.out.println("Sign up failed: " + e.getMessage());
        }
    }

    public List<User> getAllUsers() {
        List<User> users = new ArrayList<>();
        String query = "SELECT * FROM Users";
        try ( PreparedStatement preparedStatement = connection.prepareStatement(query);  ResultSet resultSet = preparedStatement.executeQuery()) {
            while (resultSet.next()) {
                String username = resultSet.getString("username");
                String password = resultSet.getString("password");
                String fullName = resultSet.getString("full_name");
                String email = resultSet.getString("email");
                String img = resultSet.getString("img");
                String dob = resultSet.getString("dob");
                int gender = resultSet.getInt("gender");
                int role = resultSet.getInt("role");
                int status = resultSet.getInt("status");

                User user = new User(username, password, fullName, email, img, dob, gender, role, status);
                users.add(user);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return users;
    }

    public void updateUser(User user) {
        String query = "UPDATE Users SET password = ?, full_name = ?, email = ?, img = ?, dob = ?, gender = ?, role = ?, status = ? WHERE username = ?";
        try ( PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, user.getPassword());
            preparedStatement.setString(2, user.getFullName());
            preparedStatement.setString(3, user.getEmail());
            preparedStatement.setString(4, user.getImg());
            preparedStatement.setString(5, user.getDob());
            preparedStatement.setInt(6, user.getGender());
            preparedStatement.setInt(7, user.getRole());
            preparedStatement.setInt(8, user.getStatus());
            preparedStatement.setString(9, user.getUsername());
            preparedStatement.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public void updateUserStatus(String username, int status) {
        String query = "UPDATE Users SET status = ? WHERE username = ?";
        try ( PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setInt(1, status);
            preparedStatement.setString(2, username);
            preparedStatement.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public void updateUserProfile(User user) {
        String query = "UPDATE Users SET full_name = ?, email = ?, dob = ?, gender = ? WHERE username = ?";
        try ( PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, user.getFullName());
            preparedStatement.setString(2, user.getEmail());
            preparedStatement.setString(3, user.getDob());
            preparedStatement.setInt(4, user.getGender());
            preparedStatement.setString(5, user.getUsername());
            preparedStatement.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    public void updatePassword(String username, String newPassword) {
        String sql = "UPDATE Users SET password = ? WHERE username = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, newPassword);
            ps.setString(2, username);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("updatePassword: " + e.getMessage());
        }
    }

    public void deleteUser(String username) {
        String query = "DELETE FROM Users WHERE username = ?";
        try ( PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, username);
            preparedStatement.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

}
