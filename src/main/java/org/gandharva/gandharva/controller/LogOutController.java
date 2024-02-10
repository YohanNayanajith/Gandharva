package org.gandharva.gandharva.controller;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

public class LogOutController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        System.out.println("Logout controller called");
        PrintWriter out = resp.getWriter();
        HttpSession session = req.getSession();
        session.removeAttribute("loggedInUser");
        session.invalidate();
        out.write("1");
    }
}
