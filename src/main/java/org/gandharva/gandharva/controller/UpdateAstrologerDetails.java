package org.gandharva.gandharva.controller;

import org.gandharva.gandharva.dao.AuthDao;
import org.gandharva.gandharva.model.Astrologer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

public class UpdateAstrologerDetails extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        PrintWriter out = resp.getWriter();
        resp.setContentType("text/plain");

        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        String district = req.getParameter("district");
        String email = req.getParameter("email");
        int yearsOfExperience = Integer.parseInt(req.getParameter("yearsOfExperience"));

        Astrologer astrologer = new Astrologer();
        astrologer.setFirstName(firstName);
        astrologer.setLastName(lastName);
        astrologer.setDistrict(district);
        astrologer.setEmail(email);
        astrologer.setYearsOfExperience(yearsOfExperience);

        boolean success = false;
        try {
            success = AuthDao.updateAstrologer(astrologer);
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
