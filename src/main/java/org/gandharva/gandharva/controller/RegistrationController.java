package org.gandharva.gandharva.controller;

import org.gandharva.gandharva.constants.UserType;
import org.gandharva.gandharva.dao.AuthDao;
import org.gandharva.gandharva.model.Astrologer;
import org.gandharva.gandharva.model.EventPlanner;
import org.gandharva.gandharva.model.ParentUser;
import org.gandharva.gandharva.model.User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.Base64;

import static org.gandharva.gandharva.constants.PasswordHashing.obtainSHA;
import static org.gandharva.gandharva.constants.PasswordHashing.toHexStr;

public class RegistrationController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        PrintWriter out = resp.getWriter();
//        resp.setContentType("text/plain");
//
//        String pathInfo = req.getPathInfo();
//        String userType = null;
//
//        String[] pathParts = pathInfo.split("/");
//        if (pathParts.length > 1) {
//            userType = pathParts[1];
//        }
//        System.out.println("Registration Page get call");
//        System.out.println("User Type: "+userType);
//
//        UserType userTypeEnum = null;
//
//        try {
//            assert userType != null;
//            userTypeEnum = UserType.valueOf(userType.toUpperCase());
//        } catch (IllegalArgumentException e) {
//            System.out.println("Exception caught: " + e.getMessage());
//            resp.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "UserType cannot be null!");
//            return;
//        }
//
//        switch (userTypeEnum) {
//            case USER:
//                System.out.println("Guest User");
//                resp.sendRedirect("user.jsp");
//                break;
//            case ASTROLOGER:
//                System.out.println("Astrologer User");
//                resp.sendRedirect("astrologer");
//                break;
//            case EVENT_PLANNER:
//                System.out.println("Event Planner User");
//                resp.sendRedirect("eventPlanner.jsp");
//                break;
//            default:
//                System.out.println();
////                out.print("0");
//                resp.sendError(HttpServletResponse.SC_NOT_FOUND, "UserType not found!");
//                return;
//        }
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("NavigatePage.jsp");
        requestDispatcher.forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        resp.setContentType("text/plain");

        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String userType = req.getParameter("userType");
        String countryOfResidence = req.getParameter("countryOfResidence");
        String district = req.getParameter("district");

        System.out.println("UserType "+ userType);

        try {
            password = toHexStr(obtainSHA(password));
//            System.out.println(login_password);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }

        System.out.println("Password: "+password);

        UserType userTypeEnum = UserType.valueOf(userType);

        var parentUser = new ParentUser(firstName,lastName,userTypeEnum,email,password,countryOfResidence,district);

        boolean success = false;

        switch (userTypeEnum) {
            case USER:
            case STANDARD_USER:
            case PREMIUM_USER:
                System.out.println("User");
                String nic = req.getParameter("nic");
                LocalDate birthday = LocalDate.parse(req.getParameter("birthday"));

                User user = new User(parentUser,nic,birthday);
                try {
                    success = AuthDao.userRegistration(user);
                } catch (SQLException | ClassNotFoundException e) {
                    throw new RuntimeException(e);
                }
                break;
            case ASTROLOGER:
                System.out.println("Astrologer User");
                int numberOfCasesHandled = Integer.parseInt(req.getParameter("numberOfCasesHandled"));
                int yearsOfExperience = Integer.parseInt(req.getParameter("yearsOfExperience"));
                String certificateFileData = req.getParameter("certificateFileUpload");
                byte[] certificateFileUpload = Base64.getDecoder().decode(certificateFileData);

                Astrologer astrologer = new Astrologer(parentUser,numberOfCasesHandled,yearsOfExperience,certificateFileUpload);
                try {
                    success = AuthDao.astrologerRegistration(astrologer);
                } catch (SQLException | ClassNotFoundException e) {
                    throw new RuntimeException(e);
                }
                break;
            case EVENT_PLANNER:
                System.out.println("Event Planner User");
                int numberOfCasesHandledByEP = Integer.parseInt(req.getParameter("numberOfCasesHandled"));
                int yearsOfExperienceByEP = Integer.parseInt(req.getParameter("yearsOfExperience"));
                String brFileUploadData = req.getParameter("brFileUpload");
                byte[] brFileUpload = Base64.getDecoder().decode(brFileUploadData);

                EventPlanner eventPlanner = new EventPlanner(parentUser,numberOfCasesHandledByEP,yearsOfExperienceByEP,brFileUpload);
                try {
                    success = AuthDao.eventPlannerRegistration(eventPlanner);
                } catch (SQLException | ClassNotFoundException e) {
                    throw new RuntimeException(e);
                }
                break;
            case ADMIN:
                System.out.println("admin User");
                break;
            default:
                System.out.println();
                out.print("0");
        }

        if(success){
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("Astrologer_Login.jsp");
            requestDispatcher.forward(req,resp);
        }
    }
}
