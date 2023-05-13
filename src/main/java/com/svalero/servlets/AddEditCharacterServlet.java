package com.svalero.servlets;
import com.svalero.dao.CharacterDAO;
import com.svalero.dao.Database;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/addedit-character")
public class AddEditCharacterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String firstName = request.getParameter("firstName").trim();
        String race = request.getParameter("race").trim();
        String alignment = request.getParameter("alignment").trim();
        String characterClass = request.getParameter("characterClass").trim();
        String lore = request.getParameter("lore").trim();
        String idPlayer = request.getParameter("playerId");

        String id, idTemp = null;
        String action = request.getParameter("action");
        if (action.equals("edit")) {
            idTemp = request.getParameter("characterId");
        }
        id = idTemp;

        try {
            Database.connect();
            if (action.equals("edit")) {
                Database.jdbi.withExtension(CharacterDAO.class, dao -> {
                    dao.modifyCharacter(firstName, race, alignment, characterClass, lore, id);
                    return null;
                });
                out.println("<div style='margin-top: 20px;' class='alert alert-success' role='alert'>Character successfully modified.</div>");
            } else {
                Database.jdbi.withExtension(CharacterDAO.class, dao -> {
                    dao.addCharacter(idPlayer, firstName, race, alignment, characterClass, lore);
                    return null;
                });
                out.println("<div style='margin-top: 20px;' class='alert alert-success' role='alert'>Character successfully added to database.</div>");
            }
        } catch (ClassNotFoundException cnfe) {
            cnfe.printStackTrace();
        }
    }
}
