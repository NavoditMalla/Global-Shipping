package com.islington.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.time.LocalDate;

import com.islington.model.ProgramModel;
import com.islington.service.RegisterService;
import com.islington.util.ImageUtil;
import com.islington.util.PasswordUtil;
import com.islington.util.ValidationUtil;

/**
 * Servlet implementation class registerController
 */
@WebServlet(asyncSupported = true, urlPatterns = {"/register"})
@MultipartConfig(fileSizeThreshold = 1024*1024*2,
		maxFileSize = 1024 * 1024 * 10,
		maxRequestSize = 1024 * 1024 * 50)
public class registerController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final ImageUtil imageUtil = new ImageUtil();
	private final RegisterService registerService = new RegisterService();
    public registerController() {
        super();
    }
    private ProgramModel extractProgramModel(HttpServletRequest req) throws Exception {
    	int id = Integer.parseInt(req.getParameter("id"));
		String firstName = req.getParameter("firstname");
		String lastName = req.getParameter("lastname");
		String username = req.getParameter("username");
		LocalDate dob = LocalDate.parse(req.getParameter("dob"));
		String gender = req.getParameter("gender");
		String email = req.getParameter("email");
		String number = req.getParameter("phone");
		String password = req.getParameter("password");
		String retypePassword = req.getParameter("retypePassword");

		if (password == null || !password.equals(retypePassword)) {
			throw new Exception("Passwords do not match or are invalid.");
		}


		Part image = req.getPart("image");
		String imageUrl = imageUtil.getImageNameFromPart(image);

		return new ProgramModel(id, firstName, lastName, username, dob,
				gender, email, number, password,
				imageUrl);
	}
    private String validateRegistrationForm(HttpServletRequest req) {
        System.out.println("[DEBUG] Validating registration form");

        String name = req.getParameter("firstname");
        String username = req.getParameter("username");
        String gender = req.getParameter("gender");
        String email = req.getParameter("email");
        String phoneNumber = req.getParameter("phone");
        String password = req.getParameter("password");
        String retypePassword = req.getParameter("retypePassword");

        if (ValidationUtil.isNullOrEmpty(name)) return "First name is required.";
        if (ValidationUtil.isNullOrEmpty(username)) return "Username is required.";
        if (ValidationUtil.isNullOrEmpty(gender)) return "Gender is required.";
        if (ValidationUtil.isNullOrEmpty(email)) return "Email is required.";
        if (ValidationUtil.isNullOrEmpty(phoneNumber)) return "Phone number is required.";
        if (ValidationUtil.isNullOrEmpty(password)) return "Password is required.";
        if (ValidationUtil.isNullOrEmpty(retypePassword)) return "Please retype the password.";

        if (!ValidationUtil.isValidName(name)) return "First name must contain only letters and spaces.";
        if (!ValidationUtil.isAlphanumericStartingWithLetter(username)) return "Username must start with a letter and only contain letters and numbers.";
        if (!ValidationUtil.isValidGender(gender)) return "Gender must be 'male' or 'female'.";
        if (!ValidationUtil.isValidEmail(email)) return "Invalid email format.";
        if (!ValidationUtil.isValidPhoneNumber(phoneNumber)) return "Phone number must be 10 digits and start with 98.";
        if (!ValidationUtil.isValidPassword(password)) return "Password must be at least 8 characters long";
        if (!ValidationUtil.doPasswordsMatch(password, retypePassword)) return "Passwords do not match.";

        try {
            Part image = req.getPart("image");
            if (!ValidationUtil.isValidImageExtension(image)) return "Invalid image format. Only jpg, jpeg, png, and gif are allowed.";
        } catch (IOException | ServletException e) {
            System.out.println("[ERROR] Exception while validating image: " + e.getMessage());
            return "Error handling image file. Please ensure the file is valid.";
        }

        System.out.println("[DEBUG] Registration form validated successfully");
        return null;
    }

    private boolean uploadImage(HttpServletRequest request) throws ServletException, IOException {
        Part image = request.getPart("image");
        String rootPath = request.getServletContext().getRealPath("/");
        return imageUtil.uploadImage(image, rootPath, "resource/images");
    }


    private void handleSuccess(HttpServletRequest request, HttpServletResponse response, String message, String redirectPage) throws ServletException, IOException {
        request.setAttribute("success", message);
        request.getRequestDispatcher(redirectPage).forward(request, response);
    }

    private void handleError(HttpServletRequest request, HttpServletResponse response, String message) throws ServletException, IOException {
        request.setAttribute("error", message);
        request.getRequestDispatcher("WEB-INF/pages/registerpage.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/pages/registerpage.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        System.out.println("[DEBUG] POST /register called");

        try {
            // Step 1: Validate form input
            String validationMessage = validateRegistrationForm(req);
            if (validationMessage != null) {
                System.out.println("[DEBUG] Validation failed: " + validationMessage);
                handleError(req, resp, validationMessage);
                return;
            }

            System.out.println("[DEBUG] Validation passed");

            // Step 2: Extract ProgramModel
            ProgramModel programModel = extractProgramModel(req);
            System.out.println("[DEBUG] Extracted program model: " + programModel);

            // Step 3: Call registerService
            Boolean registrationResult = registerService.addUser(programModel);
            System.out.println("[DEBUG] RegisterService result: " + registrationResult);

            if (registrationResult == null) {
                handleError(req, resp, "Our Service is under maintenance. Please try again later.");
            } else if (registrationResult) {
                if (uploadImage(req)) {
                    System.out.println("[DEBUG] Image uploaded successfully");
                    handleSuccess(req, resp, "Your account has been successfully created.", "/WEB-INF/pages/loginpage.jsp");
                } else {
                    System.out.println("[DEBUG] Image upload failed");
                    handleError(req, resp, "Failed to upload profile picture. Please try again.");
                }
            } else {
                handleError(req, resp, "Could not register your account. Username or email may already exist.");
            }

        } catch (Exception e) {
            System.out.println("[ERROR] Unexpected exception: " + e.getMessage());
            e.printStackTrace();
            handleError(req, resp, "An unexpected error occurred. Please try again later.");
        }
    }



}
