package com.islington.controller;

import com.islington.model.TrackModel;
import com.islington.service.TrackService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/usertrackparcel")
public class UserTrackParcelController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private TrackService trackService;

    public UserTrackParcelController() {
        super();
        trackService = new TrackService();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/pages/usertrackparcel.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String trackingId = request.getParameter("trackingId");
        TrackModel parcel = trackService.getParcelByTrackingId(trackingId);

        if (parcel != null) {
            request.setAttribute("trackingId", parcel.getTrackingId());
            request.setAttribute("status", parcel.getStatus());
            request.setAttribute("location", parcel.getCurrentLocation());
            request.setAttribute("lastUpdated", parcel.getLastUpdated());
        } else {
            request.setAttribute("trackingId", trackingId);
        }

        request.getRequestDispatcher("/WEB-INF/pages/usertrackparcel.jsp").forward(request, response);
    }
}
