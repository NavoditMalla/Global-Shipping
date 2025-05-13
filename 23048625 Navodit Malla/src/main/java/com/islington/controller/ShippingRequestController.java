package com.islington.controller;

import com.islington.model.ShippingRequestModel;
import com.islington.service.ShippingRequestService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/shippingrequest")
public class ShippingRequestController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ShippingRequestService requestService;

    public ShippingRequestController() {
        requestService = new ShippingRequestService();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/pages/shippingrequest.jsp").forward(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        ShippingRequestModel requestModel = new ShippingRequestModel(
            request.getParameter("fullName"),
            request.getParameter("email"),
            request.getParameter("phone"),
            request.getParameter("origin"),
            request.getParameter("destination"),
            request.getParameter("packageDetails")
        );

        requestService.saveRequest(requestModel);

        request.getRequestDispatcher("/WEB-INF/pages/usertrackparcel.jsp").forward(request, response);
    }
}
