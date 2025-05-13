package com.islington.controller;

import com.islington.model.DeliveryModel;
import com.islington.service.DeliveryService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/managedelivery")
public class ManageDeliveryController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private DeliveryService deliveryService;

    public ManageDeliveryController() {
        super();
        deliveryService = new DeliveryService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<DeliveryModel> deliveries = deliveryService.getAllDeliveries();
        request.setAttribute("deliveries", (List<DeliveryModel>) deliveries);
        request.getRequestDispatcher("/WEB-INF/pages/managedeliveries.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action != null) {
            switch (action) {
                case "create":
                    createDelivery(request);
                    break;
                case "edit":
                    updateDelivery(request);
                    break;
                case "delete":
                    deleteDelivery(request);
                    break;
                default:
                    break;
            }
        }

        response.sendRedirect(request.getContextPath() + "/managedelivery");
    }

    private void createDelivery(HttpServletRequest request) {
        DeliveryModel delivery = new DeliveryModel(
            request.getParameter("deliveryId"),
            request.getParameter("driverName"),
            request.getParameter("route"),
            request.getParameter("status")
        );
        deliveryService.addDelivery(delivery);
    }

    private void updateDelivery(HttpServletRequest request) {
        DeliveryModel delivery = new DeliveryModel(
            request.getParameter("deliveryId"),
            request.getParameter("driverName"),
            request.getParameter("route"),
            request.getParameter("status")
        );
        deliveryService.updateDelivery(delivery);
    }

    private void deleteDelivery(HttpServletRequest request) {
        String deliveryId = request.getParameter("deliveryId");
        deliveryService.deleteDelivery(deliveryId);
    }
}
