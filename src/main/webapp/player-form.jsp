<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.svalero.dao.Database" %>
<%@ page import="com.svalero.dao.PlayerDAO" %>
<%@ page import="com.svalero.domain.Player" %>
<%@ page import= "java.time.LocalDate" %>
<%@ page import= "java.time.format.DateTimeFormatter" %>
<%@include file="includes/header.jsp"%>

    <%
        LocalDate localDate = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("MM-dd-yyyy");
        String action = request.getParameter("action");
        Database.connect();
        Player player = null;
        String firstName = null;
        String lastName = null;
        String nickname = null;
        String email = null;
        String registrationDate = null;
        if (action.equals("edit")) {
            player = Database.jdbi.withExtension(PlayerDAO.class, dao -> dao.getPlayer(request.getParameter("id")));
            firstName = player.getFirstName();
            lastName = player.getLastName();
            nickname = player.getNickname();
            email = player.getEmail();
            registrationDate = player.getRegistrationDate().format(formatter);
        }
        if (player == null) {
            firstName = "";
            lastName = "";
            nickname = "";
            email = "";
            registrationDate = "";
        }


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

    <form class="" method="post" action="addedit-player">
        <div class="col-md-3">
            <label for="firstName" class="form-label">First name</label>
            <input type="text" class="form-control" id="firstName" name="firstName" value="<%= firstName %>" required>
        </div>
        <div class="col-md-3">
            <label for="lastName" class="form-label">Last name</label>
            <input type="text" class="form-control" id="lastName" name="lastName" value="<%= lastName %>" required>
        </div>
        <div class="col-md-3">
            <label for="nickname" class="form-label">Nickname</label>
            <input type="text" class="form-control" id="nickname" name="nickname" value="<%= nickname %>" required>
        </div>
        <div class="col-md-3">
            <label for="email" class="form-label">Email</label>
            <input type="email" class="form-control" id="email" name="email" value="<%= email %>" required>
        </div>
        <div class="col-md-3">
            <label for="registrationDate" class="form-label">New registration date</label>
           <input type="date" class="form-control" id="registrationDate" name="registrationDate" value="<%= registrationDate %>" required>
         </div>
         <%
             if (action.equals("edit")) {
         %>
         <div class="col-md-6">
             <input type="hidden" name="id" value='<%= request.getParameter("id") %>'/>
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
