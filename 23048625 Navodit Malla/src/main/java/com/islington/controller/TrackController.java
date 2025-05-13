package com.islington.controller;

import com.islington.model.TrackModel;
import com.islington.service.TrackService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

@WebServlet("/trackparcel")
public class TrackController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private TrackService trackService;

    public TrackController() {
        super();
        trackService = new TrackService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<TrackModel> parcels = trackService.getAllParcels();
        request.setAttribute("parcels", parcels);
        request.getRequestDispatcher("/WEB-INF/pages/trackparcels.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action != null) {
            switch (action) {
                case "create":
                    createParcel(request);
                    break;
                case "edit":
                    updateParcel(request);
                    break;
                case "delete":
                    deleteParcel(request);
                    break;
                default:
                    break;
            }
        }

        response.sendRedirect(request.getContextPath() + "/trackparcel");
    }

    private void createParcel(HttpServletRequest request) {
        TrackModel parcel = new TrackModel(
            request.getParameter("trackingId"),
            request.getParameter("status"),
            request.getParameter("currentLocation"),
            request.getParameter("lastUpdated")
        );
        trackService.addParcel(parcel);
    }

    private void updateParcel(HttpServletRequest request) {
        TrackModel parcel = new TrackModel(
            request.getParameter("trackingId"),
            request.getParameter("status"),
            request.getParameter("currentLocation"),
            request.getParameter("lastUpdated")
        );
        trackService.updateParcel(parcel);
    }

    private void deleteParcel(HttpServletRequest request) {
        String trackingId = request.getParameter("trackingId");
        trackService.deleteParcel(trackingId);
    }
}
