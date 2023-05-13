<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.svalero.dao.Database" %>
<%@ page import="com.svalero.dao.PlayerDAO" %>
<%@ page import="com.svalero.domain.Player" %>
<%@ page import="com.svalero.dao.CharacterDAO" %>
<%@ page import="com.svalero.domain.Character" %>
<%@include file="includes/header.jsp"%>

    <%
        String action = request.getParameter("action");
        Database.connect();
        Character character = null;
        String playerId = request.getParameter("playerId");
        String firstName = null;
        String race = null;
        String alignment = null;
        String characterClass = null;
        String lore = null;
        if (action.equals("edit")) {
            character = Database.jdbi.withExtension(CharacterDAO.class, dao -> dao.getCharacter(request.getParameter("characterId")));
            firstName = character.getFirstName();
            race = character.getRace();
            alignment = character.getAlignment();
            characterClass = character.getCharacterClass();
            lore = character.getLore();
        }
        if (character == null) {
            firstName = "";
            race = "";
            alignment = "";
            characterClass = "";
            lore = "";
        }

        if (action.equals("edit")) {
    %>
        <h1 class="alingText"> Edit character <%= firstName %> </h1>
        <h3 class="alingText"> Please, modify <%= firstName %>'s information to upload it to our database.</h3>
    <% } else { %>
        <h1 class="alingText"> Add new character </h1>
        <h3 class="alingText"> Please, introduce the new character's information to upload it to our database.</h3>
    <%
       }
    %>

    <form class="" method="post" action="addedit-character">
        <div class="col-md-3">
            <label for="firstName" class="form-label">Name</label>
            <input type="text" class="form-control" id="firstName" name="firstName" value="<%= firstName %>" required>
        </div>
        <div class="col-md-3">
            <label for="race" class="form-label">Race</label>
            <input type="text" class="form-control" id="race" name="race" value="<%= race %>" required>
        </div>
        <div class="col-md-3">
            <label for="alignment" class="form-label">Alignment</label>
            <input type="text" class="form-control" id="alignment" name="alignment" value="<%= alignment %>" required>
        </div>
        <div class="col-md-3">
            <label for="characterClass" class="form-label">Character class</label>
            <input type="text" class="form-control" id="characterClass" name="characterClass" value="<%= characterClass %>" required>
        </div>
        <div class="col-md-3">
           <label for="lore" class="form-label">Lore</label>
           <input type="form-control" class="form-control" id="lore" name="lore" rows="3" value="<%= lore %>" required>
         </div>
          <input type="hidden" name="playerId" value='<%= playerId %>'/>
         <%
             if (action.equals("edit")) {
         %>
         <div class="col-md-6">
         <input type="hidden" name="characterId" value='<%= request.getParameter("characterId") %>'/>
         </div>
         <%
             }
         %>
         <input type="hidden" name="action" value="<%= action %>"/>
         <% if (action.equals("edit")) { %>
            <input type="submit" class="btn btn-primary rounded-pill px-3" value="Edit"/>
         <% } else { %>
            <input type="submit" class="btn btn-primary rounded-pill px-3" value="Add"/>
         <% } %>
    </form>
    <div id="result"></div>

<%@include file="includes/footer.jsp"%>
</html>
