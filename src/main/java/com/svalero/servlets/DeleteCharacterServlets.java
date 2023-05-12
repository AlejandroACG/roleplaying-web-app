package com.svalero.servlets;

import com.svalero.dao.CharacterDAO;
import com.svalero.dao.Database;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet("/delete-character")
public class DeleteCharacterServlets extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        response.setContentType("text/html");
        String id = request.getParameter("id");
        try {
            Database.connect();
            Database.jdbi.withExtension(CharacterDAO.class, dao -> {
                dao.deleteCharacter(id);
                return null;
            });
            response.sendRedirect("character-list.jsp");
        } catch (ClassNotFoundException | IOException e) {
            throw new RuntimeException(e);
        }
    }
}