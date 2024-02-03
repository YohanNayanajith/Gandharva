package org.gandharva.gandharva.controller;

import com.google.gson.Gson;
import org.gandharva.gandharva.constants.RequestType;
import org.gandharva.gandharva.dao.RequestDAO;
import org.gandharva.gandharva.model.Request;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

public class RequestGetAllWithStatusController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
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

        if (session.getAttribute("id") == null) {
            resp.sendRedirect("Astrologer_Login.jsp");
            return;
        }

//        String userId = "5c0481a1-dbb5-4b7d-ab80-e6fd26b9828d";
//        UUID userId = UUID.fromString(idString);

        try {
            List<Request> Requests = RequestDAO.getRequestsByStatus(userId, requestType);
            Gson gson = new Gson();
            String requestJSON = gson.toJson(Requests);
            resp.setContentType("application/json");
            resp.setCharacterEncoding("UTF-8");
            resp.getWriter().write(requestJSON);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
