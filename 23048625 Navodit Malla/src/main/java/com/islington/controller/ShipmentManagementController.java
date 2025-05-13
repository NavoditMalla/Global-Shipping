package com.islington.controller;

import com.islington.model.ShipmentModel;
import com.islington.service.ShipmentService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/manageshipment")
public class ShipmentManagementController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ShipmentService shipmentService;

    public ShipmentManagementController() {
        super();
        shipmentService = new ShipmentService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<ShipmentModel> shipments = shipmentService.getAllShipments();
        request.setAttribute("shipments", shipments);
        request.getRequestDispatcher("/WEB-INF/pages/manageshipments.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action != null) {
            switch (action) {
                case "create":
                    createShipment(request);
                    break;
                case "edit":
                    updateShipment(request);
                    break;
                case "delete":
                    deleteShipment(request);
                    break;
                default:
                    break;
            }
        }

        response.sendRedirect(request.getContextPath() + "/manageshipment");
    }

    private void createShipment(HttpServletRequest request) {
        ShipmentModel shipment = new ShipmentModel(
            request.getParameter("shipmentId"),
            request.getParameter("origin"),
            request.getParameter("destination"),
            request.getParameter("status")
        );
        shipmentService.addShipment(shipment);
    }

    private void updateShipment(HttpServletRequest request) {
        ShipmentModel shipment = new ShipmentModel(
            request.getParameter("shipmentId"),
            request.getParameter("origin"),
            request.getParameter("destination"),
            request.getParameter("status")
        );
        shipmentService.updateShipment(shipment);
    }

    private void deleteShipment(HttpServletRequest request) {
        String shipmentId = request.getParameter("shipmentId");
        shipmentService.deleteShipment(shipmentId);
    }
}
