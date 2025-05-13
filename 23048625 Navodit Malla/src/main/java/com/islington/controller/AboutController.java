package com.islington.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/aboutus")
public class AboutController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AboutController() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/pages/aboutus.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Future form handling logic can go here if needed
        response.sendRedirect("/WEB-INF/pages/aboutus.jsp?submitted=true");
    }
}
