package org.gandharva.gandharva.controller;

import org.gandharva.gandharva.dao.AuthDao;
import org.gandharva.gandharva.model.AllUser;
import org.gandharva.gandharva.model.Astrologer;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Objects;
import java.util.UUID;

@MultipartConfig
public class UpdateAstrologerDetailsController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        PrintWriter out = resp.getWriter();
        resp.setContentType("text/plain");

        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        String district = req.getParameter("district");
        String email = req.getParameter("email");
        int yearsOfExperience = Integer.parseInt(req.getParameter("yearsOfExperience"));

        HttpSession session = req.getSession();
        String idString = (String) session.getAttribute("id");
        UUID userId = UUID.fromString(idString);

        if(session.getAttribute("id") == null) {
            resp.sendRedirect("Astrologer_Login.jsp");
            return;
        }

        Astrologer astrologer = new Astrologer();
        astrologer.setId(userId);
        astrologer.setFirstName(firstName);
        astrologer.setLastName(lastName);
        astrologer.setDistrict(district);
        astrologer.setEmail(email);
        astrologer.setYearsOfExperience(yearsOfExperience);

        boolean success = false;
        try {
            success = AuthDao.updateAstrologer(astrologer);

            AllUser allUser = AuthDao.getUser(idString);

            switch (Objects.requireNonNull(allUser).getUserType()){
                case PREMIUM_USER:
                    session.setAttribute("premiumUser", allUser);
                    break;
                case STANDARD_USER:
                    session.setAttribute("standardUser", allUser);
                    break;
                case ASTROLOGER:
                    session.setAttribute("astrologer", allUser);
                    break;
                case EVENT_PLANNER:
                    session.setAttribute("eventPlanner", allUser);
                    break;
                case ADMIN:
                    session.setAttribute("admin", allUser);
                    break;
                default:
                    break;
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
