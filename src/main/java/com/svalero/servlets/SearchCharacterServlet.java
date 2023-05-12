package com.svalero.servlets;
import com.svalero.dao.CharacterDAO;
import com.svalero.dao.Database;
import com.svalero.domain.Character;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/search-character")
public class SearchCharacterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        String name = request.getParameter("name");

        try {
            Database.connect();
            List<Character> characters;
            characters = Database.jdbi.withExtension(CharacterDAO.class, dao -> dao.getCharactersByName(name.trim()));

            request.setAttribute("characters", characters);
            request.getRequestDispatcher("character-list.jsp").forward(request, response);
        } catch (ClassNotFoundException cnfe) {
            cnfe.printStackTrace();
        }
    }
}
