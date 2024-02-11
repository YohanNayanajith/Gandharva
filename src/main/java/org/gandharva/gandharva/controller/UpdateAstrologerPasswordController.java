package org.gandharva.gandharva.controller;

import org.gandharva.gandharva.dao.AuthDao;
import org.gandharva.gandharva.model.AllUser;

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

public class UpdateAstrologerPasswordController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        PrintWriter out = resp.getWriter();
        resp.setContentType("text/plain");

        String password = req.getParameter("password");
        String newPassword = req.getParameter("newPassword");

        try {
            password = toHexStr(obtainSHA(password));
            newPassword = toHexStr(obtainSHA(newPassword));
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
            AllUser allUser = AuthDao.getUser(id);

            assert allUser != null;
            if(allUser.getPassword().equals(password)){
                success = AuthDao.updateAstrologerPassword(id, newPassword);
            }else {
                out.print("2");
            }

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
