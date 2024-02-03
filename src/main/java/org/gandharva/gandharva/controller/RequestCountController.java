package org.gandharva.gandharva.controller;

import org.gandharva.gandharva.constants.RequestType;
import org.gandharva.gandharva.dao.RequestDAO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

public class RequestCountController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        resp.setContentType("text/plain");
        
        String pathInfo = req.getPathInfo();
        String requestTypeString = null;

        String[] pathParts = pathInfo.split("/");
        if (pathParts.length > 1) {
            requestTypeString = pathParts[1];
        }
        System.out.println("Status: " + requestTypeString);

        RequestType requestType = RequestType.valueOf(requestTypeString);

        HttpSession session = req.getSession();
        String userId = (String) session.getAttribute("id");

        System.out.println("UserId RequestCount: "+userId);

        if (session.getAttribute("id") == null) {
            resp.sendRedirect("Astrologer_Login.jsp");
            return;
        }

//        String userId = "fa993a0b-fe39-4df9-b7f6-183084c5d24c";
//        UUID userId = UUID.fromString(idString);

        try {
            int requestsCount = RequestDAO.getRequestsCount(userId, requestType);
            out.print(requestsCount);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
