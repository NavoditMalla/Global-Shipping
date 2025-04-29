package com.islington.controller;

import com.islington.model.ProgramModel;
import com.islington.service.EditProfileService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class ProfileController
 */
@WebServlet("/profile")
public class ProfileController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final EditProfileService editProfileService = new EditProfileService();

    public ProfileController() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/pages/profile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // Get updated values from form
            String username = request.getParameter("username"); // should be readonly
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String password = request.getParameter("password");

            ProgramModel updatedUser = new ProgramModel();
            updatedUser.setUsername(username);
            updatedUser.setEmail(email);
            updatedUser.setPhone_Number(phone);
            updatedUser.setPassword(password);

            Boolean updateResult = editProfileService.updateUserProfile(updatedUser);

            if (updateResult != null && updateResult) {
                request.setAttribute("success", "Profile updated successfully!");
            } else {
                request.setAttribute("error", "Failed to update profile. Please try again.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "An unexpected error occurred. Please try again.");
        }

        // Always forward back to profile.jsp after POST
        request.getRequestDispatcher("/WEB-INF/pages/profile.jsp").forward(request, response);
    }
}
