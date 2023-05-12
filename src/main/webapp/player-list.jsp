<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.svalero.dao.Database" %>
<%@ page import="com.svalero.dao.CharacterDAO" %>
<%@ page import="com.svalero.dao.PlayerDAO" %>
<%@ page import="com.svalero.domain.Player" %>
<%@ page import="com.svalero.domain.Character" %>
<%@ page import="java.util.List" %>
<%@include file="includes/header.jsp"%>

<div class="col-lg-6 col-xxl-4 my-5 mx-auto">
        <div class="d-grid gap-2">
          <a href="player-form.jsp?action=add" class="btn btn-primary" type="button">Add new player</a>
        </div>
      </div>

    <div class="list-flex">

     <%
          Database.connect();
          List<Player> players = Database.jdbi.withExtension(PlayerDAO.class, PlayerDAO::getPlayers);
          for (Player player : players) {
      %>
            <div class="card">
                <div class="nickname greyborder">
                    <h4>First Name</h4>
                    <h5><%= player.getFirstName() %></h5>
                </div>
                <div class="greyborder">
                    <h5>Last Name</h5>
                    <h5><%= player.getLastName() %></h5>
                </div>
                <div class="buttonsPlayer">
                    <a href="" class="btn btn-primary rounded-pill px-3">Details</a>
                    <a href="" class="btn btn-danger rounded-pill px-3">Delete</a>
                    <a href="player-form.jsp?id=<%= player.getId() %>&action=edit&nickname=<%= player.getNickname()%>" class="btn btn-danger rounded-pill px-3">Edit</a>
                </div>
            </div>
      <%
          }
      %>
      </div>



<%@include file="includes/footer.jsp"%>
</html>
