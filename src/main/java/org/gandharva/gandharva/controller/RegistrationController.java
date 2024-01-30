package org.gandharva.gandharva.controller;

import org.gandharva.gandharva.constants.UserType;
import org.gandharva.gandharva.dao.AuthDao;
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

        System.out.println("UserType "+ userType);

        try {
            password = toHexStr(obtainSHA(password));
//            System.out.println(login_password);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }

        System.out.println("Password: "+password);

        UserType userTypeEnum = UserType.valueOf(userType);

        var user = new User(firstName,lastName,userTypeEnum,email,password);

        switch (userTypeEnum) {
            case GUEST_USER:
                System.out.println("Guest User");
                break;
            case PREMIUM_USER:
                System.out.println("Premium User");
                break;
            case STANDARD_USER:
                System.out.println("Standard User");
                break;
            case ASTROLOGER:
                System.out.println("Astrologer User");
                try {
                    AuthDao.registration(user);
                } catch (SQLException | ClassNotFoundException e) {
                    throw new RuntimeException(e);
                }
                RequestDispatcher requestDispatcher = req.getRequestDispatcher("login.jsp");
                requestDispatcher.forward(req,resp);
                break;
            case EVENT_PLANER:
                System.out.println("Event Planner User");
                break;
            case ADMIN:
                System.out.println("admin User");
                break;
            default:
                System.out.println();
                out.print("0");
        }
    }
}
