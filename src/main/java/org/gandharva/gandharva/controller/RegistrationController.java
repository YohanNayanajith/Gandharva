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
        System.out.println("Registration Page");
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
            case EVENT_PLANER:
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
            RequestDispatcher requestDispatcher = req.getRequestDispatcher("login.jsp");
            requestDispatcher.forward(req,resp);
        }
    }
}
