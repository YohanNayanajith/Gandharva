package org.gandharva.gandharva.controller;

import org.gandharva.gandharva.constants.RequestType;
import org.gandharva.gandharva.constants.UserType;
import org.gandharva.gandharva.dao.RequestDAO;
import org.gandharva.gandharva.model.Request;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.Base64;
import java.util.UUID;

public class RequestController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("Astrologer_pending.jsp");
        requestDispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        PrintWriter out = resp.getWriter();

        Date startDate = Date.valueOf(req.getParameter("startDate"));
        Date deadline = Date.valueOf(req.getParameter("deadline"));
        byte[] horoscope = Base64.getDecoder().decode(req.getParameter("horoscope"));
        String statusString = req.getParameter("status");
        RequestType status = RequestType.valueOf(statusString);
        String comments = req.getParameter("comments");
        String feedback = req.getParameter("feedback");
        String astrologerIdString = req.getParameter("astrologerId");
        UUID astrologerId = UUID.fromString(astrologerIdString);

        HttpSession session = req.getSession();
        String idString = (String) session.getAttribute("id");
        UUID userId = UUID.fromString(idString);
        String userType = (String) session.getAttribute("userType");
        UserType userTypeEnum = UserType.valueOf(userType);

        if(session.getAttribute("id") == null) {
            resp.sendRedirect("Astrologer_Login.jsp");
            return;
        }

//        String idString = "fa993a0b-fe39-4df9-b7f6-183084c5d24c";
//        UUID userId = UUID.fromString(idString);

        var request = new Request(startDate,deadline,horoscope,status,comments,feedback,userId,astrologerId);

        boolean success = false;
        try {
            success = RequestDAO.addRequest(request);
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        if(success){
            out.print("1");
        }else {
            out.print("0");
        }
    }
}
