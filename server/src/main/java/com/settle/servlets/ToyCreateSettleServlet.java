package com.settle.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.settle.SettleSessionManager;

@WebServlet("/toycreatesettle")
public class ToyCreateSettleServlet extends HttpServlet {
    final String NEW_SETTLE_CODE = "newSettleCode";

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String toySettleCode = "abcxyz123";

        String json = "";

        response.setContentType("application/json");
        response.getWriter().println(json);

        // response.setContentType("text/html");
        // response.getWriter().println("/toysessionmanager GET");
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        
    }
}