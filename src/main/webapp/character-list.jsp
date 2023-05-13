<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.svalero.dao.Database" %>
<%@ page import="com.svalero.dao.CharacterDAO" %>
<%@ page import="com.svalero.dao.PlayerDAO" %>
<%@ page import="com.svalero.domain.Player" %>
<%@ page import="com.svalero.domain.Character" %>
<%@ page import="java.util.List" %>
<%@include file="includes/header.jsp"%>

    <div class="container">
        <div class="searchBox">
            <h3>Search Character</h3>
            <br/>
            <form class="row g-3" action="search-character" method="post">
                <div class="col">
                    <input type="text" class="form-control" id="name" name="name" placeholder="Name">
                </div>
                <div class="col-auto">
                    <button type="submit" class="btn btn-primary">Search</button>
                </div>
            </form>
        </div>
        <br/>
        <div id="result"></div>
    </div>

    <div class="list-flex">

     <%
          Database.connect();
          List<Character> characters = Database.jdbi.withExtension(CharacterDAO.class, CharacterDAO::getCharacters);
          if (request.getAttribute("characters") != null) {
          characters = (List<Character>) request.getAttribute("characters");
          }
          for (Character character : characters) {
      %>
            <div class="card">
                <div class="nickname greyborder">
                    <h4><b>Name</b></h4>
                    <h5><b><%= character.getFirstName() %></b></h5>
                </div>
                <div class="greyborder">
                    <h5><b>Class</b></h5>
                    <h5><b><%= character.getCharacterClass() %></b></h5>
                </div>
                <div class="buttonsPlayer">
                <%
                String playerId = character.getPlayer().getId();

                 %>
                    <a href="character-details.jsp?characterId=<%= character.getId() %>" class="btn btn-primary rounded-pill px-3">Details</a>
                    <a href="character-form.jsp?characterId=<%= character.getId() %>&action=edit&playerId=<%=playerId%>" class="btn btn-success rounded-pill px-3">Edit</a>
                    <a href="delete-character?id=<%= character.getId() %>" class="btn btn-danger rounded-pill px-3">Delete</a>
                </div>
            </div>
      <%
          }
      %>

        <%@include file="includes/footer.jsp"%>
    </div>
</html>
