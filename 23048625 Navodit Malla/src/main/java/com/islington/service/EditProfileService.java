package com.islington.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.islington.config.DbConfig;
import com.islington.model.UserModel;
import com.islington.util.PasswordUtil;

public class EditProfileService {
    private Connection dbConn;

    public EditProfileService() {
        try {
            this.dbConn = DbConfig.getDbConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            System.err.println("Database connection error: " + ex.getMessage());
            ex.printStackTrace();
        }
    }

    public Boolean updateUserProfile(UserModel programModel) {
        if (dbConn == null) {
            System.err.println("Database connection is not available");
            return null;
        }

        String updateQuery = "UPDATE `user` SET `Email` = ?, `Phone_Number` = ?, `Password` = ? WHERE `Username` = ?";

        try (PreparedStatement updateStmt = dbConn.prepareStatement(updateQuery)) {
            updateStmt.setString(1, programModel.getEmail());
            updateStmt.setString(2, programModel.getPhone_Number());

            // Encrypt the new password
            String encryptedPassword = PasswordUtil.encrypt(programModel.getUsername(), programModel.getPassword());
            updateStmt.setString(3, encryptedPassword);

            updateStmt.setString(4, programModel.getUsername()); // Where clause to identify which user

            System.out.println("[DEBUG] Updating profile for username: " + programModel.getUsername());

            return updateStmt.executeUpdate() > 0;

        } catch (SQLException e) {
            System.err.println("Error updating user profile: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }
}
