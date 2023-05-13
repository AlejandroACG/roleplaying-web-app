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

    <div class="col-lg-6 col-xxl-4 my-5 mx-auto">
        <div class="d-grid gap-2">
            <a href="player-form.jsp?action=add" class="btn btn-primary" type="button">Add new player</a>
        </div>
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
                    <h4>Name</h4>
                    <h5><%= character.getFirstName() %></h5>
                </div>
                <div class="greyborder">
                    <h5>Class</h5>
                    <h5><%= character.getCharacterClass() %></h5>
                </div>
                <div class="buttonsPlayer">
                    <a href="character-details.jsp?id=<%= character.getId() %>" class="btn btn-primary rounded-pill px-3">Details</a>
                    <a href="delete-character?id=<%= character.getId() %>" class="btn btn-danger rounded-pill px-3">Delete</a>
                    <a href="character-form.jsp?id=<%= character.getId() %>&action=edit" class="btn btn-danger rounded-pill px-3">Edit</a>
                </div>
            </div>
      <%
          }
      %>

        <%@include file="includes/footer.jsp"%>
    </div>
</html>
