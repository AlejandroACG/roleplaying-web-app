<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="includes/header.jsp"%>

    <h1 class="alingText"> Add a new player </h1>
    <h3 class="alingText"> Please, introduce the new player information to upload it to our database.</h3>

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
