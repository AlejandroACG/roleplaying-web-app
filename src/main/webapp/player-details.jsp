<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.svalero.dao.Database" %>
<%@ page import="com.svalero.dao.CharacterDAO" %>
<%@ page import="com.svalero.dao.PlayerDAO" %>
<%@ page import="com.svalero.domain.Player" %>
<%@ page import="com.svalero.domain.Character" %>
<%@ page import="java.util.List" %>

<%@include file="includes/header.jsp"%>

<%
    String id_player = request.getParameter("id");
    Database.connect();
    Player player = Database.jdbi.withExtension(PlayerDAO.class, dao -> dao.getPlayer(id_player));
%>

<div class="content-render">
    <div class="detail-card card">
        <div class="nickname margins-cards">
            <h4 class="detail-card-label"><b><%= player.getNickname() %></b></h4>
        </div>
        <div class="detail-text">
            <h5><b>First Name: <%= player.getFirstName() %></b></h5>
            <h5><b>Last Name: <%= player.getLastName() %></b></h5>
            <h5><b>Email: <%= player.getEmail() %></b></h5>
            <h5><b>Registration date: <%= player.getRegistrationDate() %></b></h5>
        </div>
        <div class="margins-card button-container detail-button">
            <a href="character-form.jsp?playerId=<%=id_player%>&action=add" class="btn btn-primary rounded-pill px-5">Add new character</a>
        </div>
    </div>
</div>

<%@include file="includes/footer.jsp"%>


