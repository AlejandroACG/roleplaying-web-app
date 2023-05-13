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
        String characterId = request.getParameter("characterId");

        Database.connect();
        Character character = Database.jdbi.withExtension(CharacterDAO.class, dao -> dao.getCharacter(characterId));

        Player player = character.getPlayer();
    %>

    <div class="detail-card card">
        <div class="nickname margins-cards">
            <h4 class="detail-card-label"></h4>
            <h5><b><%= character.getFirstName() %></b></h5>
        </div>
        <div class="detail-text">
            <h5><b>Race: <%= character.getRace() %></b></h5>
            <h5><b>Alignment: <%= character.getAlignment() %></b></h5>
            <h5><b>Class: <%= character.getCharacterClass() %></b></h5>
            <h5><b>Player: <%= player.getFirstName() %> <%= player.getLastName() %> (aka <%= player.getNickname() %>)</b></h5>
            <h5><b>Lore:</b></h5>
            <p><b><%= character.getLore() %></b></p>

        </div>
    </div>
</div>

<%@include file="includes/footer.jsp"%>
