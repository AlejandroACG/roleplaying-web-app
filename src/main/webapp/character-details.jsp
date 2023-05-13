<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.svalero.dao.Database" %>
<%@ page import="com.svalero.dao.CharacterDAO" %>
<%@ page import="com.svalero.dao.PlayerDAO" %>
<%@ page import="com.svalero.domain.Player" %>
<%@ page import="com.svalero.domain.Character" %>
<%@ page import="java.util.List" %>

<%@include file="includes/header.jsp"%>






<div class="content-render">

    <%
    String characterId = request.getParameter("id");

    Database.connect();
    Character character = Database.jdbi.withExtension(CharacterDAO.class, dao -> dao.getCharacter(characterId));

    Player player = character.getPlayer();
    %>

    <div class="detail-card card">
        <div class="nickname margins-cards">
            <h4 class="detail-card-label">Character First Name</h4>
            <h5><%= character.getFirstName() %></h5>
        </div>
        <div class="detail-text">
            <h5><b>Race:  </b><%= character.getRace() %></h5>
            <h5><b>Alignment:  </b><%= character.getAlignment() %></h5>
            <h5><b>Class:  </b><%= character.getCharacterClass() %></h5>
            <h5><b>Player: </b><%= player.getFirstName() %></h5>
            <h5><b>Lore:</b></h5>
            <p><%= character.getLore() %></p>

        </div>
    </div>
</div>

<%@include file="includes/footer.jsp"%>
