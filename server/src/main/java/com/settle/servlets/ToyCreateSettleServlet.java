package com.settle.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.sling.commons.json.JSONObject;

@WebServlet("/toycreatesettle")
public class ToyCreateSettleServlet extends HttpServlet {
    final String NEW_SETTLE_CODE = "newSettleCode";

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String toySettleCode = "abcxyz123";

        String json = "";
        try {
            JSONObject jsonBuilder = new JSONObject();
            jsonBuilder.put(NEW_SETTLE_CODE, toySettleCode);
            json = jsonBuilder.toString();
        } catch (Exception e) {
            System.out.println("Error while processing JSON file.");
            System.out.println(e);
        }

        response.setContentType("application/json;");
        response.getWriter().println(json);
    }

    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        
    }
}
