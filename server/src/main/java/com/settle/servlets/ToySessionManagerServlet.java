package com.settle.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.settle.SettleSessionManager;

@WebServlet("/toysessionmanager")
public class ToySessionManagerServlet extends HttpServlet {
    final String JOIN_SETTLE_CODE = "joinSettleCode";

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        java.lang.System.out.println("/toysessionmanager.doGet()");
        java.lang.System.out.println(request.getRemoteAddr());
        // String sessionCode = SettleSessionManager.createSettleSession();

        response.setContentType("text/html");
        response.getWriter().println("/toysessionmanager GET");
        // response.getWriter().println("Your IP address: " + request.getRemoteAddr());

        String ipAddress = request.getHeader("X-FORWARDED-FOR");  
        if (ipAddress == null) {
            response.getWriter().println("not forwarded IP: " + request.getRemoteAddr());
        } else {
            response.getWriter().println("forwarded IP: " + ipAddress);
        }
        // response.getWriter().println("Your session code is: " + sessionCode);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        System.out.println(request.getParameter(JOIN_SETTLE_CODE));
    }
}