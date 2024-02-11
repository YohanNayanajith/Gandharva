package org.gandharva.gandharva.controller;

import org.gandharva.gandharva.constants.RequestType;
import org.gandharva.gandharva.dao.RequestDAO;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

public class UpdateRequestStatus extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        PrintWriter out = resp.getWriter();
        resp.setContentType("text/plain");

        String status = req.getParameter("status");
        String requestId = req.getParameter("requestId");

        HttpSession session = req.getSession();
        String userId = (String) session.getAttribute("id");

        boolean success = false;
        try {
            success = RequestDAO.updateRequestStatus(requestId, RequestType.valueOf(status));
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        if(success){
            out.print("1");
        } else{
            out.print("0");
        }
    }
}
