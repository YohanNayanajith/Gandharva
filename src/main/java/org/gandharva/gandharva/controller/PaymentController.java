package org.gandharva.gandharva.controller;

import com.google.gson.Gson;
import org.gandharva.gandharva.constants.RequestType;
import org.gandharva.gandharva.constants.UserType;
import org.gandharva.gandharva.dao.PaymentDAO;
import org.gandharva.gandharva.dao.RequestDAO;
import org.gandharva.gandharva.model.Payment;
import org.gandharva.gandharva.model.Request;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.SQLException;
import java.util.Base64;
import java.util.List;
import java.util.UUID;

public class PaymentController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String userId = (String) session.getAttribute("id");

        if (session.getAttribute("id") == null) {
            resp.sendRedirect("Astrologer_Login.jsp");
            return;
        }

        String pathInfo = req.getPathInfo();
        String requestTypeString = null;

        String[] pathParts = pathInfo.split("/");
        if (pathParts.length > 1) {
            requestTypeString = pathParts[1];
        }

//        String userId = "fa993a0b-fe39-4df9-b7f6-183084c5d24c";
//        UUID userId = UUID.fromString(idString);

        try {
            List<Request> Requests = RequestDAO.getRequests(userId);
            Gson gson = new Gson();
            String requestJSON = gson.toJson(Requests);
            resp.setContentType("application/json");
            resp.setCharacterEncoding("UTF-8");
            resp.getWriter().write(requestJSON);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();

        String pathInfo = req.getPathInfo();
        String requestTypeString = null;

        String[] pathParts = pathInfo.split("/");
        if (pathParts.length > 1) {
            requestTypeString = pathParts[1];
        }

        Date paymentDate = Date.valueOf(req.getParameter("paymentDate"));
        String paymentMethod = req.getParameter("paymentMethod");
        Date previousExpireDate = Date.valueOf(req.getParameter("previousExpireDate"));
        String currency = req.getParameter("currency");
        double paymentAmount = Double.parseDouble(req.getParameter("paymentAmount"));
        String paymentStatus = req.getParameter("paymentStatus");
        String cusFirstName = req.getParameter("cusFirstName");
        String cusLastName = req.getParameter("cusLastName");
        String cusAddress = req.getParameter("cusAddress");
        String cusCity = req.getParameter("cusCity");
        Date newExpireDate = Date.valueOf(req.getParameter("newExpireDate"));

        HttpSession session = req.getSession();
        String idString = (String) session.getAttribute("id");
        UUID userId = UUID.fromString(idString);
        String userType = (String) session.getAttribute("userType");
        UserType userTypeEnum = UserType.valueOf(userType);

        assert requestTypeString != null;
        UUID requestId = UUID.fromString(requestTypeString);

        if(session.getAttribute("id") == null) {
            resp.sendRedirect("Astrologer_Login.jsp");
            return;
        }

        var payment = new Payment(paymentDate, paymentMethod, previousExpireDate, currency, paymentAmount, "", paymentStatus, cusFirstName, cusLastName, cusAddress, cusCity, newExpireDate, requestId, userId);

        boolean success = false;
        try {
            success = PaymentDAO.addPaymentDetails(payment);
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
