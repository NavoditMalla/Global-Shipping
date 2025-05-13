package com.islington.service;
import java.sql.Connection;
import com.islington.util.PasswordUtil;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.islington.config.DbConfig;
import com.islington.model.UserModel;

public class RegisterService {
	private Connection dbConn;
	public RegisterService() {
		try{
			this.dbConn = DbConfig.getDbConnection();
		} catch(SQLException | ClassNotFoundException ex) {
			System.err.println("Database connection error: " + ex.getMessage());
			ex.printStackTrace();
		}
	}
	public Boolean addUser(UserModel programModel) {
	    if (dbConn == null) {
	        System.err.println("Database connection is not available");
	        return null;
	    }
	    String insertQuery = "INSERT INTO `user` (`Id`, `First_Name`, `Last_Name`, `Username`, `Birthday`, `Gender`, `Email`, `Phone_Number`, `Password`, `ImageUrl`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	    try (PreparedStatement insertStmt = dbConn.prepareStatement(insertQuery)) {
	        insertStmt.setInt(1, programModel.getId());
	        insertStmt.setString(2, programModel.getFirst_Name());
	        insertStmt.setString(3, programModel.getLast_Name());
	        insertStmt.setString(4, programModel.getUsername());
	        insertStmt.setDate(5, Date.valueOf(programModel.getBirthday()));
	        insertStmt.setString(6, programModel.getGender());
	        insertStmt.setString(7, programModel.getEmail());
	        insertStmt.setString(8, programModel.getPhone_Number());

	        // Encrypt the password before storing
	        String encryptedPassword = PasswordUtil.encrypt(programModel.getUsername(), programModel.getPassword());
	        insertStmt.setString(9, encryptedPassword);

	        insertStmt.setString(10, programModel.getImageUrl());
	        System.out.println("Plaintext Password: " + programModel.getPassword());
	        System.out.println("Encrypted Password for DB: " + encryptedPassword);


	        return insertStmt.executeUpdate() > 0;
	    } catch (SQLException e) {
	        System.err.println("Error during student registration " + e.getMessage());
	        e.printStackTrace();
	        return null;
	    }
	    
	}
	public boolean isUsernameTaken(String username) {
	    String query = "SELECT COUNT(*) FROM user WHERE Username = ?";
	    try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
	        stmt.setString(1, username);
	        ResultSet rs = stmt.executeQuery();
	        if (rs.next()) {
	            return rs.getInt(1) > 0;
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return false;
	}

	
}
