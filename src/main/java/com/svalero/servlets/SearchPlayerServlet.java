package com.svalero.servlets;
import com.svalero.dao.Database;
import com.svalero.dao.PlayerDAO;
import com.svalero.dao.VideogameDAO;
import com.svalero.domain.Player;
import com.svalero.domain.Videogame;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/search-player")
public class SearchPlayerServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        String fullName = request.getParameter("fullName");

        try {
            Database.connect();
            List<Player> players;
            players = Database.jdbi.withExtension(PlayerDAO.class, dao -> dao.getPlayersByFullName(fullName.trim()));

            request.setAttribute("players", players);
            request.getRequestDispatcher("player-list.jsp").forward(request, response);
        } catch (ClassNotFoundException cnfe) {
            cnfe.printStackTrace();
        }
    }
}
