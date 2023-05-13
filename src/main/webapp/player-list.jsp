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
            <h3>Search Player</h3>
            <br/>
            <form class="row g-3" action="search-player" method="post">
                <div class="col">
                    <input type="text" class="form-control" id="fullName" name="fullName" placeholder="Name">
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
              List<Player> players = Database.jdbi.withExtension(PlayerDAO.class, PlayerDAO::getPlayers);

              if (request.getAttribute("players") != null) {
                players = (List<Player>) request.getAttribute("players");
              }

              for (Player player : players) {
          %>
                <div class="card">
                    <div class="nickname greyborder">
                        <h4><b>Nickname</b></h4>
                        <h5><%= player.getNickname() %></h5>
                    </div>
                    <div class="greyborder">
                        <h5><b>Name</b></h5>
                        <h5><%= player.getFirstName() %> <%= player.getLastName() %></h5>
                    </div>
                    <div class="buttonsPlayer">
                        <a href="player-details.jsp?id=<%= player.getId() %>" class="btn btn-primary rounded-pill px-3">Details</a>
                        <a href="player-form.jsp?id=<%= player.getId() %>&action=edit&nickname=<%= player.getNickname()%>" class="btn btn-success rounded-pill px-3">Edit</a>
                        <a href="delete-player?id=<%= player.getId() %>" class="btn btn-danger rounded-pill px-3">Delete</a>
                    </div>
                </div>
          <%
              }
          %>

            <%@include file="includes/footer.jsp"%>
    </div>




</html>
