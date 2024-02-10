package org.gandharva.gandharva.controller;

import org.gandharva.gandharva.dao.AuthDao;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;

import static org.gandharva.gandharva.constants.PasswordHashing.obtainSHA;
import static org.gandharva.gandharva.constants.PasswordHashing.toHexStr;

public class UpdateAstrologerPassword extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        PrintWriter out = resp.getWriter();
        resp.setContentType("text/plain");

        String password = req.getParameter("password");

        try {
            password = toHexStr(obtainSHA(password));
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }

        HttpSession session = req.getSession();
        String id = (String) session.getAttribute("id");
//        UUID id = UUID.fromString(idString);

        if(session.getAttribute("id") == null) {
            resp.sendRedirect("Astrologer_Login.jsp");
            return;
        }

        boolean success = false;
        try {
            success = AuthDao.updateAstrologerPassword(id, password);
        } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        if(success){
            out.print("1");
        } else {
            out.print("0");
        }
    }
}
