<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.svalero.dao.Database" %>
<%@ page import="com.svalero.dao.PlayerDAO" %>
<%@ page import="com.svalero.domain.Player" %>
<%@include file="includes/header.jsp"%>

    <%
        String action = request.getParameter("action");
        Database.connect();
        Player player = Database.jdbi.withExtension(PlayerDAO.class, dao -> dao.getPlayer(request.getParameter("id")));
        if (action.equals("edit")) {
    %>
        <h1 class="alingText"> Edit player <%= player.getNickname() %> </h1>
        <h3 class="alingText"> Please, modify <%= player.getNickname() %>'s information to upload it to our database.</h3>
    <% } else { %>
        <h1 class="alingText"> Add new player </h1>
        <h3 class="alingText"> Please, introduce the new player information to upload it to our database.</h3>
    <%
       }

        if (action.equals("edit")) {}
    %>

    <form class="" method="post" action="" enctype="multipart/form-data">
        <div class="col-md-3">
            <label for="" class="form-label">New first name</label>
            <input type="text" class="form-control" id="" name="" value='' placeholder="First name">
        </div>
        <div class="col-md-3">
            <label for="" class="form-label">New last name</label>
            <input type="text" class="form-control" id="" name="" value='' placeholder="Last name">
        </div>
        <div class="col-md-3">
            <label for="" class="form-label">New nickname</label>
            <input type="text" class="form-control" id="" name="" value='' placeholder="Nickname">
        </div>
        <div class="col-md-3">
            <label for="" class="form-label">New email</label>
            <input type="text" class="form-control" id="" name="" value='' placeholder="Email">
        </div>
        <div class="col-md-3">
            <label for="" class="form-label">New registration date</label>
           <input type="date" class="form-control" id="" name="" value='' placeholder="Registration date">
         </div>

         <button type="submit" class="btn btn-primary rounded-pill px-3" value="">Add new user</button>

    </form>

<%@include file="includes/footer.jsp"%>
</html>
