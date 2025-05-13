package com.islington.controller;

import com.islington.model.UserModel;
import com.islington.service.LoginService;
import com.islington.util.CookieUtil;
import com.islington.util.SessionUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * LoginController is responsible for handling login requests. It interacts with
 * the LoginService to authenticate users.
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/login" })
public class LoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private final LoginService loginService;

    public LoginController() {
        this.loginService = new LoginService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/pages/loginpage.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username = req.getParameter("username");
        String password = req.getParameter("password");

        System.out.println("[DEBUG] Attempting login for user: " + username);

        // Input validation
        if (username == null || username.trim().isEmpty() || password == null || password.trim().isEmpty()) {
            handleLoginFailure(req, resp, false, "Username and password cannot be empty.");
            return;
        }

        UserModel programModel = new UserModel();
        programModel.setUsername(username);
        programModel.setPassword(password);

        Boolean loginStatus = loginService.loginUser(programModel);

        if (loginStatus != null && loginStatus) {
            System.out.println("[DEBUG] Login successful for user: " + username);
            req.getSession().setAttribute("loggedIn", true);
            SessionUtil.setAttribute(req, "username", username);

            // You can also fetch full ProgramModel details if you want later

            // Set role-based cookies
            if ("admin".equalsIgnoreCase(username)) {
                CookieUtil.addCookie(resp, "role", "admin", 5 * 60); // 5 minutes
                System.out.println("[DEBUG] Admin role set in cookie for user: " + username);
                resp.sendRedirect(req.getContextPath() + "/dashboard"); // Admin dashboard
            } else {
                CookieUtil.addCookie(resp, "role", "user", 5 * 60); // 5 minutes
                System.out.println("[DEBUG] User role set in cookie for user: " + username);
                resp.sendRedirect(req.getContextPath() + "/customer"); // User home
            }

        } else {
            System.out.println("[DEBUG] Login failed for user: " + username);
            handleLoginFailure(req, resp, loginStatus, null);
        }
    }

    private void handleLoginFailure(HttpServletRequest req, HttpServletResponse resp, Boolean loginStatus, String customMessage)
            throws ServletException, IOException {
        String errorMessage;

        if (customMessage != null) {
            errorMessage = customMessage;
        } else if (loginStatus == null) {
            errorMessage = "Our server is under maintenance. Please try again later!";
        } else {
            errorMessage = "User credential mismatch. Please try again!";
        }

        req.setAttribute("error", errorMessage);
        req.getRequestDispatcher("/WEB-INF/pages/loginpage.jsp").forward(req, resp);
    }
}
