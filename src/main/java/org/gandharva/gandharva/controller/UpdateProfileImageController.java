package org.gandharva.gandharva.controller;

import org.gandharva.gandharva.dao.AuthDao;
import org.gandharva.gandharva.model.AllUser;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Objects;
import java.util.UUID;

@MultipartConfig
public class UpdateProfileImageController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        resp.setContentType("text/plain");

        Part filePart = req.getPart("userImage");
        byte[] userImage = null;
        if (filePart != null) {
            System.out.println("File part is not null!");
            InputStream fileContent = filePart.getInputStream();
            userImage = fileContent.readAllBytes();
        }

        HttpSession session = req.getSession();
        String idString = (String) session.getAttribute("id");
        UUID userId = UUID.fromString(idString);

        if(session.getAttribute("id") == null) {
            resp.sendRedirect("Astrologer_Login.jsp");
            return;
        }

        boolean success = false;
        try {
            success = AuthDao.updateProfileImage(idString,userImage);
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
