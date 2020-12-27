package com.settle.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.sling.commons.json.JSONObject;
import com.settle.SettleSessionManager;

@WebServlet("/toyjoinsettle")
public class ToyJoinSettleServlet extends HttpServlet {
    final String JOIN_SETTLE_CODE = "joinSettleCode";

    @Override
    public void init() {
        SettleSessionManager.startSessionManager();
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        java.lang.System.out.println("/toyjoinsettle.doGet()");
        SettleSessionManager.requestStopSessionManager();
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        System.out.println(request.getParameter(JOIN_SETTLE_CODE));
    }
}
