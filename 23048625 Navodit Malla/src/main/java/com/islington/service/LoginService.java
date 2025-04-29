package com.islington.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.islington.config.DbConfig;
import com.islington.model.ProgramModel;
import com.islington.util.PasswordUtil;

/**
 * Service class for handling login operations. Connects to the database,
 * verifies user credentials, and returns login status.
 */
public class LoginService {

    private Connection dbConn;
    private boolean isConnectionError = false;

    /**
     * Constructor initializes the database connection. Sets the connection error
     * flag if the connection fails.
     */
    public LoginService() {
        try {
            dbConn = DbConfig.getDbConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
            isConnectionError = true;
        }
    }

    /**
     * Validates the user credentials against the database records.
     *
     * @param programModel the ProgramModel object containing user credentials
     * @return true if the user credentials are valid, false otherwise; null if a
     *         connection error occurs
     */
    public Boolean loginUser(ProgramModel programModel) {
        if (isConnectionError) {
            System.out.println("Connection Error!");
            return null;
        }

        String query = "SELECT Username, Password FROM user WHERE username = ?";
        try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
            stmt.setString(1, programModel.getUsername());
            System.out.println("Executing query with username: " + programModel.getUsername());

            ResultSet result = stmt.executeQuery();

            if (result.next()) {
                System.out.println("User found in database!");
                return validatePassword(result, programModel);
            } else {
                System.out.println("No user found with that username.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }

        return false;
    }


    /**
     * Validates the password retrieved from the database.
     *
     * @param result       the ResultSet containing the username and password from
     *                     the database
     * @param programModel the ProgramModel object containing user credentials
     * @return true if the passwords match, false otherwise
     * @throws SQLException if a database access error occurs
     */
    private boolean validatePassword(ResultSet result, ProgramModel programModel) throws SQLException {
        String dbUsername = result.getString("Username");
        String dbPassword = result.getString("Password");

        // Decrypt password stored in DB
        String decryptedPassword = PasswordUtil.decrypt(dbPassword, dbUsername);
        System.out.println("DB Username: " + dbUsername);
        System.out.println("Decrypted Password from DB: " + decryptedPassword);
        System.out.println("Input Password: " + programModel.getPassword());

        // Compare plain input with decrypted password
        return dbUsername.equals(programModel.getUsername()) &&
               decryptedPassword != null &&
               decryptedPassword.equals(programModel.getPassword());
    }



}
