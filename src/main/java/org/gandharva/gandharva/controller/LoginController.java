package org.gandharva.gandharva.controller;

import org.gandharva.gandharva.constants.UserType;
import org.gandharva.gandharva.dao.LoginDAO;
import org.gandharva.gandharva.model.Login;
import org.gandharva.gandharva.model.ParentUser;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.Objects;

import static org.gandharva.gandharva.constants.PasswordHashing.obtainSHA;
import static org.gandharva.gandharva.constants.PasswordHashing.toHexStr;

public class LoginController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = req.getRequestDispatcher("login.jsp");
        requestDispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        resp.setContentType("text/plain");
        String email = req.getParameter("email");
        String password = req.getParameter("password");

        try {
            password = toHexStr(obtainSHA(password));
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }

        Login login = new Login(email, password);

        try {
            var loginData = LoginDAO.getLoginData(login);

            assert loginData != null;

            HttpSession session = req.getSession(true);
            session.setAttribute("id", loginData.getId());
            session.setAttribute("firstName", loginData.getFirstName());
            session.setAttribute("lastName", loginData.getLastName());
            session.setAttribute("userType", loginData.getUserType());

            UserType userType = loginData.getUserType();

            if (checkLogin(login, loginData)) {
                switch (userType) {
                    case PREMIUM_USER:
                        out.print("1");
                        break;
                    case STANDARD_USER:
                        out.print("2");
                        break;
                    case ASTROLOGER:
                        out.print("3");
                        break;
                    case EVENT_PLANNER:
                        out.print("4");
                        break;
                    case ADMIN:
                        out.print("5");
                        break;
                    default:
                        out.print("6");
                        break;
                }
            } else {
                out.print("6");
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public boolean checkLogin(Login login_user, ParentUser loginData) {
        if ((Objects.equals(login_user.getEmail(), loginData.getEmail())) && (Objects.equals(login_user.getPassword(), loginData.getPassword()))) {
            return true;
        } else {
            System.out.println("Login incorrect");
            return false;
        }
    }
}
