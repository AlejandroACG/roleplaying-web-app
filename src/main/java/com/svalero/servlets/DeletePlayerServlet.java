package com.svalero.servlets;

import com.svalero.dao.Database;
import com.svalero.dao.PlayerDAO;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/delete-player")
public class DeletePlayerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response){
        response.setContentType("text/html");
        String id = request.getParameter("id");
        try{
            Database.connect();
            Database.jdbi.withExtension(PlayerDAO.class, dao -> {
               dao.deletePlayer(id);
               return null;
            });
            response.sendRedirect("player-list.jsp");
        } catch (ClassNotFoundException | IOException e) {
            throw new RuntimeException(e);
        }
    };
}
