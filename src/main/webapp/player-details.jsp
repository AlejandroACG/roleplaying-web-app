<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.svalero.dao.Database" %>
<%@ page import="com.svalero.dao.CharacterDAO" %>
<%@ page import="com.svalero.dao.PlayerDAO" %>
<%@ page import="com.svalero.domain.Player" %>
<%@ page import="com.svalero.domain.Character" %>
<%@ page import="java.util.List" %>

<%@include file="includes/header.jsp"%>

<div class="content-render">
    <div class="detail-card card">
        <div class="nickname margins-cards">
            <h4 class="detail-card-label">Nickname</h4>
        </div>
        <div class="detail-text">
            <h5><b>Last Name: </b>Last Name</h5>
            <h5><b>First Name: </b>First Name</h5>
            <h5><b>Email: </b>Email</h5>
            <h5><b>Registration date: </b>Registration date</h5>
        </div>
        <div class="margins-card button-container detail-button">
            <a href="" class="btn btn-primary rounded-pill px-5">Add new character</a>
        </div>
    </div>
</div>

<%@include file="includes/footer.jsp"%>


